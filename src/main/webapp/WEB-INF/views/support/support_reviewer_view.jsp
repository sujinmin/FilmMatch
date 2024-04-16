<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<!DOCTYPE html>
			<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
			<html>

			<head>
				<title>Film Match</title>
				<meta charset="utf-8">
				<meta name="robots"
					content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
				<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
				<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

				<style type="text/css">
					* {
						box-sizing: border-box;
					}

					body {
						font-family: Arial;
					}

					.box {
						width: 350px;
						height: 280px;
						float: left;
						margin-right: 30px;
						padding-bottom: 100px;
						/* 아래쪽으로 간격을 벌립니다. */
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
				<script type="text/javascript">

					function reviewer_form() {

						if ("${ empty user }" == "true") {

							if (confirm("글쓰기는 로그인 후에 가능합니다\n로그인 하시겠습니까?") == false) return;

							location.href = "../member/login_form.do";

							return;
						}

						//글쓰기 폼으로 이동
						location.href = "reviewer_form.do"; // /support/qna.jsp

					}//end:insert_form()

					function del(r_idx){
	  
	  				  //alert(r_idx +" 삭제");
	  
	  				  if(confirm("정말 삭제하시겠습니까?")==false) return;
	  
	  				  //삭제
	                  location.href="delete.do?r_idx="+ r_idx
	  
                    }//end:del()

					function modify_form(r_idx) {
		
					console.log(r_idx);
					location.href="modify_form.do?r_idx=" + r_idx; //수정 폼 페이지

	}//end : modify_form	
				

				</script>
			</head>

<body>

	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp" />
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
					<h1>평론글보기</h1>

				</div>
				<br>
				<br>


						<div class="col-sm-3">
							<input class="btn btn-success" type="button" value="글남기기"
								onclick="location.href='reviewer_form.do'">
						</div>
						<br>
						<br>

						
				<div class="col-sm-8">
				<form class="table-wrapper"> <!--  action="form-inline" -->
					<input type="hidden"  name="mem_idx"   value="${ user.mem_idx }">
					<input type="hidden"  name="r_idx"  value="${ vo.r_idx }">
					<table class="table-wrapper">
						<tr>
							<th colspan="2">
								<b>${ vo.mem_name }</b>님의 문의
							</th>
						</tr>
						<tr>
							<th>제목</th>
							<td id="subject">
								${ vo.r_subject }
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td id="content">
								${ vo.r_content }
							</td>
						</tr>

						<tr>
							<td colspan="2" align="center">

								
								<input type="button" class="button special" value="수정하기"
										onclick="modify_form('${vo.r_idx}');">&nbsp;
								<input class="button alt" type="button" value="삭제하기"
										onclick="del('${ vo.r_idx }');">&nbsp;
								
								<input type="button" class="button" value="목록보기"
									onclick="location.href='reviewer.do'">
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>


	</section>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp" />
</body>

</html>