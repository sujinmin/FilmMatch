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
<script src="${ pageContext.request.contextPath }/js/member/login.js"></script>
 <!-- DAUM 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



</head>
<body>
    <header id="header">
        <!-- <a href="../index.do"><span class="film">Film</span><span class="match">Match</span>&emsp;</a> -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
    </header>

    <div class="container">
        <!-- Heading -->
        <h1>SIGN IN</h1>
    
        <!-- Links -->
        <ul class="links">
            <li>
                <a href="#" id="signin">SIGN IN</a>
            </li>
            <li>
                <a href="#" id="signup">SIGN UP</a>
            </li>
            <li>
                <a href="${ pageContext.request.contextPath }/index.do" id="Home">Home</a>
            </li>
        </ul>
    
        <!-- Form -->
        <form>
            <!-- ID input -->
            <div class="first-input input__block first-input__block">
                <input type="text" placeholder="ID" class="input mem_id" id="ID" name="mem_id" value="${ param.mem_id}" />
            </div>
            <!-- password input -->
            <div class="input__block">
                <input type="password" placeholder="Password" class="input" id="password" class="show mem_pwd" name="mem_pwd" />
            </div>
            <!-- repeat password input -->
            <div class="input__block">
                <input type="password" placeholder="Repeat password" class="input repeat__password show" id="repeat__password" />
            </div>
            <!-- 이름 -->
            <div class="input__block">
                <input type="text" placeholder="name" id="mem_name" class="show" name="mem_name" />
            </div>
            <!-- 이메일 -->
            <div class="input__block">
                <input type="text" placeholder="email" id="mem_email" class="show" name="mem_email" />
            </div>
            <!-- 주소 -->
            <div class="signup">
				<input class="show input__block button" type="button" value="주소검색" onclick="find_addr();">
				<input type="text" placeholder="우편번호" class="input__block show zipcode" id="mem_zipcode"/>
				<input type="text" placeholder="주소" class="input input__block show addr" id="mem_addr" />
            </div>
            
            
            <!-- 버튼 -->

            <!-- sign in button -->
            <button class="signin__btn" onclick="login()">
                Log in
            </button>
            <button class="signin__btn signup__bnt" onclick="signup()">
                sign up
            </button>
        </form>
        <!-- separator -->
        <div class="separator">
            <p>OR</p>
        </div>
        <!-- google button -->
        <button class="google__btn">
            <i class="fa fa-google"></i>
            Sign in with Google
        </button>
        
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-Mp2lmgwoWVFDVgYp5Kj4J0lvfAdr9dYBK6nHToKcWxTtJ5e4HQUmXAZa+IcKKw1z6BLzoNgu18IKplPXOZFODg==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
        <!-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> -->
        
        <!-- kakao button -->
        <button class="kakao__btn" onclick="kakao__btn()">
            <i class="fab fa-kakao"></i>
            Sign in with Kakao
        </button>
        <!-- GitHub button -->
        <button class="github__btn">
            <i class="fa fa-github"></i>
            Sign in with GitHub
        </button>
    </div>
    
    <footer>
       
    </footer>
</body>
</html>