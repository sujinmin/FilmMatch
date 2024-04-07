<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="${ pageContext.request.contextPath }/js/main/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/skel.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/util.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/main.js"></script>
</body>
</html>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/ban.png" />
<link rel="apple-touch-icon" href="../image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="../image/ban.png">
<link rel="manifest" href="../image/ban.png">
<meta name="theme-color" content="#ffffff">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="${ pageContext.request.contextPath }/js/goods/goods.js"></script>
<script src="${ pageContext.request.contextPath }/js/goods/goods_list.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	
    var selectedOption = "${param.search_option}";

   if("${not empty param.search_option}"=="true") {
        $("#search_option").val(selectedOption);
    }
	// 전체보기면 검색어 삭제
	if("${param.search_option eq 'all'}"=="true") $("#search_text").val("");
	
});
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${ pageContext.request.contextPath }/css/goods/giftstore.css" rel="stylesheet" type="text/css" />
</head>

<body>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
	
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
     

	<div>
	
      <div id="product_box">
	 
		<section id="one">
		
			<form class="form-inline">
				<div id="box">
					
						<form>
						<div class="category_product_list_wrap_search" >
							<select  id="search_option" class="search_option" name="search_option">
									<option value="all">전체보기</option>
									<option value="subject">제목</option>
							</select>
							<input type="text"   class="goods_search" placeholder="원하는 상품을 검색해보세요." id="search_text"  name="search_text"  value="${param.search_text}">
							<input type="image"  src="//img.echosting.cafe24.com/skin/base/product/btn_search.gif" class="btnSearch" onclick="search(); return false;">
						</div>
						</form>
						<div class="category_product_list_wrap">
						<c:if test="${ user.mem_grade eq '관리자' }">
						<input type="button" value="상품등록" onclick="insert_form();" style="width: 200px; text-align: center;">
						</c:if>
							<strong class="category_product_list_title">굿즈<span>센스있는 선물의 정석</span><br><span>총</span> ${rowTotal}<span>건</span></strong>
								<!-- 등록된 사진이 없으면  -->
						 <c:if test="${ empty map.goods_contents }">
						<div
							style="color: red; text-align: center; margin-top: 190px; font-weight: bold;">
							<b style="color: red;">상품 검색 내역이 존재하지 않습니다</b>
						</div>
					    </c:if> 
							<ul class="com_list_style" style="list-style-type: none">
								<c:forEach var="vo" items="${map.goods_contents}">


									<li class="state_giftcard"><a href="goods_view.do?goods_idx=${vo.goods_idx}" class="btn_category_product" style="text-decoration: none; color: inherit;"> <span class="com_list_img_wrap" > <img src="${ pageContext.request.contextPath }/upload/${vo.image_url}" alt="" >
										</span> <span class="com_list_text_wrap"> <span class="com_list_text_title">${vo.goods_name}</span> <span class="com_list_text_name"><strong style="color: black; "><fmt:formatNumber value="${vo.goods_price}"></fmt:formatNumber></strong></span><span class="com_list_sale_price_wrap"> 
											</span>
										</span>
									</a> <a href="#none" class="btn_category_product_gift"></a> <a href="#none" class="btn_category_product_buy"></a></li>


								</c:forEach>
							</ul>
							${pageMenu}
						</div>
						
					</div>
					
				</div>
			</form>
			
		</section>
		
		
	</div>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>