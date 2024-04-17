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
th {
    width: 150px;
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

    var randomCode;
    
    $(document).ready(function(){

    $('#mem_id').on( 'blur',
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

                            if (res_data.result) {  //사용가능 ID

                                // $("#btn_register").attr("disabled",false); //사용 가능하도록 활성화 처리
                                $("#check_id").html("사용가능한 아이디 입니다").css(
                                        "color", "blue");
                                //isIdvalue=true;
                            } else { //이미 사용중 ID라면 회원가입 버튼 비활성화

                                $("#signup__bnt").attr("disabled",
                                        true);
                                $("#check_id").html("사용이 불가한 ID입니다.")
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
                  $("#zipcode").val(data.zonecode); 
                  $("#addr").val(data.roadAddress);
              
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
                dataType:"json",
                success: function(response) {
                  
                    randomCode = response.randomCode;
                    //console.log(response); // json 객체로 콘솔에 출력
                    alert('이메일로 코드가 발송되었습니다.');
                    document.querySelector('.confirm').style.display = 'table-row';
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

        if (userInput == randomCode) {
            alert('인증되었습니다.');
            $("#check_pwd_msg").html("인증 코드 확인.").css("color", "blue");

        } else {

            $("#check_pwd_msg").html("인증 코드 불일치.").css("color", "red");
            alert('인증 코드가 일치하지 않습니다. 다시 시도해주세요.');
            if (check_pwd=='') {
              check_pwd.value='';
              check_pwd.focus();
              return;
            }
            
        }
       
    }

    const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    var regula_phone = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
        function validateEmail(email) {
            return regular_email.test(email);
        }
      //이메일 정규식
      //const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
     
      function signin(f) {
              
          //폼에서 입력된값 체크...
          let mem_name = f.mem_name.value.trim();
          let mem_id = f.mem_id.value.trim();
          let mem_pwd = f.mem_pwd.value.trim();
          let mem_birth = f.mem_birth.value.trim();
          let mem_gender = f.mem_gender.value.trim();
          let mem_phone = f.mem_phone.value;
          let mem_email = f.mem_email.value;
          let check_pwd = f.check_pwd.value.trim();
          let mem_zipcode = f.mem_zipcode.value;
          let mem_addr = f.mem_addr.value;
          
          if (mem_name=='') {
              alert('이름을 입력하세요!')
              f.mem_name.value='';
              f.mem_name.focus();
              return;
          }

          if (mem_id =='') {
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
          
          if (mem_birth==='') {
              alert('생년월일을 선택하세요!')
              f.mem_birth.focus();
              return;
          }

          if (mem_gender!=='여자' && mem_gender !=='남자') {
              alert('성별을 선택하세요!')
              f.mem_gender.focus();
              return;
          }

          if (mem_email=='') {
              alert('이메일을 옳바른 형식으로 입력하세요!')
              f.mem_email.value='';
              f.mem_email.focus();
              return;
          }
          if(regular_email.test(mem_email)==false) {
              alert('이메일을 옳바른 형식으로 입력하세요!')
              f.mem_email.value='';
              f.mem_email.focus();
              return;
          }
          
          if (check_pwd=='') {
              alert('이메일 인증을 완료해주세요')
              f.mem_email.focus();
              return;
          }
          if (regula_phone.test(mem_phone)==false) {
              alert('폰번호을 옳바른 형식으로 입력하세요!')
              f.mem_phone.value='';
              f.mem_phone.focus();
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

     

    function enableSignupButton() {
        // const mem_name = document.getElementById("mem_name").value.trim();
        // const mem_id = document.getElementById("mem_id").value.trim();
        // const mem_pwd = document.getElementById("mem_pwd").value.trim();
        // const mem_email = document.getElementById("mem_email").value;
        // const mem_zipcode = document.getElementById("zipcode").value;
        // const mem_addr = document.getElementById("addr").value;
        // const check_pwd = document.getElementById("check_pwd").value;

       // const isValidEmail = validateEmail(mem_email);

        if (mem_name && mem_id && mem_pwd && mem_birth && mem_gender && mem_email && mem_phone && mem_zipcode && mem_addr ) {
            // 모든 필수 입력란에 값이 있고 올바른 이메일 형식이라면 회원가입 버튼 활성화
            document.getElementById("signup__bnt").disabled = false;
        } else {
            // 하나라도 입력란이 비어있거나 이메일 형식이 올바르지 않으면 회원가입 버튼 비활성화
            document.getElementById("signup__bnt").disabled = true;
        }
    }
    
    //document.getElementById("mem_email").addEventListener("input", enableSignupButton);
    
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
            <input type="hidden" name="kakaoid" value="${ param.kakaoid }">
            <!-- <input type="hidden" id="kakaoUserInfo" value="${kakaoUserInfo}"> -->
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
                        <span id="check_id"></span>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input id="mem_pwd" name="mem_pwd" type="password"  class="mem_pwd" />
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <label>
                        <input type="date" name="mem_birth" required pattern="\d{4}-\d{2}-\d{2}" value="" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        생년월일을 입력하세요.</label>
                        
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <select class="form-control" name="mem_gender" id="mem_gender" aria-valuetext="성별을 선택하세요" >
                            <option disabled selected>성별을 선택하세요</option>
                            <option value="남자">남자</option>
                            <option value="여자">여자</option>
                        </select>
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
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br><span id="check_pwd_msg"></span>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" placeholder="형식 : 010-0000-000" id="mem_phone" class="show" name="mem_phone" />
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">주소</th>
                    <td>
                        <div style="display: inline-flex; align-items: center;">
                            <input type="text" placeholder="우편번호" class="zipcode" id="zipcode" name="mem_zipcode"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="button" type="button" value="주소검색" onclick="find_addr();">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <input type="text" placeholder="주소" class="addr" id="addr" name="mem_addr" />  
                    </td>
                </tr>

            </table>
            
            <!-- sign up button -->
            <button class="signin__btn signup__bnt" onclick="signin(this.form); return false;">
                sign up
            </button>
        </form>

            
        <!-- separator -->
        <!-- <div class="separator">
            <p>OR</p>
        </div> -->
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