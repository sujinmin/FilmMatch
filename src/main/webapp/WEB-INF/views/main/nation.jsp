<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
--><html><head><title>Generic - Introspect by TEMPLATED</title><meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/main.css"></head>
<script src="${ pageContext.request.contextPath }/js/main/vidio_scrole.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style type="text/css">

#genresbox{
	margin:auto;
	margin-top: 50px;
	margin-bottom: 20px;
	width:1250px;
	height: 2500px;
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

<body>

<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

  <div id="genrebox">
    <a id="gencate" href="genre.do">장르별&ensp; |</a>
	<a id="gencate1" href="actor.do">배우별&ensp; |</a>
	<a id="gencate3" href="theater.do">근처극장보기</a>
</div>

<%
    // 리스트에서 '36'이 포함된 playing 객체의 개수를 저장할 변수
    int count = 0;
	int count1 = 0;
	int count2 = 0;
%>


<div id="genresbox" >

<div id="his">
	[koreaMovie]
</div>

<div style="width:1200px; height:770px;margin:auto;">
    <c:forEach var="nation1" items="${list}"  >
		<c:if test="${nation1.original_language eq 'ko' && !nation1.overview.isEmpty()}">
				<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;border:1px solid black;background-color:black;">
				<div style="width:155px; height:224px;float:left;">
				<% count++; %>
					<img id="gimage"  src="https://image.tmdb.org/t/p/w185${nation1.poster_path}" style="width:150px; height:222px; float:left;" onclick="movie_info('${nation1.id}')" class="hand-cursor"/>
				</div>
				<div style="width:1000px; height:222px;float:left;line-height:140%">
					<div id="gti" style="color:white;">[${nation1.title}]<br>${nation1.overview}</div>
				</div>
				</div>
				
		</c:if>
		<% if (count == 3) break; %>
	</c:forEach>
</div>


<div id="his">
	[AmericaMovie]
</div>

<div style="width:1200px; height:770px;margin:auto;">
    <c:forEach var="nation" items="${list}"  varStatus="i">
    	<c:if test="${nation.original_language eq 'en'&& not empty nation.overview && i.count < 4}">
		
			<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;border:1px solid black;background-color:black;">
            <div style="width:155px; height:224px;float:left;">
			<% count++; %>
                <img id="gimage"  src="https://image.tmdb.org/t/p/w185${nation.poster_path}" style="width:150px; height:222px; float:left;" onclick="movie_info('${nation.id}')" class="hand-cursor"/>
			</div>
			<div style="width:1000px; height:222px;float:left;line-height:140%">
				<div id="gti" style="color:white;">[${nation.title}]<br>${nation.overview}</div>
           	</div>
			</div>
		</c:if>
		
    </c:forEach>
</div>


<div id="his">
	[japanMovie]
</div>

<div style="width:1200px; height:770px;margin:auto;">
    <c:forEach var="nation" items="${list}" >
    <c:if test="${nation.original_language eq 'ja'&& not empty nation.overview}">
		
			<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;border:1px solid black;background-color:black;">
            <div style="width:155px; height:224px;float:left;">
			<% count2++; %>
                <img id="gimage"  src="https://image.tmdb.org/t/p/w185${nation.poster_path}" style="width:150px; height:222px; float:left;" onclick="movie_info('${nation.id}')" class="hand-cursor"/>
			</div>
			<div style="width:1000px; height:222px;float:left;line-height:140%">
				<div id="gti" style="color:white;">[${nation.title}]<br>${nation.overview}</div>
           	</div>
			</div>
		</c:if>
		<% if (count2 == 3) break; %>
    </c:forEach>
</div>


</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>

</body></html>
