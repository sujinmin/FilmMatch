<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link href="../js/member/login.js"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:500,800" rel="stylesheet">
<!-- JS code -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="${ pageContext.request.contextPath }/js/member/login.js"></script> -->
<script type="text/javascript">
	function send(f) {
		//ID/PWD체크
		let mem_id = f.mem_id.value.trim();
		let mem_pwd = f.mem_pwd.value.trim();
		
		if (mem_id=='') {
			alert('아이디를 입력하세요');
			f.mem_id.value='';
			f.mem_id.focus();	
			return;
		}
		if (mem_pwd=='') {
			alert('비밀번호를 입력하세요');
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			return;
		}
		
		f.action="login.do" //MemberLoginAction
        console.log("회원 아이디:", mem_id);
		f.submit();
		
	}
		
</script>
<script type="text/javascript">
	//$(document).ready(); //jquery $
	
	window.onload=function(){
		//show_message();
		setTimeout(show_message,100); //0.1초
		
	};
	function show_message() {
		
		//login_form.do?reason=fail_id
		if ("${ param.reason eq 'fail_id'}"=="true") { // El $ '문자열'의 true
			alert("아이디가 틀렸습니다.");

		} 
		//login_form.do?reason=fail_pwd
		if ("${ param.reason eq 'fail_pwd'}"=="true") { // El $ '문자열'의 true
			alert("비밀번호가 틀렸습니다.");

		} 
		 
	} 
	
</script>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<!-- <script>
Kakao.init('1d30a1c42221c4c7f9bde6d740b59e00'); //발급받은 키 중 javascript키를 사용해준다.
console.log("로그인 가능"+Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
            window.location.href = "../member/signup_form.do"; //성공시 메인화면으로 
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log("로그아웃 성공!!")
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script> -->
<script>
  // 카카오 SDK 초기화
  Kakao.init('6784459c01933192e7189973c6eddbcc'); //발급받은 키 중 javascript키를 사용해준다.1d30a1c42221c4c7f9bde6d740b59e00
  console.log("로그인 가능"+Kakao.isInitialized()); // sdk초기화여부판단

  // 카카오 로그인 함수
  function kakaoLogin() {
    if(confirm("14세 이상에 동의합니다.")==false) return;

      Kakao.Auth.login({
        success: function (response) {
            
            // 카카오 로그인 성공 시 사용자 정보를 요청
            Kakao.API.request({   url: '/v2/user/me',
                                  success: function (response) 
                                  {
                                  // 로그인 성공 시 사용자 정보를 서버로 전송하는 함수 호출
                                  //sendUserInfoToServer(response);
                                    console.log("로그인 성공 : "+response.id);
                                    //console.log(response);
                                    alert(response.id);

                                  $.ajax({
                                            type: "POST",
                                            url: "../member/save-kakao-user-info.do",

                                            data: { "id" : response.id }, // 사용자 ID를 파라미터로 전달
                                            dataType:"json",
                                            success: function (data) { 
                                              if(data.result){
                                                // data = {"result": true}
                                                console.log("ajax 사용자 정보 전송 성공");
                                                location.href="../index.do";
                                              }else{
                                                 // data = {"result":false}
                                                 //가입폼
                                                 location.href="../member/signup_form.do?kakaoid=" + response.id +"&policy_a=Y&policy_b=Y";

                                              }
                                            },
                                            error: function (xhr, status, error) {
                                              console.error("사용자 정보 전송 실패:", error);  
                                            }
                                  }); 
                    
                                  },
                                  fail: function (error) {
                                    console.log('카카오 사용자 정보 요청 실패:', error);
                                  }
            });
                  // window.location.href = "../member/save-kakao-user-info.do"; 
                  //세션에 저장 후 성공시 회원가입 
        },
        fail: function (error) {
              console.log('카카오 로그인 실패:', error);
              alert("카카오 로그인 실패");
        }
      });
  }
  
  // 카카오 로그아웃 함수
  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
              url: '/v1/user/unlink',
              success: function (response) {
                  console.log('카카오 로그아웃 성공:', response);
              },
              fail: function (error) {
                  console.log('카카오 로그아웃 실패:', error);
              }
          });
          Kakao.Auth.setAccessToken(undefined);
      }
  }
  
  // 서버로 사용자 정보를 전송하는 함수
  // function sendUserInfoToServer(userInfo) {
  //     $.ajax({
  //         url: '/save-kakao-user-info.do',
  //         type: 'json',
  //         contentType: 'application/json',
  //         data: JSON.stringify(userInfo),
  //         success: function (response) {
  //             console.log('서버에 사용자 정보 전송 성공:', response);
  //             // 로그인 성공 후 메인 화면으로 이동
  //             window.location.href = '../member/signup_form.do';
  //         },
  //         error: function (xhr, status, error) {
  //             console.log('서버에 사용자 정보 전송 실패:', error);
  //         }
  //     });
  // }
  </script>

</head>
<body>
    <header id="header">
        <!-- <a href="../index.do"><span class="film">Film</span><span class="match">Match</span>&emsp;</a> -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
    </header>

    <div class="container">
        <!-- Heading -->
        <h1 >SIGN UP</h1>
    
        <div>
            <br>
            <br>
            <br>
        </div>
    
        <!-- Form -->
        <form>
            <!-- ID input : first-input input__block first-input__block -->
            
            <div><input type="button" onclick="location.href='policy.do'" value="회원가입"></div>
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" placeholder="ID" class="input mem_id" id="ID" name="mem_id" value="${ param.mem_id}" />
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" placeholder="Password" class="input" id="password" class="show mem_pwd" name="mem_pwd" />
                    </td>
                </tr>

            </table>
            <button class="signin__btn" value="로그인" onclick="send(this.form)">
                log in
            </button>

            <!-- sign up button -->
            
        </form>
        <!-- separator -->
        <div class="separator">
            <p>OR</p>
        </div>
            
        <!-- kakao button -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
            
            <div  style="text-align: center; " >
            <a onclick="kakaoLogin();" href="javascript:void(0)" >
                <img src="../image/kakao_login.png"/>
            </a>
            </div>

        
            <!-- <button onclick="kakaoLogin();">
              <a  href="javascript:void(0)" >
                  <span>카카오 로그인</span>
              </a>
            </button> -->

            <div onclick="kakaoLogout();">
              <a href="javascript:void(0)">
                  <span>카카오 로그아웃</span>
              </a>
            </div>

        
        <!-- <button class="kakao__btn " onclick="send(this.form);">
            <i class="fab fa-kakao"></i>
            login in with Kakao
        </button> -->

    </div>
    
    <footer>
       
    </footer>
</body>
</html>