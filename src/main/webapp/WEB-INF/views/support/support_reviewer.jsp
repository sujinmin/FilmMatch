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

	 function send() {
		
		
		
		//글쓰기 폼으로 이동
		location.href="reviewer_insertform.do"; 
		
	}

	$(document).ready(function(){//제이쿼리문
		
		if("${ not empty param.search }"=="true"){
			
			$("#search").val("${ param.search }");
		}
		
		//전체보기면 검색어 지워라
		if("${ param.search eq 'all'}"== "true"){
			
			$("#search_text").val("");
		}
		
	});

	function find(){
	  
	  let search		=	$("#search").val();
	  let search_text	=	$("#search_text").val().trim();
	  
	  //전체검색이 아닌데 검색어가 비어있으면 //내가 넘기는 데이터가 uft-8이면 생략해도됌
	                                          //단 특수문자 & 문자(한글)를 넘기려면 encode uft-8입력
	  if(search!='all' && search_text==''){
		  alert('검색어를 입력하세요!!');
		  $("#search_text").val("");
		  $("#search_text").focus();
		  return;
	  }
	  
	  location.href="reviewer.do?search=" + search  +  "&search_text="   + encodeURIComponent(search_text,"uft-8") ;
			       
     }// end: find()


 	</script>

<style type="text/css">

* {box-sizing: border-box;}

.container{
	width: 1300px;
	height: 1300px;
}

#search_box{
	width: 200px;
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
	width: 350px;
	height: 280px;
	float: left;
	margin-right: 30px;
	padding-bottom: 100px; /* 아래쪽으로 간격을 벌립니다. */
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

					  	<li><a href="home.do">고객센터홈</a></li>
					  
					  	<li><a href="notice.do">공지사항</a></li>
						
						<li><a href="faq.do">자주찾는질문</a></li>

					  	<li><a href="qna.do">1:1문의</a></li>

						<li class="active"><a href="reviewer.do">평론가</a></li>
					</ul>
					<hr class="hidden-sm hidden-md hidden-lg">
				  </div>
				  <div class="col-sm-8">

						<h2>평론가 게시판</h2>
						
						<div id="search_box" class="row" >
							<form class="form-inline">  
							
								  <select id="search" name="search" class="form-control" style="height: 40px; width: 179px; float:left;";>
									  <option value="all">전체보기</option>
									  <option value="name">이름</option>
									  <option value="subject">제목</option>
									  <option value="content">내용</option>
									  <option value="name_subject_content">이름+제목+내용</option>

								  </select>
							
	
								  
								 
								<div class="search-bar" style="width:700px;">
									
									                                                                           <!-- 검색창에 검색어가 없어서 null이어도 null 표시하지 않음 -->
									  <input type="text" placeholder="검색어를 입력하세요.." name="search_text" value="${  param.search_text eq 'null' ? '' : param.search_text}" style="float:left;width:500px;height:40px;">
									  <button type="search-bar" class="btn btn-primary";   onclick="find();return false;">
									<i class="fa fa-search" style="float:left;height:20px;"></i>
									</button>
								</div>
	
									
							</form>
						   </div>
						</div>
					  	<br>

				   <div class="col-sm-8">
					<!-- 이 if태그는 mem_grade가 "평론가"이지만 임시로 일반등급 -->
					<!-- 123여기는 아무에게나 보이고 -->
					<!-- 평론가만 평론글남기기 가능 -->
					<c:if test="${ member.mem_grade eq '일반'}">
    					<h5>평론가 전용 페이지입니다.</h5>
						<form>
							<input type="button" value="글남기기" onclick="send(this.form);">
						</form>
					</c:if>
					

					<table class="table-wrapper"> 
						<!-- 테이블 헤더 -->
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>평론가</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						
						<!-- 게시글 목록 -->
						<c:forEach var="vo" items="${list}" varStatus="i">
							
							<tr>

								<!-- 번호 -->
								<td>
									${vo.r_no}
								</td>                                             
								
								<!-- 제목 -->
								<td>
									<!-- 메인글이 아니면 ㄴ 붙여라 -->
									<c:if test="${ vo.r_step ne 0 }">ㄴ</c:if><!-- ne = not 이퀄 -->
					
									<!-- 사용중 -- 상세페이지로 -->                              
									<c:if test="${ vo.r_use eq 'y' }">
									<a href="reviewer_view.do?r_idx=${ vo.r_idx }&page=${ empty param.page ? 1 : param.page }">${ vo.r_subject }</a>
									</c:if>
									</td>
								
								<!-- 작성자 -->
								<td class="mem_name">
									${vo.mem_name}
								</td>
								
								<!-- 작성일 -->
								<td class="r_regdate">
									${ fn:substring(vo.r_regdate,0,10)}
								</td>
								
								
								
								<!-- 조회수 -->
								<td class="r_readhit">
									${vo.r_readhit}
								</td>
							</tr>
						</c:forEach>
						
						<!-- 게시물이 없는 경우 -->
						<c:if test="${empty list}">
							<tr>
								<td colspan="6" align="center">
									<font color="red">등록된 게시글이 없습니다.</font>
								</td>
							</tr>
						</c:if>
						
						<!-- 페이지 메뉴 -->
						<tr>
							<td colspan="6" align="center">
								
								${ pageMenu }

								<!-- Page Menu -->
								<ul class="page"></ul>
							</td>
						</tr>
					</table>
					
				 </div>

				 </div>
				</div>
				
				</div>
			  </div>
			
    
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>


