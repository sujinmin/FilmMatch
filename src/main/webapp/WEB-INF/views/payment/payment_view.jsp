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
width: 794px;

 margin: 0 auto;
 margin-bottom: 0px; /* 모든 .parent 요소의 아래쪽 마진을 0으로 설정 */
border-bottom: 3px solid lightgrey; 
}



.delivery_infor,.pay_infor,.pay_contents{
  margin: 0 auto;
  border: 3px solid black;
  width: 800px;
}

.pay_subject{
margin: 0 auto;
 text-align: left;
  width: 800px;
  font-weight: bold;
  font-size:30px;
}
 .pay_infor {
        display: flex;
        justify-content: space-between;
    }
    .pay_infor > div {
        /* 자식 요소들을 세로로 정렬합니다. */
        display: flex;
        flex-direction: column;
    }
    .pay_infor > div:last-child hr {
       text-align:right;
        width: 100%;
    }
.align-right {
    text-align: right;
}

.div1 { grid-area: 1 / 1 / 3 / 2;    justify-content: center; align-items: center;  }
.div1 img{ width:130px; hight:130px; text-align:left;}
.div2 { grid-area: 1 / 2 / 3 / 4;    }
.div2 .pay_goods_price{font-weight: bold; font-size: 25px; }
.div2 .pay_approvedAt{   font-size: 15px;  color : gray;  }
.div3 { grid-area: 3 / 1 / 6 / 4;  margin:30px;  align:center; }
.div3 input[type="button"] { width:45%; margin:1px;}

.div1,.div4 {
 display: flex;
  text-align: center; /* 텍스트 가로 중앙 정렬 */
  
}

.centered-text {
  text-align: center;
  font-size: 50px; 
  font-weight: bold; 
  margin-top: 20px; 
  margin-bottom: 20px; 
  color: #333; 
}


.strikethrough {
    text-decoration: line-through;
    color: grey;
    font-size: 15px;
  }
  
</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>


<section id="one" class="">
<div class="centered-text"><span>

결제상세
</span></div>
<div class="pay_subject">결제정보</div>
<div class="pay_contents">
<c:forEach var="vo" items="${list}">
<div class="parent">
  <div class="div1"> <img src="${ pageContext.request.contextPath }/upload/${vo.image_url}"> </div>
  <div class="div2"> ${vo.goods_brand}<br>
  ${vo.goods_name}<br>
  <fmt:formatNumber value="${vo.goods_count_rate_price}"/>원   <span class="strikethrough"><fmt:formatNumber value="${vo.goods_count_price}"/> 원</span><br>
  구매수량 : ${vo.product_count}<br>
  구매일자 : ${vo.approvedAt}
  </div>
  <div class="div3"><input type="button" value="구매확정"><input type="button" value="환불요청">  </div>
</div>
</c:forEach>
</div>
<br>
<div class="pay_subject">배송지정보</div>
<div class="delivery_infor">
수령인 &nbsp&nbsp ${list[0].pay_name} <br>
배송지 &nbsp&nbsp ${list[0].pay_zipcode}<br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${list[0].pay_addr}
</div>
<br>
<div class="pay_subject">주문금액</div>
<div class="pay_infor">
    <div>
        최초 주문금액  <br>
     
        상품금액 <br>
        배송비 <br>
        할인 <br>
         ㄴ 상품/스토어/주문 할인
    </div>
    <div>
        <!-- 오른쪽에 정렬될 금액들 -->
     <span class="align-right"><fmt:formatNumber value="${totalAmount.totalAmount}"/> 원</span>
        <span class="align-right"><fmt:formatNumber value="${totalAmount.goods_count_price}"/> 원</span>
        <span class="align-right"><fmt:formatNumber value="${list[0].deliveryFee}"/>원</span>
        <span class="align-right">-${totalAmount.goods_count_price - totalAmount.goods_count_rate_price} 원</span> 
        <span class="align-right">-${totalAmount.goods_count_price - totalAmount.goods_count_rate_price} 원</span>
    </div>
</div>

<br>
<div class="pay_subject">결제수단</div>
<div class="pay_infor">
    <div>
      ${list[0].method}  <br>
       토스뱅크 <br>

    </div>
    <div>
        <!-- 오른쪽에 정렬될 금액들 -->
     <span class="align-right"><fmt:formatNumber value="${totalAmount.totalAmount}"/> 원</span>
      
  
    </div>
</div>
</section>















<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>









