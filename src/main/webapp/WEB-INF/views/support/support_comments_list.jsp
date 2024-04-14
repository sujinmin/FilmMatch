<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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


	function delete_comments(cmt_idx) {
		
		if(confirm("정말 삭제하시겠습니까?")==false) return;
		
		//Ajax 통해서 삭제
		$.ajax({
			url		:	"comments_delete.do",
			data	:	{"cmt_idx" : cmt_idx},
			dataType:	"json",
			success	:	function (res_data) {
				//res_data={"":true, "":}
				if(res_data.result){
					//성공
					comment_list(g_cmt_page);
				}else{
					//실패
					alert("삭제 실패했습니다..");
				}
			},
			error	:	function (err) {
				alert(err.responseText);
			}
		});
		
		
	}//end:delete_comment();

	function modify_comments(cmt_idx) {
       
		var editFormId = 'editForm' + cmt_idx; // 고유한 수정 폼의 id 생성
	    document.getElementById(editFormId).style.display = 'flex'; // 생성한 id로 해당 수정 폼을 보이도록 설정
	}
	
	function save_comments(cmt_idx) {
    	
        //내용입력 여부체크
		   let cmt_content = $("#cmt_update_content"+cmt_idx).val().trim();
		   if(cmt_content==''){
			   alert('댓글 내용을 입력하세요!');
			   $("#cmt_update_content").val(cmt_content);
			   $("#cmt_update_content").focus();
			   return;
		   }
		   
		   // Ajax로 전송
		   $.ajax({
			   url		:	"comments_update.do",
			   data		:	{ 
				               "cmt_idx" : cmt_idx,
				               "cmt_content" : cmt_content
			                },
			   dataType	:	"json",
			   success	:	function(res_data){
				   // res_data = {"result" : true } or {"result" : false}
				   if(res_data.result){
					   //성공시 : 댓글목록 가져오기
					   comment_list(1); //comments로 바꾸지 않는다
					   
				   }else{
					   //실패시
					   alert("댓글쓰기 실패!!");
				   }
				   
				   //이전댓글내용 지우기
				   $("#cmt_content"+cmt_idx).val();
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
				   alert('에러');
			   }
		   });

    }

</script>
</head>

<body>


                    
	<!-- 댓글이 없는경우 -->
	<c:if test="${ empty list }"> <!-- request Binding에서 줌 -->
		<font color="red" align="center">등록된 댓글이 없습니다.</font>
	</c:if>
	
	<!-- PageMenu : 댓글이 있으면 메뉴 넣어라...  -->
	<c:if test="${ not empty list }">
		${ pageMenu }
	</c:if>
	
	<hr>
	<c:forEach var="cmt" items="${ list }">
		<div class="main_subject">
			<div>
				<b>${ cmt.mem_mask_id }</b>님의 댓글
			</div>
			<div>
				<!-- 본인글인 경우만 보여준다 -->
				<c:if test="${ user.mem_idx eq cmt.mem_idx or (user.mem_grade eq '관리자') }">
					<div class="buttonbox">
						<input class="button small" type="button" value="삭제" onclick="delete_comments('${ cmt.cmt_idx}');">
						&nbsp;&nbsp;
						<input class="button alt small editBtn" type="button" value="수정"
							onclick="modify_comments('${ cmt.cmt_idx}');">
					</div>
				</c:if>
			</div>
		</div>
		<!-- 2번째 줄 -->
		<div id="cmt2">
			${ cmt.cmt_regdate }
		</div>
		<!-- 3번째 줄 -->
		<div id="cmt3">
			${ cmt.cmt_content }
		</div>
		<!-- 수정하기 폼 -->
		<div id="editForm${ cmt.cmt_idx}" style="display: none; width: 60%">
			<textarea id="cmt_update_content${ cmt.cmt_idx}">${ cmt.cmt_content }</textarea>
			<input class="saveBtn special small" type="button" value="저장" onclick="save_comments('${ cmt.cmt_idx}');">
		</div>
	
		<hr>
	</c:forEach>
						
						 
		
</body>
</html>