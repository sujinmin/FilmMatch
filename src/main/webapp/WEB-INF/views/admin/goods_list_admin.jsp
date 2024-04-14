<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Management</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/admin/styles.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script type="text/javascript">

/**
 * 상품 삭제
 */
function delete_goods(goods_idx, image_url) {
    if (confirm("해당 상품을 삭제하시겠습니까?") == true) {
        // 배열을 쿼리 문자열로 변환
        var imageFilenamesQueryString = "";
        if (imageFilenames && imageFilenames.length > 0) {
            for (var i = 0; i < imageFilenames.length; i++) {
                imageFilenamesQueryString += "&imageFilenames=" + encodeURIComponent(imageFilenames[i]);
            }
        }

        // URL에 쿼리 문자열 추가
        var deleteUrl = "${pageContext.request.contextPath}/goods/delete.do?goods_idx=" + goods_idx + "&image_url=" + encodeURIComponent(image_url) + imageFilenamesQueryString;

        // 삭제 페이지로 이동
        location.href = deleteUrl;
    }
}
</script>

</head>
<body class=""> <!-- class="sb-nav-fixed" -->
    <!-- header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
   <!-- menu -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_menu.jsp"/>
    
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">상품관리</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">상품리스트</li>
            </ol>
            <div class="row">
           
            </div>
            <div class="row">
           
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    상품 관리
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>상품명</th>
                                <th>상품이미지</th>
                                <th>상품수량</th>
                                <th>상품할인가</th>
                                <th>상품원가</th>
                                <th>카테고리 분류</th>
                          
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>상품명</th>
                                <th>상품이미지</th>
                                <th>상품수량</th>
                                <th>상품할인가</th>
                                <th>상품원가</th>
                                <th>카테고리 분류</th>
                              
                            </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach var="vo" items="${map.goods_contents}">
                     <tr>
                     <td><a href="${ pageContext.request.contextPath }/goods/goods_view.do?goods_idx=${vo.goods_idx}" >${vo.goods_name}</a></td>
                     <td style=" text-align: center;"><img class="goods_image" src="${ pageContext.request.contextPath }/upload/${vo.image_url}" style="widith:70px; height:70px;   text-align: center;"></td>
                     <td>${vo.goods_quantity}</td>
                     <td><fmt:formatNumber value="${vo.goods_rate_price}"></fmt:formatNumber>원(${vo.goods_rate}%)</td>
                      <td><fmt:formatNumber value="${vo.goods_price}"></fmt:formatNumber>원</td>
                     <td>${vo.path}</td>

                     </tr>
                      </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    
    
    
    <!-- footer -->
    
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_footer.jsp"/>
</biv>
   
    



</body>
</html>