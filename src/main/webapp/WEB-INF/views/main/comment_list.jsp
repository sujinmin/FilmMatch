<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.request.contextPath }/js/main/vidio_scrole.js"></script>
<style type="text/css">

	.cmt_1,.cmt_2{
	font-size: 20px;

	}

.star_rating {
  width: 100%; 
  box-sizing: border-box; 
  display: inline-flex; 
  float: left;
  flex-direction: row; 
  justify-content: flex-start;
}
.star_rating .star {
  width: 25px; 
  height: 25px; 
  margin-right: 10px;
  display: inline-block; 
  background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat; 
  background-size: 100%; 
  box-sizing: border-box; 
}
.star_rating .star.on {
  width: 25px; 
  height: 25px;
  margin-right: 10px;
  display: inline-block; 
  background: url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png') no-repeat;
  background-size: 100%; 
  box-sizing: border-box; 
}

.star_box {
  width: 400px;
  box-sizing: border-box;
  display: inline-block;
  margin: 15px 0;
  background: #F3F4F8;
  border: 0;
  border-radius: 10px;
  height: 100px;
  resize: none;
  padding: 15px;
  font-size: 13px;
  font-family: sans-serif;
}
.btn02 {
  display:block;
  width: 400px;
  font-weight: bold;
  border: 0;
  border-radius: 10px;
  max-height: 50px;
  padding: 15px 0;
  font-size: 1.1em;
  text-align: center;
  background:bisque;
}


</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">



	function delete_comment(cmt_idx){
		//삭제확인
		
		if(confirm("정말 삭제 하시겠습니까?")==false) return;
		
		$.ajax({
			url		:	"comment_delete.do",
			   data		:	{"cmt_idx": cmt_idx },
			   dataType 	: 	"json",
			   success	:	function(res_data){
				   
				  // res_data = {"result" : true} or {"result" : false}
				  if(res_data.result){
					  //성공
					  comment_list(g_cmt_page); //댓글목록 갱신
				  }else{
					  
					  alert('삭제실패했습니다!!')
				  }
				   
			   },
			   error:function(err){
				   
				   alert(err.responseText);
			   }
		   });
	}

		   function star_point(value,cmt_idx,id){

		
			$.ajax({
				url		:	"star_point.do",
				data		:	{"star_point": value, "cmt_idx":cmt_idx, "movie_id":id },
				dataType 	: 	"json",
				success	:	function(res_data){
					
					// res_data = {"result" : true} or {"result" : false}
					if(res_data.result){
						//성공
							$('.star_rating > .star').click(function() {
							$(this).parent().children('span').removeClass('on');
							$(this).addClass('on').prevAll('span').addClass('on');
						location.reload();
	
  })
					}else{
						
						alert('실패했습니다!!')
					}
					
				},
				error:function(err){
					
					alert(err.responseText);
				}
			}); 
		
		
		
	}

</script>

</head>
<body>

	<c:forEach var="cmt" items="${ cmt_list }" >
	
	<hr>
		<div class="row" >
		
				<div class="col-sm-9" >
				  		 <b>(${cmt.no})${cmt.mem_id }</b>
				</div>
				
				<div class="col-sm-3" >
				<c:if test="${ user.mem_idx eq cmt.mem_idx }">
				   <input class="btn btn-danger"  type="button"  value="x"  onclick="delete_comment('${ cmt.cmt_idx }');"/>
				 </c:if>
				</div>
				</div>
				<div class="cmt_1">
					${cmt.cmt_regdate }<br>
				</div>
				<div class="cmt_2">
					${cmt.cmt_content }
				</div>
	<div>[별점 click]</div>
		<div class ="star_rating">
			<c:forEach var="i" begin="1" end="5">
                 
				<c:if test="${ i <= cmt.star_point }"> 
			        <span class="star on" value="${ i }" onclick="star_point('${ i }','${cmt.cmt_idx}','${param.id}')"> </span>  
			    </c:if>
				<c:if test="${ i > cmt.star_point }"> 
			        <span class="star" value="${ i }" onclick="star_point('${ i }','${cmt.cmt_idx}','${param.id}')"> </span>  
			    </c:if>
				
				<%-- <span class="star on" value="1" onclick="star_point('1','${cmt.cmt_idx}')"> </span>
				<span class="star" value="2"	onclick="star_point('2','${cmt.cmt_idx}')"> </span>
				<span class="star" value="3"	onclick="star_point('3','${cmt.cmt_idx}')"> </span>
				<span class="star" value="4"	onclick="star_point('4','${cmt.cmt_idx}')"> </span>
				<span class="star" value="5"	onclick="star_point('5','${cmt.cmt_idx}')"> </span> --%>
			</c:forEach>
		</div>
	<hr>
	</c:forEach>
	<div align="center" >
		<c:if test="${ not empty cmt_list }">
	${ pageMenu }
	</c:if>
	</div>
</body>
</html>