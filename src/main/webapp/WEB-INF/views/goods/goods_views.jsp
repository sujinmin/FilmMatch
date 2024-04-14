<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="manifest" href="../image/ban.png">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/goods/goods_views.css">
<script src="${ pageContext.request.contextPath }/js/main/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/skel.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/util.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/main.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="manifest" href="${ pageContext.request.contextPath }/image/ban.png">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<script type="text/javascript">
var imageFilenames;

$(document).ready(function() {

	// 페이지 로드 시 총 구매 금액 계산
        calculateTotal();

        // 상품 수량 변경 시 총 구매 금액 계산
        $("#product_count").on("change", function() {
            calculateTotal();
        });


    // 상품을 삭제할 경우를 대비하여, 삭제될 예정인 파일명 데이터 배열로 저장
    function extractImageFilenames() {
        var imageElements = document.querySelectorAll('.div3 img');
        imageFilenames = Array.from(imageElements).map(function(img) {
            var src = img.getAttribute('src');
            var match = src.match(/\/resources\/ckimage\/(.*?)(?="|$)/);
            return match ? match[1] : null;
        }).filter(Boolean); // null 값을 제거.
    }

    extractImageFilenames();

	adjustDiv3Position();
});

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
        var deleteUrl = "delete.do?goods_idx=" + goods_idx + "&image_url=" + encodeURIComponent(image_url) + imageFilenamesQueryString;

        // 삭제 페이지로 이동
        location.href = deleteUrl;
    }
}


/**
상품 수정
*/
function update_goods(goods_idx){

		 if (confirm("해당 상품을 수정하시겠습니까?") == true) {
					  location.href="update_form.do?goods_idx="+goods_idx;
		}

}


/**
장바구니 등록
*/
function add_cart(){
		  
	      
	       if("${ empty user }" == "true"){
	    	   
	    	   if(confirm("장바구니 등록은 로그인후 가능합니다\n로그인하시겠습니까?") == false)return;
	    	   
	    	   //현재 주소
	    	   const url = location.href;
	    	   //alert(url);
	    	   
	    	   //로그인 폼으로 이동                             charset생략시 현재 pageEncoding을 설정    
	    	  location.href="${ pageContext.request.contextPath}/member/login_form.do?url=" +  encodeURIComponent(url , "utf-8");
	    	   
	    	   return;
	       }
	      
	      if ($("#optionSelect").val() === "none") {
  		  alert("상품옵션을 선택하세요!");
    	  return;
		  }

	   
	       //Ajax처리(장바구니 등록)
	       $.ajax({
	    	   
	    	   url			:"${ pageContext.request.contextPath }/cart/cart_insert.do",  // CartInsertAction  : cart_insert.do?p_idx=5&mem_idx=1 
	    	   data		:	{"goods_idx":"${ vo.goods_idx }" , "product_count": $("#product_count").val() },
	    	   dataType	:	"json",
	    	   success	:	function(res_data){
	    		   
	    		   if(res_data.result == 'exist'){
	    			    if(confirm("장바구니에 해당 상품이 이미 등록되어 있습니다\n장바구니보기로 이동하시겠습니까?")==false)
	    			   return;
					      location.href="${ pageContext.request.contextPath }/cart/cart_form.do";
	    		   }
	    		   
	    		   if(res_data.result == 'success'){
	    			   
	    			   if(confirm("장바구니에 상품을 등록했습니다\n장바구니보기로 이동하시겠습니까?")==false)return;
	    			   
	    			   //장바구니 보기 mem_idx=1 는 임시 나중에 제대로 막아야 함
	    			   location.href="${ pageContext.request.contextPath }/cart/cart_form.do";
	    		   }
	    	   },
	    	   error	:	function(err){
	    		  
	    		   alert(err.responseText);
	    	   }
	    	   
	       });
	       
	       
	  }

// 동적으로 생성된 내용에 따라 div3의 위치를 조정하는 함수
function adjustDiv3Position() {
    var dynamicContent = document.getElementById("dynamicContent");
    var dynamicContentTop = dynamicContent.offsetTop; // 동적 콘텐츠의 상단 위치
    var dynamicContentHeight = dynamicContent.offsetHeight; // 동적 콘텐츠의 높이
    var div2Height = document.querySelector(".div2").offsetHeight; // div2의 높이

    // div3의 위치를 동적으로 조정
    var div3 = document.querySelector(".div3");
    div3.style.top = (dynamicContentTop + dynamicContentHeight + div2Height) + "px";
}


	  function updateQuantity() {

		     
            var optionSelect = document.getElementById("optionSelect");
            var quantitySection = document.getElementById("quantitySection");
            var quantityInput = document.getElementById("quantityInput");

            if (optionSelect.value !== "none") {
                quantitySection.style.display = "block";
            } else {
                quantitySection.style.display = "none";
            }
        }


		 function calculateTotal() {
        var productCount = parseInt($("#product_count").val());
        var unitPrice = ${vo.goods_rate_price}; // 상품의 단가, 여기서는 임의로 1000원으로 설정했습니다.
        var totalPrice = productCount * unitPrice; // 총 구매 금액 계산
        $("#total_price").text(totalPrice.toLocaleString()); // 총 구매 금액을 화면에 업데이트
    }
</script>
<body>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp" />
	<div class="flex-container">
	
	<div class="goods_views_box">
	<div class="goods_menu"> <a href="list.do">GoodsHome</a> > 상품상세</div>
	<section style="text-align: center;">


		<div class="parent">
			<div class="div1"><img src="${ pageContext.request.contextPath }/upload/${vo.image_url}"  ><br>

			 <c:if test="${ user.mem_grade eq '관리자' }">
			 <a onclick="location.href='${ pageContext.request.contextPath }/admin/goods_list_admin.do'" class="button  small">상품리스트</a>
			<a onclick="delete_goods(${vo.goods_idx},'${vo.image_url}');" class="button  small">상품 삭제</a>
			<a onclick="update_goods(${vo.goods_idx});" class="button  small">상품 수정</a>
			</c:if>
			<br>
			<br>
	
			</div>
			<div class="div2">
			<h2>${vo.goods_name}</h2>
			<h3>판매가    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; &nbsp;   &nbsp;&nbsp;  <fmt:formatNumber value="${vo.goods_rate_price}"></fmt:formatNumber>원 <span style="    text-decoration: line-through; font-size: smaller; color: grey;">
        		<fmt:formatNumber value="${vo.goods_price}"></fmt:formatNumber>원
    		</span></h3>
			 &nbsp; &nbsp; &nbsp; &nbsp;상품 리뷰 수     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  ${vo.goods_reviews}<br>
			&nbsp; &nbsp; &nbsp; &nbsp;배송방법   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    택배<br>
			&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;배송비   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <c:if test="${vo.goods_price < 30000}"> <fmt:formatNumber value="3000"></fmt:formatNumber>(30,000 이상 구매 시 무료)</c:if> 
			<c:if test="${vo.goods_price >= 30000}"> <fmt:formatNumber value="0"></fmt:formatNumber>(30,000 이상 구매 시 무료)</c:if> 
			<br>

			 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;상품 옵션 선택&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
   				 <select id="optionSelect" onchange="updateQuantity()" >
      				  <option value="none">옵션선택</option>
       				 <option value="${vo.goods_name}">${vo.goods_name}</option>
   				 </select>
	   					 <div id="quantitySection" style="display: none;">
        			<h3>수량 선택</h3>
    		  <table>
   		 <tr>
        		<td>수량:</td>
        		<td><input type="number" id="product_count" min="1" value="1"></td>
        		<td> <a href="#" onclick="add_cart()" class="button small">장바구니 담기</a> </td>
   				 </tr>
    <tr>
        <td colspan="3" style="text-align:right;">
            <p>총 구매금액: <span id="total_price"></span>원</p>
        </td>
    </tr>
</table>
    </div>
			<br>
			<br>
			<br>
	
			&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			</div>
			<div class="div3">${vo.goods_contents} </div>
			<div class="div4">
<b>상품결제정보</b><br>
고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br><br>

무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.
주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.<br><br>

<b>배송정보</b><br>
배송 방법 : 택배<br>
배송 지역 : 전국지역<br>
배송 비용 : 3,000<br>
배송 기간 : 3일 ~ 7일<br>
배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br><br>

<b>교환 및 반품정보</b><br>
<b>교환 및 반품 주소</b><br>
 - [07217] 서울특별시 영등포구 당산로41길 11 (당산동4가) 당산SKV1center 지하 4층 401호 CGV 씨네샵 교환/반품 (항만서비스)<br><br>
 
<b>교환 및 반품이 가능한 경우</b><br>
 - 계약내용에 관한 서면을 받은 날부터 7일. 단, 그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터 7일 이내<br>
  - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터 3월이내, 그사실을 알게 된 날 또는 알 수 있었던 날부터 30일이내<br><br>
 
<b>교환 및 반품이 불가능한 경우</b><br>
 - 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
  - 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>
  - 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>
  - 복제가 가능한 재화등의 포장을 훼손한 경우<br>
  - 개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우<br>
  - 디지털 콘텐츠의 제공이 개시된 경우, (다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한 부분은 청약철회를 할 수 있습니다.)<br><br>
 
※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
 (색상 교환, 사이즈 교환 등 포함)<br>
 (초기 배송 시 무료 배송 받으신 후 위와 같은 상황으로 반품 하실 경우 초기 배송비도 고객님께서 부담하셔야 함을 안내드립니다.)

			
			</div>
		</div>
		
	</section>
	</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp" />
</body>
</html>