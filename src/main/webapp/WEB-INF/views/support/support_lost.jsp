<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
--><html><head><title>Film Match</title>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


  <style type="text/css">
	* {box-sizing: border-box;}

body {
  font-family: Arial;
	}
 .box {
	width: 350px;
	height: 280px;
	float: left;
	margin-right: 30px;
	padding-bottom: 100px; /* 아래쪽으로 간격을 벌립니다. */
}





* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}


</style>
</head>
<body>

<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="one">
			<div class="container">
				<div class="row">
				  <div class="col-sm-3">
					
					<h2>고객센터</h2>
					<p></p>
					<ul class="nav nav-pills nav-stacked">
					  	<li class="active"><a href="support_home.do">고객센터홈</a></li>
					  
					  	<li><a href="notice.do">공지사항</a></li>
						
						<li><a href="faq.do">자주찾는질문</a></li>

					  	<li><a href="qna.do">1:1문의</a></li>

						<li class="active"><a href="lost.do">분실물문의</a></li>
					</ul>
					<hr class="hidden-sm hidden-md hidden-lg">
				  </div>
				  <div class="col-sm-8">

						<h2>고객센터홈</h2>
						
						<!-- <p>빠른검색</p> -->
						<form class="example" action="/action_page.php">
							
  							<input type="text" placeholder="검색어를 입력하세요.." name="search">
  							<button type="search-bar" class="btn btn-primary"><i class="fa fa-search"></i></button>
						</form>
					  	<br>

				   <div class="col">

					<div class="box">
						<h3>1:1문의</h3>
					  <p>해결되지않은 문제가 있나요?</p>
					  <p>1:1문의로 문의주세요</p>
					</div>

				    <div class="box">
						<h3>자주찾는질문</h3>
					  <p>자주찾는질문</p>
					  <p>빠르고 간편하게 검색하세요</p>
					</div>

					<div class="box">
						<h3>분실문 문의</h3>
					  <p>상영관 내 분실물이 있나요?</p>
					  <p>분실문 문의로 문의주세요</p>
					</div>
					
				   </div>

				   <div class="col-sm-12">
					<br>
					<br>
					<br>
					
					</div>
				   	
					<div class="col-sm-12">
						<hr>
						
					</div>
					
					
					

				   	

					<div class="col-sm-6">
					  <h3>자주찾는질문BEST5</h3>
					  <div class="fakeimg">Fake Image</div>
					  <p>Some text..</p>
					<p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
				  </div>

				 </div>
				</div>
				
				</div>
			  </div>
			
    
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>


