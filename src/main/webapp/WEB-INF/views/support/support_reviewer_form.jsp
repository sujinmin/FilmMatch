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
    function login(){
	    
        location.href="../member/login_form.do?url=" + encodeURIComponent(location.href) ;
    }


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

		if (confirm("정말 입력하시겠습니까?")==false)return;
        f.action = "reviewer_insert.do";
		f.submit();
    }

    



</script>
</head>
<body>
    <!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
<section id="one">

    <form>
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
                    <h1>평론글남기기</h1>
    
                </div>
                <br>
                <br>
        
                <div class="col-sm-8">
                       
                    <table>   
                       
                        <input type="hidden"  name="mem_idx" value="${ user.mem_idx }">
                        <input type="hidden"  name="mem_name" value="${ user.mem_name }">
                        <tr>
                           
                            <th colspan="2"><b>${user.mem_id}</b>님의 평론글남기기</th>
                        </tr>
                        
    
                         <tr>
                            <th>제목</th>
                            <td><input class="form-control" name="r_subject" style="width: 100%;"></td>
                        </tr> 
                        <tr>
    
                            <th>내용</th>
                            <td><textarea class="form-control" rows="5" name="r_content"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" align="center">
                                <input type="button" class="btn btn-primary" value="평론하기" 
                                        onclick="send(this.form);">
                                <input type="button" class="btn btn-success" value="목록보기" 
                                onclick="location.href='reviewer.do'">
                                      
                            </td>
                        </tr>
                    </table>
                </div>
             </div>
            </div>
           </form>


</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp" />
</body>

</html>