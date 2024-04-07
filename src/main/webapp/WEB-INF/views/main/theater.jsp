<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<!-- Header -->
<%@ include file="header.jsp" %>
        <!-- Navi -->
<%@ include file="navi.jsp" %>

    
<!DOCTYPE html>
<html data-bs-theme="light" lang="ko">


<style>
#radius_info {
	position: relative;
	top: 5px;
	left: 5px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	font-size: 12px;
	padding: 5px;
	background: #fff;
	list-style: none;
	margin: 0;
}

#radius_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

#radius_info .label {
	display: inline-block;
	width: 50px;
}

#radius_number {
	font-weight: bold;
	color: #00a0e9;
}

#store_display{




}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    
		<div id="theaterbox" style="margin-top:20px;>
        <!-- intro banner -->
        <div class="container pt-4 pt-xl-5 c" id="intro_banner">
        
		</div>
		
			
		
		<div class="container pt-4 pt-xl-5 c" id="map_view">
		<main id="content"style="width:100%;">
            <div class="container"style="width:100%;">
                <div class="row shop_tt"style="width:100%;">
					<article class="col-md-12 article affix-purchase-target"style="width:100%;">
						<!-- 백상희 수정 지도부분 :20240126 -->
						<!-- 지도를 표시할 div 입니다 -->
						<div id="map_container"style="width:100%;">
							<div id="map" style="width:100%;height:650px;"></div>
								<div id="btn_remove_circles" style="float: left;">
									<button id="remove_circles" class="btn btn-primary" >원의반경 모두 지우기</button>
									<span>지도를 마우스로 클릭하면 원 그리기가 시작되고, 오른쪽 마우스를 클릭하면 원 그리기가 종료됩니다.</span> 
								</div>
								<div id="rosebox"width=100%; height=800px; magin="auto;">
								<div id="store_display"></div><iframe id="ifra" src="http://place.map.kakao.com/10609442" width=810px; height=780px; float=left; frameborder="0"></iframe></div>					  	
						</div>
						
   						<br>  

						<!-- API로 불러온 가게리스트를 표시할 div 입니다. -->
						
					</article>
				</div>
			</div>
		</main>
		</div>
		</div>
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>





     
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
    </body>
    </html>