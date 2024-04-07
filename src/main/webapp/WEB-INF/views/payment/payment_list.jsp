<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/skel.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/util.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/main.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/main.css"/>
<link rel="icon" href="../image/ban.png" />
<link rel="apple-touch-icon" href="../image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="../image/ban.png">
<link rel="manifest" href="../image/ban.png">
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>결제 내역</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<style type="text/css">


 .parent {
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: repeat(3, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
width: 800px;

 margin: 0 auto;
  border: 3px solid black; 
}

.div1 { grid-area: 1 / 1 / 1 / 4;  margin-left:30px; margin-top:30px; }
.div1 .pay_status{ color:#929294; font-size: 25px; font-weight: bold;}
.div2 { grid-area: 2 / 1 / 3 / 2;    justify-content: center; align-items: center;}
.div2 img{ width:130px; hight:130px; text-align:left;}
.div3 { grid-area: 2 / 2 / 3 / 4;  }
.div3 .pay_goods_price{font-weight: bold; font-size: 25px; }
.div3 .pay_approvedAt{   font-size: 15px;  color : gray;  }
.div4 { grid-area: 3 / 1 / 3 / 4;  margin:30px;  align:center;}
.div4 input[type="button"] { width:100%;}

.div1, .div2, .div4 {
 display: flex;
  text-align: center; /* 텍스트 가로 중앙 정렬 */
  
}
.parent:not(:last-child) {
  margin-bottom: 20px; /* 마지막 요소를 제외한 모든 .parent 요소에 적용 */
}

.centered-text {
  text-align: center;
  font-size: 50px; /* 글자 크기를 조정합니다 */
font-weight: bold; /* 글자를 굵게 만듭니다 */
  margin-top: 20px; /* 위쪽 여백을 추가합니다 */
  margin-bottom: 20px; /* 아래쪽 여백을 추가합니다 */
  color: #333; /* 글자 색상을 어둡게 조정합니다 */
}


</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>


<section id="one" class="">
<div class="centered-text"><span>

결제내역
</span></div>
<c:forEach var="vo" items="${list}">

<div class="parent">

<div class="div1"> 
<span class="pay_status"> 
    <c:if test="${ vo.status eq 'DONE' }">구매완료</c:if>
</span>
</div>
<div class="div2"> <img src="${ pageContext.request.contextPath }/upload/${vo.image_url}"></div>
<div class="div3"><span class="pay_approvedAt">${vo.approvedAt} 결제 </span><br>
${vo.goods_name}<br>
<span class="pay_goods_price"><fmt:formatNumber value="${vo.goods_count_rate_price}"/>원</span>
</div> 
<div class="div4"><input type="button" value="주문상세" onclick="location.href='${ pageContext.request.contextPath }/payment/payment_select_orderid.do?orderId=${vo.orderId}'"></div>
</div>


</c:forEach>


		
</section>















<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>









