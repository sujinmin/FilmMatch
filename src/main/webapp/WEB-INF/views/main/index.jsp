
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://kit.fontawesome.com/fe320c8d56.js" crossorigin="anonymous"></script>
<script src="${ pageContext.request.contextPath }/js/goods/goods.js"></script>

<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
--><html><head><title>FilmFlow - 영화, 책 ,TV프로그램 추천 및 평가 서비스</title><meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<script src="${ pageContext.request.contextPath }/js/main/vidio_scrole.js"></script>
<!-- 부트스트렙 캐러셀 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css"></head>
<script src="https://cdn.jsdelivr.net/npm/inko@1.1.1/inko.min.js"></script>

​

<body>


<!-- Header -->
<jsp:include page="mainheader.jsp"/>

<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

<!-- Banner -->
<%-- 동영상 api --%>
<section id="banner">
<div id="im1">
<div id= "movie">
<c:forEach var="vedio" items="${vediolist}">
<span id= "movie1" ><iframe width="150" height="100" src="https://www.youtube.com/embed/${vedio.key}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></span>
<div id="mt1" onclick="change_movie1('${vedio.key}', '${vedio.name}')">${vedio.name} </div> 
</c:forEach>
</div>

</div>
</div>
<div id="im5">
</div>
<br>
<div id=change >
<iframe id="frame" width="1100" height="500" src="https://www.youtube.com/embed/exiz8yl1TX4?si=9EvWvkfdJHVTCXge&amp;start=12" 
    title="YouTube video player" frameborder="0" 
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
    allowfullscreen></iframe></div></section><br>


<%-- 검색란 --%>
<div id="bos">
<div id="boxxx">
	<a id="cate" href="genre.do">장르별&ensp; |</a>
	<a id="cate1" href="actor.do">배우별&ensp; |</a>
	<a id="cate2" href="nation.do">나라별&ensp;|</a>
	<a id="cate3" href="theater.do">근처극장보기&ensp;|</a>
	<a id="cate3" href="${ pageContext.request.contextPath }/goods/list.do">굿즈상품</a>
	<form class="search-box">
    <input class="search-text" type="text" placeholder="(영문검색)영화검색해보세요." /> 
    <button class="search-btn" value="검색" onclick="showSearchText(); return false;"> <i class="fa-solid fa-magnifying-glass"></i>
    </button>
	</form>	
</div>	 

<%-- 캐러셀 영화 인기  API --%>
<div id="ta">
	박스 오피스 순위
</div>

<div id="boxa">
<div id="boxb">
		<ul>
		<c:forEach  var="poster" items="${posterlist}" varStatus="i">
	 	<c:if test="${not empty poster.overview}">
		<li style="font-size:50px; color:white;">${i.count}</li>
		<li><img src="https://image.tmdb.org/t/p/w185/${poster.poster_path}" onclick="movie_info('${poster.id}')"class="hand-cursor"/></li>
		</c:if>
		</c:forEach>
		<c:forEach  var="poster" items="${posterlist}" varStatus="i">
		<c:if test="${not empty poster.overview}">
		<li style="font-size:50px; color:white;">${i.count}</li>
		<li><img src="https://image.tmdb.org/t/p/w185/${poster.poster_path}" onclick="movie_info('${poster.id}')"class="hand-cursor"/></li>
		</c:if>
		</c:forEach>
		</ul>
	</div>
	<div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<i class="material-icons" style="font-size:70px;color:white"onclick="moveImage_right();">fast_rewind</i></a>&emsp;&emsp;
		<a class="carousel-control-next" href="#demo" data-slide="next">
		<i class="material-icons" style="font-size:70px;color:white"onclick="moveImage_left();">fast_forward</i></a>
	</div>
</div>
<%-- 캐러셀 영화 투표  API --%>
	
<div id="ta1">
	영화 투표 순위
</div>
<div id="boxe">
<div id="boxf">
<ul>
		<c:forEach  var="vote" items="${votelist}" varStatus="i">
		<c:if test="${not empty vote.overview}">
		<li style="font-size:50px; color:white;">${i.count}</li>
		<li><img src="https://image.tmdb.org/t/p/w185/${vote.poster_path}" onclick="movie_info('${vote.id}')" class="hand-cursor" /></li>
		</c:if>
		</c:forEach>
		<c:forEach  var="vote" items="${votelist}" varStatus="i">
		<c:if test="${not empty vote.overview}">
		<li style="font-size:50px; color:white;">${i.count}</li>
		<li><img src="https://image.tmdb.org/t/p/w185/${vote.poster_path}" onclick="movie_info('${vote.id}')" class="hand-cursor"/></li>
		</c:if>
		</c:forEach>
		</ul>
</div>
<div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<i class="material-icons" style="font-size:70px;color:white;"onclick="moveImage_rightf();">fast_rewind</i></a>&emsp;&emsp;
		<a class="carousel-control-next" href="#demo" data-slide="next">
		<i class="material-icons" style="font-size:70px;color:white"onclick="moveImage_leftf();">fast_forward</i></a>
	</div>
	</div>			
</div>



<%-- 기사 API --%>

	

		<!-- Two --><section id="twoab">


		<div id="ta2">
		[최신 영화 뉴스]
		<br><br>
		<article><c:forEach var="vo"  items="${ newslist }" >
			
	   		<div id="newsbox1">
            <div id="newstitle1"><a href="${vo.link}">${ vo.title }</a></div>
            <div id="newsdes1">${ vo.description }</div>
            <div id="newsdata1">${ fn:substring(vo.pubDate,0,25) }</div>
			</div>
			
      	</c:forEach>
		</article></div> 

		<div id="ta3">
		[자주 찾는 질문]
		<br><br>	
		<article >
		<c:forEach var="vo"  items="${ faq_list }" >
	   		<div id="newsbox2">
            <div id="newstitle2"><a href="support/faq_view.do?f_idx=${vo.f_idx}">${ vo.f_subject }</a></div>
            <div id="newsdes2">${ vo.f_content }</div>
            <div id="newsdata2">${ vo.f_regdate }</div>
			</div>
      	</c:forEach>
		</article>
		</div> 
		
			<%-- goods 상품 --%>
		
		<div id="ta4">
		[Goods 상품]
		</div>	
				<c:forEach var="vo" items="${map.goods_contents}">
				<a href="../goods/goods_view.do?goods_idx=${vo.goods_idx}"  > 
				<div id = "goodpc" > 
				<img src="${ pageContext.request.contextPath }/upload/${vo.image_url}" alt="" style="width:200px;height:200px;" >
				<br>${vo.goods_name}<br>${vo.goods_price}
				</div> 
			</a> 
			</c:forEach>
		</section>
			
			
			
		<!-- Footer -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
		