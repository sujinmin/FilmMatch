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

	function qna_form() {

	if ("${ empty user }" == "true") {

	if (confirm("글쓰기는 로그인 후에 가능합니다\n로그인 하시겠습니까?") == false) return;

	location.href = "../member/login_form.do";

	return;
	}

	//글쓰기 폼으로 이동
	location.href = "qna_form.do"; // /support/qna.jsp

	}//end:insert_form()


	function del(b_idx){
	  
	//alert(b_idx +" 삭제");
	  
	if(confirm("정말 삭제하시겠습니까?")==false) return;
	  
	//삭제
	location.href="qna_delete.do?b_idx="+ b_idx
	  
    }//end:del()


	//게시물의 댓글
	$(document).ready(function (){
		
		comment_list(1); //page1
		

	    // 링크 클릭 시 스크롤 위치 저장 및 comment_list 함수 호출
	    $("a.comment-link").on("click", function(e) {
	        e.preventDefault();
	        var pageIndex = $(this).data("index");
	        preserveScrollPositionAndNavigate(pageIndex);
	    });
	    
	    
	    if("${param.commentFocus}"=="true"){
			// $("#disp").focus();
			
			var offset = $("#disp").offset(); //해당 위치 반환
			$("html, body").animate({scrollTop: offset.top},400); //스크롤 자동이동 0.4초 속도
		}
	});
	
	function preserveScrollPositionAndNavigate(p) {
	    preserveScrollPosition(p);
	    // 페이지 이동을 막음
	    return false;
	}
	//Ajax 통해서 삭제 => boaed_comment_list.jsp	
	var g_cmt_page=1;
	
	function comment_list(p) { //답글의 댓글
		//ajax  댓글목록 요청
		$.ajax({
			url		:	"comments_list.do",
			data	:	{ "b_idx" : "${ vo.b_idx }", "page" : p },
			success	:	function (res_data){
				//console.log("--------------------------------------------");
				//console.log(res_data);
				//console.log("--------------------------------------------");
				$("#disp").html(res_data);
			},
			error	:	function (err){
				alert(err.responseText); //서버 점검중
			}
			
		});
	}//end : comment_list
	
	// comments_insert
	function comments_insert() {
		
		//로그인여부 체크
		if ("${ empty user }" == "true") {
			if(confirm("댓글쓰기는 로그인후에 가능합니다\n로그인하시겠습니까?")==false) return;
			
			location.href="../member/login_form.do?url=" + encodeURIComponent(location.href);			
			return;
		
		}//로그인여부

		   //내용입력 여부체크
		   let cmt_content = $("#cmt_content").val().trim();//왜 cmt_content 변수가 정의 되지 않은 걸까?
		   if(cmt_content==''){
			   alert('댓글 내용을 입력하세요!');
			   $("#cmt_content").val('');
			   $("#cmt_content").focus();
			   return;
		   }
		// let cmt_content = $("#cmt_content").val().trim();
		// console.log("댓글 내용:", cmt_content);
		   
		   // 댓글에 대한: Ajax로 전송
		   $.ajax({
			   url		:	"comments_insert.do",
			   data		:	{ 
				               "b_idx" : "${ vo.b_idx }",
				               "cmt_content" :  cmt_content,
				               "mem_idx" : "${ user.mem_idx }",
				               "mem_id"  : "${ user.mem_id }",
				               "mem_name": "${ user.mem_name }"				              
			                },
			   dataType	:	"json",
			   success	:	function(res_data){
				   // res_data = {"result" : true } or {"result" : false}
				   //console.log(res_data);
				   if(res_data.result){
					   //성공시 : 댓글목록 가져오기
					   
					   comment_list(1);
					   
				   }else{
					   //실패시
					   alert("댓글쓰기 실패!!");
				   }
				   
				   //이전댓글내용 지우기
				   $("#cmt_content").val('');
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
				   console.log(err.responseText);
			   }
		   });
		   
		
		}//end : comment_insert


	function modify_form(b_idx) {
		
		let community_page="${param.community_page}";
		//console.log(b_idx);
		location.href="qna_modifyform.do?b_idx=" + b_idx; //수정 폼 페이지

		}//end : modify_form
				
				
	function comments_list(community_page) {

		if(community_page=='1'){
		location.href='list.do?community_page=1';
		}
		if(community_page=='2'){
		location.href='notice_list.do?community_page=2';
		}
		if(community_page=='3'){
		location.href='qna_list.do?community_page=3';
		}
		
		}	

		</script>

		</head>

<body>

	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp" />
	<section id="one">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<!-- 메뉴 -->
					<h2>고객센터</h2>
					<p></p>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="home.do">고객센터홈</a></li>

						<li><a href="notice.do">공지사항</a></li>

						<li><a href="faq.do">자주찾는질문</a></li>

						<li class="active"><a href="qna.do">1:1문의</a></li>

						<li><a href="reviewer.do">평론가</a></li>
					</ul>
					<hr class="hidden-sm hidden-md hidden-lg">
				</div>
				<!-- 내용 -->
				<div class="col-sm-8">
					<h1>게시물 보기</h1>

				</div>
				<br>
				<br>


				<div class="col-sm-3">
				<input class="btn btn-success" type="button" value="문의하기"
						onclick="location.href='qna_form.do'">
				</div>
				<br>
				<br>

						
				<div class="col-sm-8">
				<form class="table-wrapper"> 
					<input type="hidden"  name="mem_idx"   value="${ user.mem_idx }">
					<input type="hidden"  name="b_idx"  value="${ vo.b_idx }">
					<table class="table-wrapper">
						<tr>
							<th colspan="2">
								<b>${ vo.mem_name }</b>님의 문의
							</th>
						</tr>
						<tr>
							<th>제목</th>
							<td id="subject">
								${ vo.b_subject }
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td id="content">
								${ vo.b_content }
							</td>
						</tr>

						<tr>
							<td colspan="2" align="center">

								<c:if test="${ user.mem_grade eq '관리자' }">
				   				<input class="button" type="button" value="답글달기" 
				   						onclick="location.href='qna_replyform.do?b_idx=${ vo.b_idx }'">&nbsp;
				  				</c:if>
								<!-- 글주인 or 관리자만 활성화 -->
								<c:if test="${ (vo.mem_idx eq user.mem_idx) or (user.mem_grade eq '관리자') }">
								
								<input type="button" class="button special" value="수정하기"
										onclick="modify_form('${vo.b_idx}');">&nbsp;
								<input class="button alt" type="button" value="삭제하기"
										onclick="del('${ vo.b_idx }');">&nbsp;
								</c:if>
								<input type="button" class="button" value="목록보기"
									onclick="location.href='qna.do'">
							</td>
						</tr>
					</table>
				</form>

				<!-- 댓글등록폼 -->
				<div class="row inner">
					<div ><!-- class="col-sm-6 col-sm-offset-5" -->
						<form>
							<div class="row uniform">
								<div class="12u$" style="width: 1000px; display: flex;">
								<!-- <div class="12u$" style="width: 1000px; display: flex;"> -->
									<textarea style="width:75%;" id="cmt_content" placeholder="로그인 후에 댓글쓰기가 가능합니다" rows="6"></textarea>
									<input class="button comment" id="b_btn_register" type="button" value="댓글쓰기"
										style="width:200px; margin-top: 60px;" onclick="comments_insert();">
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- <hr> -->
				<!-- 댓글목록 출력 -->
				<div id="disp">

				</div>




				</div><!-- class="col-sm-8" -->

			</div><!-- row -->
		<br><br>

		

		



	</section><!-- container -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp" />
</body>

</html>