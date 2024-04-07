<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html><head><title>Film Match</title>
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
     #box{
		width: 600px;
		margin: auto;
		margin-top: 50px;
	}
	
	textarea {
		width: 100% !important;  /*!important (not임포턴트)부트스트랩 무시 우선처리 */
		resize: none;
	}
	


</style>

<script type="text/javascript">

	function send(f) {
		
		let b_subject = f.b_subject.value.trim();
		let b_content = f.b_content.value.trim();
		
		if(b_subject==''){
			alert('제목을 입력하세요!');
			f.b_subject.value='';
			f.b_subject.focus();
			return;
		}
		
		if(b_content==''){
			alert('내용을 입력하세요!');
			f.b_content.value='';
			f.b_content.focus();
			return;
		}
		
		f.action ="insert.do"; // /board/insert.do -> BoardController
		f.submit();
		
		
	}


</script>
</head>
<body>
    <!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="one">
    <form class="form-inline">
        <div id="box">
            <div class="panel panel-primary">
            <div class="panel-heading"><h4>새글쓰기</h4></div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td><input class="form-control" name="b_subject" style="width: 100%;"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea class="form-control" rows="5" name="b_content"></textarea></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" class="btn btn-primary" value="새글쓰기" 
                                    onclick="send(this.form);">
                            <input type="button" class="btn btn-success" value="목록보기" 
                                    onclick="location.href='qna.do'">
                        </td>
                    </tr>
                </table>
            </div>
         </div>
        </div>
       </form>



</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>