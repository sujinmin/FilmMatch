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

  <script type="text/javascript">
    function login(){
	    
        location.href="../member/login_form.do?url=" + encodeURIComponent(location.href) ;
 	}
 	</script>

  <style type="text/css">
	
	* {box-sizing: border-box;}

.container{
	width: 1400px;
	height: 1100px;
}



#search_box{
	width: 300px;
	height: 60px;
	
}

.search-bar{
	width: 500px;
	height: 60px;
	margin-left: 180px;
	margin-top: -3px;
}




body {
  font-family: Arial;
	}
 .box {
	width: 300px;
	height: 250px;
	float: left;
	margin-right: 30px;
	padding-bottom: 100px; /* 아래쪽으로 간격을 벌립니다. */
	border: 1px solid transparent !important;
}

.col-sm-3{
	width: 402px;
	
	
}

.col-sm-4{
	width: 490px;
	height: 360px;
	margin-top: -10px;
	font-size: small;
}

.col{
	width: 1080px;
	height: 284px;
	font-size: medium;
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
			<div class="container" style="border: 1px solid transparent;">
				<div class="row">
				  <div class="col-sm-3" style="border: 1px solid transparent;">
					
					<h2>고객센터</h2>
					<p></p>
					<ul class="nav nav-pills nav-stacked">
					  	<li class="active"><a href="home.do">고객센터홈</a></li>
					  
					  	<li><a href="notice.do">공지사항</a></li>
						
						<li><a href="faq.do">자주찾는질문</a></li>

					  	<li><a href="qna.do">1:1문의</a></li>

						<li><a href="reviewer.do">평론가</a></li>
					</ul>
					<hr class="hidden-sm hidden-md hidden-lg">
				  </div>
				  
				  <div class="col-sm-9" style="border: 1px solid transparent;" > 
					
						<h2>고객센터홈</h2>
						
						<h5>Film Match 고객센터 페이지입니다.</h5>
						<br>

						
						  <!-- <div id="search_box" class="row" >
							<form class="form-inline" action="">  
							
								  <select id="search" name="search" class="form-control" style="float:left;height:40px;";>
									  <option value="all">전체보기</option>
									  <option value="name">이름</option>
									  <option value="subject">제목</option>
									  <option value="content">내용</option>
									  <option value="name_suject_content">이름+제목+내용</option>
									  
								  </select>
							

								  
								 
								<div class="search-bar" style="width:700px;" >
									

  									<input type="text" placeholder="검색어를 입력하세요.." name="search" style="float:left;width:500px;height:40px;">
						  			<button type="search-bar" class="btn btn-primary";>
									<i class="fa fa-search"style="float:left;height:20px;"></i>
									</button>
								</div>
								</form>
							</div>기능구현하지못함으로 주석처리 -->



						</div>	

					  	<br>

				   <div class="col" style="border: 1px solid transparent;" style= "margin-left:50px;">
					<!-- style="border: 1px solid black;"임시보더로 간격맞추기 -->
					<div class="box">
						<h3><a href="qna.do">1:1문의</a></h3>
					  <p><a href="qna.do">해결되지않은 문제가 있나요?</a></p>
					  <p><a href="qna.do">1:1문의로 문의주세요</a></p>
					</div>

				    <div class="box" style= "margin-left:20px;">
						<h3><a href="faq.do">자주찾는질문</a></h3>
					  <p><a href="faq.do">자주찾는질문</a></p>
					  <p><a href="faq.do">빠르고 간편하게 검색하세요</a></p>
					</div>

					<div class="box" style= "margin-left:10px;">
						<h3><a href="reviewer.do">평론가</a></h3>
					  <p><a href="reviewer.do">평론가 한마디</a></p>
					  <p><a href="reviewer.do">평론가의 의견을 확인해보세요</a></p>
					</div>
					
				   </div>

				   
				   <div></div>
				   	
					<div></div>
					
				   </div>
				   <br>
				   

				
				  
				  <div class="col-sm-4" style="border: 1px solid black;margin-left: 360px;">
					<div class="tit-area"><h3 class="tit medium">자주찾는질문 BEST5</h3>
						<a href="faq.do" class="more" title="더보기">더보기</a></div>
					
						<table class="table-wrapper" style="float:left;"> 
							<!-- 테이블 헤더 -->
							<!-- <tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								
							</tr>  -->
							
							<!-- 게시글 목록 -->
							<c:forEach var="faq" items="${ faq_list }" varStatus="i">
								
								<tr>
									<!-- 번호 -->
									<td>
										${i.count}
									</td>                                             
									
									<!-- 제목 -->
									<td class="f_subject">
										<c:if test="${ faq.f_use eq 'y' }">
										<a href="faq_view.do?f_idx=${ faq.f_idx }&page=${ empty param.page ? 1 : param.page }">${ faq.f_subject }</a>
										<br>
										</c:if>
									</td>
								
									
									<!-- 작성일 -->
									<td class="f_regdate">
										${ fn:substring(faq.f_regdate,0,10)}
									</td>
									
								</tr>
							</c:forEach>
							
							<!-- 게시물이 없는 경우 -->
							<c:if test="${empty faq_list}">
								<tr>
									<td colspan="4" align="center">
										<font color="red">등록된 게시글이 없습니다.</font>
									</td>
								</tr>
							</c:if>
							
							
						</table>
					</div>

					<div class="col-sm-4" style="border: 1px solid black;margin-left: 100px;">
						<div class="tit-area"><h3 class="tit medium">공지사항 Recent</h3>
							<a href="notice.do" class="more" title="더보기">더보기</a></div>

						<table class="table-wrapper" style="float:left;"> 
							<!-- 테이블 헤더 -->
							<!-- <tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								
							</tr> -->
							
							<!-- 게시글 목록 -->
							<c:forEach var="notice" items="${ notice_list }" varStatus="i">
								
								<tr>
									<!-- 번호 -->
									<td>
										${i.count}
									</td>                                             
									
									<!-- 제목 -->
									<td class="n_subject" >
										<c:if test="${ notice.n_use eq 'y' }">
										<a href="notice_view.do?n_idx=${ notice.n_idx }&page=${ empty param.page ? 1 : param.page }">${ notice.n_subject }</a>
										<br>
										</c:if>
									</td>
									
									<!-- 작성일 -->
									<td class="n_regdate">
										${ fn:substring(notice.n_regdate,0,10)}
									</td>
									
								</tr>
							</c:forEach>
							
							<!-- 게시물이 없는 경우 -->
							<c:if test="${empty notice_list}">
								<tr>
									<td colspan="4" align="center">
										<font color="red">등록된 게시글이 없습니다.</font>
									</td>
								</tr>
							</c:if>
							
							
						</table>
					</div>
					 <br>

			  </div>
			</div>
		  </div>
		</div>
			
    
  </section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>


