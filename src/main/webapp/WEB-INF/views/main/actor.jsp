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

<style type="text/css">

#genresbox{
	margin:auto;
	margin-top: 50px;
	margin-bottom: 20px;
	width:1250px;
	height: 2000px;
	background-color:black;
    
}
#koreaactor{
	color:white;
	font-size: 25px;
font-family: 'TTHakgyoansimUndongjangL';

}
#koactor{
	color:white;
	font-size: 20px;
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
	<a id="gencate2" href="nation.do">나라별 &ensp;|</a>
	<a id="gencate3" href="theater.do">근처극장보기</a>
</div> 

<%
    // 리스트에서 '36'이 포함된 playing 객체의 개수를 저장할 변수
    int count = 0;
	int count1 = 0;
	int count2 = 0;
%>

<div id="genresbox" >

<div id="koreaactor">[KoreaActor]</div>

<div style="width:1200px; height:600px;margin:auto;">
    <c:forEach var="actor" items="${list}">
    
			<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;">
            <div style="width:155px; height:224px;float:left;">
                <img src="https://image.tmdb.org/t/p/w185${actor.profile_path}" style="width:150px; height:222px; float:left;" />
			</div>
			<div style="width:1000px; height:224px;float:left;line-height:140%;">
				<div id="gti" style="color:white;">[${actor.name}]<br>${actor.actorprof_list[0].biography}<br><a href="${actor.actorprof_list[0].homepage}" >${actor.actorprof_list[0].homepage}</a> </div>
           	</div>

            <div id="known" style="width:1155px; height:300px; float:left; color:white;">
            <div id="koactor">[대표작]</div>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor.known_forlist[0].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor.known_forlist[0].id}','${actor.known_forlist[0].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor.known_forlist[1].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor.known_forlist[1].id}','${actor.known_forlist[1].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor.known_forlist[2].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor.known_forlist[2].id}','${actor.known_forlist[2].media_type}')" class="hand-cursor"/>
                
            </div>

			</div>
    <% count++; %>
        <%-- count가 5가 되면 반복문 종료 --%>
        <% if (count == 1) break; %>
    </c:forEach>
</div>


<div id="koreaactor">[SwedenActor]</div>


<div style="width:1200px; height:600px;margin:auto;">
    <c:forEach var="actor1" items="${list1}">
    
			<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;">
            <div style="width:155px; height:224px;float:left;">
                <img src="https://image.tmdb.org/t/p/w185${actor1.profile_path}" style="width:150px; height:222px; float:left;" />
			</div>
			<div style="width:1000px; height:224px;float:left;line-height:140%">
				<div id="gti" style="color:white;">[${actor1.name}]<br>${actor1.actorprof_list[0].biography}<br><a href="${actor1.actorprof_list[0].homepage}" >${actor1.actorprof_list[0].homepage}</a> </div>
           	</div>

            <div id="known" style="width:1155px; height:300px; float:left; color:white;">
            <div id="koactor">[대표작]</div>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor1.known_forlist[0].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor1.known_forlist[0].id}','${actor1.known_forlist[0].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor1.known_forlist[1].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor1.known_forlist[1].id}','${actor1.known_forlist[1].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor1.known_forlist[2].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor1.known_forlist[2].id}','${actor1.known_forlist[2].media_type}')" class="hand-cursor"/>
                
            </div>

			</div>
    <% count++; %>
        <%-- count가 5가 되면 반복문 종료 --%>
        <% if (count == 1) break; %>
    </c:forEach>
</div>


<div id="koreaactor">[JapanActor]</div>


<div style="width:1200px; height:600px;margin:auto;">
    <c:forEach var="actor2" items="${list2}">
    
			<div id="gcontents" style="width:1200px;height:225px;margin-top:10px;">
            <div style="width:155px; height:224px;float:left;">
                <img src="https://image.tmdb.org/t/p/w185${actor2.profile_path}" style="width:150px; height:222px; float:left;" />
			</div>
			<div style="width:1000px; height:224px;float:left;line-height:140%">
				<div id="gti" style="color:white;">[${actor2.name}]<br>${actor2.actorprof_list[0].biography}<br><a href="${actor2.actorprof_list[0].homepage}" >${actor2.actorprof_list[0].homepage}</a> </div>
           	</div>

            <div id="known" style="width:1155px; height:300px; float:left; color:white;">
            <div id="koactor">[대표작]</div>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor2.known_forlist[0].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor2.known_forlist[0].id}','${actor2.known_forlist[0].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor2.known_forlist[1].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor2.known_forlist[1].id}','${actor2.known_forlist[1].media_type}')" class="hand-cursor"/>
            <img id="gimage" src="https://image.tmdb.org/t/p/w185${actor2.known_forlist[2].poster_path}" style="width:150px; height:222px; float:left;margin-left:180px;" onclick="movie_info('${actor2.known_forlist[2].id}','${actor2.known_forlist[2].media_type}')" class="hand-cursor"/>
                
            </div>

			</div>
    <% count++; %>
        <%-- count가 5가 되면 반복문 종료 --%>
        <% if (count == 1) break; %>
    </c:forEach>
</div>




</div>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>

</body></html>
