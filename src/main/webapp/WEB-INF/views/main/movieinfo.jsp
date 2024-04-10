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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/main.css"></head><body>
<style type="text/css">

#genresbox{
	margin:auto;
	margin-top: 50px;
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
	
#gimage{

	cursor: pointer;
}
			
			@font-face {
				font-family: 'TTHakgyoansimUndongjangL';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2402_keris@1.0/TTHakgyoansimUndongjangL.woff2')
					format('woff2');
				font-weight: 300;
				font-style: normal;
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

<div style="width:1200px; height:770px;margin:auto;">
    <c:forEach var="info" items="${list}" >
       <% count++; %>
			<div id="gcontents" style="width:1200px;height:402px;margin-top:10px;">
            <div style="width:302px; height:402px;float:left;">
                <img id="gimage"  src="https://image.tmdb.org/t/p/w185${info.poster_path}" style="width:300px; height:400px; float:left;" />
			</div>
			<div style="width:850px; height:402px;float:left;line-height:140%; line-height: 40px;">
				<div id="gti">[${info.original_title}]/${info.countries_list}<br>${info.genres_list}<br>${info.overview}<br>배급사:(${info.companies_list[0].name})</div>
                
           	</div>
			</div>
         <% if (count == 1) break; %>
    </c:forEach>
    
</div>






<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>



