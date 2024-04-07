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
<link rel="stylesheet" href="assets/css/main.css"></head><body>

<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
    <div id="genrebox">
	<a id="gencate1" href="actor.do">배우별&ensp; |</a>
	<a id="gencate2" href="nation.do">나라별 &ensp;|</a>
	<a id="gencate3" href="theater.do">근처극장보기</a>
</div> 


    <div style="width:100%; height:1000px;margin:auto;">
        <c:forEach  var="playing" items="${list}" >
		<div style="float:left;"><img src="https://image.tmdb.org/t/p/w185${playing.poster_path}" style="width:100px; height:100px;"/></div>
		</c:forEach>
    </div>






<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>

</body></html>
