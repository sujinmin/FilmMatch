<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.datatable-dropdown {
    display: none;
}

</style>

<!-- <link href="../js/member/login.js"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:500,800" rel="stylesheet">
<!-- JS code -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<!-- <script src="${ pageContext.request.contextPath }/js/member/login.js"></script> -->
 <!-- DAUM 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    $(document).ready(function(){

        $('#mem_id').on(
						'blur',
						function() {
                        //console.log('실행');
							//가입 버튼 기능 disable attr<--테그의 속성값
							// $("#btn_register").attr("disabled", true); //일단 무조건 비활성화
							//         $("#mem_id")<--이벤트를 발생시킨 주체는 this
							let mem_id = $(this).val();

							if (mem_id.length < 3) {
								$("#signup__bnt").attr("disabled", true); //회원가입 버튼 비활성화
								$("#id_msg").html("id는 3자리 이상 입력하세요!").css( //빨간글씨로 알림
										"color", "red");
								return;
							}

							$.ajax({
								url : "check_id.do",
								data : {
									"mem_id" : mem_id
								},//넘어갈 파라미터 
								dataType : "json",
								success : function(res_data) {
									// res_data ={"result":true} or {"result":false}

									if (res_data.result) {
										//사용가능 ID
										// $("#btn_register").attr("disabled",false); //사용 가능하도록 활성화 처리
										$("#id_msg").html("사용가능한 아이디 입니다").css(
												"color", "blue");
										//isIdvalue=true;
									} else {
										//이미 사용중 ID라면 회원가입 버튼 비활성화
										$("#signup__bnt").attr("disabled",
												true);
										$("#id_msg").html("사용이 불가한 ID입니다.")
												.css("color", "red");
										//isIdvalue=false;
									}
								},
								error : function(err) {
									alert(err.responseText);
								}
							});
						});
    })//end: $(document).ready()\
  
      function find_addr() {
          new daum.Postcode({
              oncomplete: function(data) { //json
                  //data = {"zonecode":"13529", "address":"경기 성남시 분당구",..."}
                  // 주소창에서 선택된 주소값을 입력창에 넣어준다
                  $("#mem_zipcode").val(data.zonecode);
                  $("#mem_addr").val(data.roadAddress);
              
              }
          }).open();
      }//end: fine_addr()
      
      function check() {
        var emailInput  = document.getElementById('mem_email');
        var email = emailInput.value;
        
        if (regular_email.test(email)==false) {
              alert('이메일을 입력하세요!')
              emailInput .value='';
              emailInput .focus();
              return;
          }
        //console.log(email); //보네는email확인
            $.ajax({
                type: 'GET',
                url: '/member/send_email.do', // send_email.do의 URL
                data: { email: email }, // 이메일 주소를 파라미터로 전달
                success: function(response) {
                    //console.log('이메일 전송 성공');
                    console.log(response); // 서버로부터의 응답을 콘솔에 출력
                    console.log($.ajax.data);
                    //console.log(data.generateRandomCode); // 서버로부터의 응답을 콘솔에 출력
                    alert('이메일로 코드가 발송되었습니다.');
                    document.querySelector('.confirm').style.display = 'table-row';
                    //console.log(code);
                },
                error: function(xhr, status, error) {
                    console.error('이메일 전송 실패');
                    console.error(error); // 에러 메시지 출력
                    alert('이메일 전송에 실패했습니다. 다시 시도해주세요.');
                }
            });
       
      }

      function confirmAction() {
        var userInput = document.getElementById('check_pwd').value; // 입력란에 입력된 코드

// 서버로부터 세션에 저장된 이메일 코드를 받아오는 AJAX 요청
$.ajax({
    type: 'GET',
    url: '/member/get_email_code.do', // 세션에 저장된 이메일 코드를 받아오는 URL
    success: function(response) {
        var randomCode = response; // 서버로부터 받은 세션에 저장된 이메일 코드를 변수에 저장
        // 이메일로부터 받은 코드와 입력란에 입력된 코드를 비교하여 일치 여부 확인
        if (userInput === randomCode) {
            alert('인증되었습니다.');
            // 인증 성공 후 추가 작업 수행 (예: 회원가입 폼 제출 등)
        } else {
            alert('인증 코드가 일치하지 않습니다. 다시 시도해주세요.');
            // 인증 실패 시 사용자에게 메시지 표시 또는 다른 조치 수행
        }
    },
    error: function(xhr, status, error) {
        console.error('세션에 저장된 이메일 코드 요청 실패');
        console.error(error); // 에러 메시지 출력
        alert('세션에 저장된 이메일 코드를 가져오는 데 실패했습니다. 다시 시도해주세요.');
    }
});
    }

      //이메일 정규식
      const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
      function signin(f) {
              
          //폼에서 입력된값 체크...
          let mem_name = f.mem_name.value.trim();
          let mem_id = f.mem_id.value.trim();
          let mem_pwd = f.mem_pwd.value.trim();
          let mem_email = f.mem_email.value;
          let mem_zipcode = f.mem_zipcode.value;
          let mem_addr = f.mem_addr.value;
          
          if (mem_name=='') {
              alert('이름을 입력하세요!')
              f.mem_name.value='';
              f.mem_name.focus();
              return;
          }

          if (mem_id=='') {
              alert('아이디을 입력하세요!')
              f.mem_id.value='';
              f.mem_id.focus();
              return;
          }
          
          if (mem_pwd=='') {
              alert('비밀번호을 입력하세요!')
              f.mem_pwd.value='';
              f.mem_pwd.focus();
              return;
          }
          
          if (regular_email.test(mem_email)==false) {
              alert('이메일을 옳바른 형식으로 입력하세요!')
              f.mem_email.value='';
              f.mem_email.focus();
              return;
          }
          
          if (mem_zipcode=='') {
              alert('우편번호을 입력하세요!')
              f.mem_zipcode.value='';
              f.mem_zipcode.focus();
              return;
          }
          if (mem_addr=='') {
              alert('주소을 입력하세요!')
              f.mem_addr.value='';
              f.mem_addr.focus();
              return;
          }
          alert('회원가입이 되었습니다.')
          f.action = "insert.do"; //MemberInsertAction
          f.submit();				//전송	
      }
    
    
   </script>


</head>
<body>
    <header id="header">
        <!-- <a href="../index.do"><span class="film">Film</span><span class="match">Match</span>&emsp;</a> -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
    </header>

    <div class="container">
        <!-- Heading -->
        <h1 >회원가입</h1>
    
        <div>
            <br>
            <br>
            <br>
        </div>
    
        <!-- Form -->
        <form>
            <!-- ID input : first-input input__block first-input__block -->
            <input type="hidden" id="${ param.ID}" name="${ param.ID}">
            <input type="hidden" id="kakaoUserInfo" value="${kakaoUserInfo}">
            <input type="hidden" name="policy_a" value="${ param.policy_a}">
            <input type="hidden" name="policy_b" value="${ param.policy_b}">
            <div><input type="button" onclick="location.href='login_form.do'" value="로그인"></div>
            <table>
                <tr>

                    <th>이름</th>
                    <td>
                        <input type="text" id="mem_name" class="show" name="mem_name" />
                    </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" class="mem_id" name="mem_id" id="mem_id"  />
                        <span id="id_msg" ></span>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input id="mem_pwd" name="mem_pwd" type="password"  class="mem_pwd" />
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td style="display: inline-flex; align-items: center;">
                        <input type="text" placeholder="형식 : ***@***.com" id="mem_email" class="show" name="mem_email" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="이메일 인증" onclick="check();">
                    </td>
                </tr>
                <tr class="confirm" style="display: none;">
                    <th>코드 인증</th>
                    <td style="display: inline-flex; align-items: center;">
                        <input type="text" id="check_pwd" class="show" name="check_pwd" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="인증" onclick="confirmAction();">
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" placeholder="형식 : 010-0000-000" id="mem_phone" class="show" name="mem_phone" />
                    </td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td style="display: inline-flex; align-items: center;">
                        <input type="text" placeholder="우편번호" class="input__block show zipcode" id="mem_zipcode" name="mem_zipcode"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="show input__block button" type="button" value="주소검색" onclick="find_addr();">
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" placeholder="주소" class="input input__block show addr" id="mem_addr" name="mem_addr" />  
                    </td>
                </tr>

            </table>
            <button class="signin__btn signup__bnt" onclick="signin(this.form);">
                sign up
            </button>

            <!-- sign up button -->
            
        </form>
        <!-- separator -->
        <div class="separator">
            <p>OR</p>
        </div>
        <!-- google button -->
        <!-- <button class="google__btn">
            <i class="fa fa-google"></i>
            Sign in with Google
        </button> -->
            
        <!-- kakao button -->
        <!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <a onclick="kakao_login"><img src="../image/kakao_login.png" /></a>

        <button class="kakao__btn" onclick="kakao__btn()">
            <i class="fab fa-kakao"></i>
            Sign in with Kakao
        </button> -->

        <!-- GitHub button -->
        <!-- <button class="github__btn">
            <i class="fa fa-github"></i>
            Sign in with GitHub
        </button> -->
    </div>
    
    <footer>
       
    </footer>
</body>
</html>