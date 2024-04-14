<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
--><html><head><title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <link rel="stylesheet" href="assets/css/main.css"></head><body> --%></head><body>
<script type="text/javascript">

	var g_cmt_page = 1;


	$(document).ready(function(){
		
		comment_list(1);	
		
	});
	
	 function comment_list(p){
		   
		   //Ajax 댓글목록 요청
		   $.ajax({
			   url		:	"comment_list.do",
			   data		:	{"movie_id": "${ param.id }","page": p },
			   success	:	function(res_data){
				   
				   $("#disp").html(res_data);
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
			   }
		   });
		   
	   }//end :comment_list
	   
	   function comment_insert(){
		   
		   //로그인 여부 체크
		   if( "${empty user}" == "true"){
			   
			   if(confirm("댓글은 로그인 후에 가능합니다\n로그인 하시겠습니까?")==false) return;
			   
			   location.href="../member/login_form.do?url=" + encodeURIComponent(location.href);
			   
			   return;
		   }
		   
		   let cmt_content = $("#cmt_content").val().trim();
			  
		   if(cmt_content==''){
				alert("댓글 내용을 입력하세요!!");
				$("#cmt_content").val('');
				$("#cmt_content").focus();
				return;
			}
			
			alert("별점 체크해 주세요!!");
		   // Ajax로 전송
		   $.ajax({
			   
			   url			:			"comment_insert.do",
			   data		:			{"movie_id": "${ param.id }","cmt_content":cmt_content, "mem_idx":"${user.mem_idx}","mem_id":"${ user.mem_id}","mem_name":"${user.mem_name}" },
 				
			   dataType	:   "json",
			   success	:	function(res_data){
				   // res_date = {"result : true"} or { "result" : false }
				   if(res_data.result){
					   //성공시
					   comment_list(1);
				   }else{
					   //실패시
					   alert("댓글쓰기 실패");
				   }
				   //이전 댓글 지우기
				   $("#cmt_content").val('');
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
			   }
			   
			   
		   });
		   
		   
		   
	   }

</script>




<style type="text/css">

#genresbox{
	margin:auto;

	margin-bottom: 20px;
	width:1250px;
	height: 2450px;
	background-color:black;
}
#his{
	color:white;
	font-size: 25px;
	font-family: 'TTHakgyoansimUndongjangL';

}
#sci{
	color:white;
	font-family: 'TTHakgyoansimUndongjangL';
	font-size: 25px;
}
#ani{
	color:white;
	font-family: 'TTHakgyoansimUndongjangL';
	font-size: 25px;
}
	
		
@font-face {
	font-family: 'TTHakgyoansimUndongjangL';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2402_keris@1.0/TTHakgyoansimUndongjangL.woff2')
		format('woff2');
	font-weight: 300;
	font-style: normal;
}
textarea{
  	resize: none;
  	width: 100%;
	font-size: 20px;
  }
  
  #cmt_btn_register,#cmt_content{

  	width: 99%;
  	height: 80px;
  }
  	#subject,#regdate{
	
	border: 1px solid black;
	box-shadow: 1px 1px 1px black;
	padding: 3px;

	}

  #content{
      min-height: 120px;
      border: 1px solid black;
      box-shadow: 1px 1px 1px black;
      padding: 3px;
   
  }
</style>
<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
<%
    // 리스트에서 '36'이 포함된 playing 객체의 개수를 저장할 변수
    int count = 0;
	int count1 = 0;
	int count2 = 0;
%>

<div id="his">
	[History]
</div>

<div style="width:1200px; height:430px;margin:auto; ">
    <c:forEach var="info" items="${list}" varStatus="i">
	
       <% count++; %>
			<div id="gcontents" style="width:1200px;height:402px;margin-top:10px;">
            <div style="width:302px; height:402px;float:left;">
                <img id="gimage"  src="https://image.tmdb.org/t/p/w185${info.poster_path}" style="width:300px; height:400px; float:left;" />
			</div>
			<div style="width:850px; height:402px;float:left;line-height:140%; line-height: 40px;">
				<div id="gti" style="margin-left: 10px;font-size:25px;  font-weight: bold;">[${info.original_title}]</div>
				<div style="margin-left: 10px;font-size:15px;  font-weight: bold;">${info.countries_list}</div>
				<div style="margin-left: 10px;font-size:15px;  font-weight: bold;">${info.genres_list}</div>
				<div style="margin-left: 10px;font-size:15px;  font-weight: bold;">${info.overview}</div>
				<div style="margin-left: 10px;font-size:15px;  font-weight: bold;">배급사:(${info.companies_list[0].name})</div>
				<div style="margin-left: 10px;font-size:20px;  font-weight: bold;">평점: ${sumpoint}/5점</div>

				
     
           	</div>
			</div>
         <% if (count == 1) break; %>
    </c:forEach>

</div>

<div style="width:1200px; height:800px;margin:auto;margin-top:5px;">
      
		<h5>[댓글]</h5>
		<div class="row" style="margin: 0px; padding: 0px;">
		  <form>
				<div class="col-sm-10" style="margin: 0px; padding: 0px;">
				   <textarea class="form-control" id="cmt_content" placeholder="로그인후에 댓글작성 가능합니다;"style="width:900px;height:100px;"></textarea>
				</div>
				<div class="col-sm-2" style="margin: 0px; padding: 0px;">
				   <input class="btn btn-info" id="cmt_btn_register" type="button"  value="댓글쓰기" onclick="comment_insert();" style="width:150px;height:100px;margin-left:20px;border-radius:5px;background-color:#33ccff;"/>
				</div>
		   </form>	
		</div>
      

		<!-- 댓글목록 출력 -->
		<div id="disp"></div>
		
</div>

<div style="width:1200px; height:100px; margin:auto;margin-top:5px;"></div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>



