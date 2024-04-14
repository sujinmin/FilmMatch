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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/cart/cart.css">
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


<script type="text/javascript">

$(document).ready(function(){
	if("${is_deleted}"=="1"){
		alert('현재 카트에 판매중단된 상품 정보가 있습니다. 해당 정보는 삭제되었습니다.');
	}
	
		
			var top = 
			parseInt($("#quickmenu").css("top"));
			$("#quickmenu").css("top",130);
		
			
		// 스크롤 되어질때 quickmenu의 속성값도 이동하게 설정
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			
						
			var quickTop = top + scrollTop;
			
		
			
			//$("#quickmenu").animate({top:quickTop},1);
			$("#quickmenu").css("top",quickTop+100);
		});
	





// 전체 선택 체크박스 클릭 이벤트
$("#check_all").click(function() {
    const checked = $(this).is(':checked');
    $("input[name='cart_idx']").prop("checked", checked);
    calculateTotalAmount(); // 전체 금액을 다시 계산합니다.
});

// 개별 체크박스 변경 이벤트
$("input[name='cart_idx']").change(function() {
    // 전체 개수
    const total_count = $("input[name='cart_idx']").length;
    
    // 체크된 개수
    const check_count = $("input[name='cart_idx']:checked").length;
    
    // 전체 개수 == 체크된 개수가 같으면 전체 체크
    $("#check_all").prop("checked", total_count == check_count);
    
    calculateTotalAmount(); // 전체 금액을 다시 계산합니다.
});


});


// 전체 금액을 계산하는 함수
function calculateTotalAmount() {
    var totalAmount = 0;
    var deliveryFee = 3000; // 기본 배송비

    // 체크된 체크박스를 순회하며 금액을 계산
    $('input[type="checkbox"][name="cart_idx"]:checked').each(function() {
        var cartIdx = $(this).data('idx');
        var price = parseInt($('#price_' + cartIdx).val());
        var count = parseInt($('#count_' + cartIdx).text());
        totalAmount += price * count;
    });

    // 총 금액이 30,000원을 넘으면 배송비를 0원으로 설정
    if (totalAmount >= 30000  ) {
        deliveryFee = 0;
    }

	//체크된 값이 아예 없는경우 
	const check_count =$("input[name='cart_idx']:checked").length;
	if(check_count==0){
		deliveryFee =0;
	}
    // 총 금액과 배송비를 합산하여 표시
    $('#total_amount').text(formatNumberWithoutCurrencySymbol(totalAmount + deliveryFee)+"(원)");
    $('#deliveryFee').text("배송비:" + formatNumberWithoutCurrencySymbol(deliveryFee) + '(원)');
    $('#goods_amount_all').text("상품 총 금액:"+formatNumberWithoutCurrencySymbol(totalAmount) +'(원)');

	
}

// 숫자를 한국 원화 포맷으로 변환하지만 원화 기호는 제외하는 함수
function formatNumberWithoutCurrencySymbol(value) {
    return new Intl.NumberFormat('ko-KR').format(value);
}
/**
 * 선택된 상품 삭제처리
 */
function delete_cart_select(f){
	const check_count =$("input[name='cart_idx']:checked").length;
	
	// alert(check_count);
	if(check_count==0){
	alert('삭제할 상품을 선택하세요');
	
		return;
	}

		  if (window.confirm("해당 상품을 삭제하시겠습니까?")) {
				f.action="cart_delete_select.do"; // CartSelectDeleteAction.java
				f.submit();
		  }	

}

/**
 * 결제하기
 */
function payment(f){

const check_count =$("input[name='cart_idx']:checked").length;
	
	// alert(check_count);
	if(check_count==0){
	alert('결제할 상품을 선택하세요');
	
		return;
	}
	//결제 폼으로 이동


		
	if (window.confirm("해당 상품을 결제하시겠습니까?")) {
			f.action="payment_form.do";
			f.submit();
	} 

}

</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
<title>결제</title></head>

<body>


<section id="one">
<form>
<div class="inner">
			<header class="align-center">
				<h1>장바구니</h1>
				
				<div style="width:1300px; margin: auto;" class="table-wrapper"> 
				<%-- 테이블 폭이 텍스트 길이에 따라 변경되는 문제  차단 table-layout: fixed; --%>
				<table style="table-layout: fixed;">
				<thead>
				<tr>
				<td colspan="6" align="left">
				<input type="checkbox" id="check_all" class="form-control"><label for="check_all">
				
				 전체선택</label>
				</td>
			</tr>
			
			<tr bgcolor="#dedede" >
			    <th style="text-align: center;">선택</th>
				<th width="25%" style="text-align: center;">제품명</th>
				<th  style="text-align: center;">이미지</th>
				<th style="text-align: center;">판매사</th>
				<th style="text-align: center;" width="200px;">상품수량</th>
				<th style="text-align: center;">재조국</th>
				<th align="center" style="text-align: center;">금액</th>
				
				<!-- <th>삭제</th> 
				
				cart_idx,
				 user_idx,
				  prod_idx, prod_count, p_subject, sell_user_idx, p_price, p_status
				-->
			</tr>
			</thead>
			<c:forEach var="cart"  items="${list}" varStatus="i"> 
			<tbody id="idx_${i.index}">
				<tr align="center">
				<td style="vertical-align: middle;">
				<input type="checkbox" name="cart_idx"  value="${cart.cart_idx}" id="cart_idx_${cart.cart_idx}"  data-idx="${i.index}">
				<label for="cart_idx_${cart.cart_idx}">
				</label>
				</td>
				<td style="vertical-align: middle;"><a href="${ pageContext.request.contextPath }/goods/goods_view.do?goods_idx=${cart.goods_idx}">${ cart.goods_name }</a></td>
				<td style="vertical-align: middle;"><img src="${ pageContext.request.contextPath }/upload/${cart.image_url}" width="100" height="90">
				<td style="vertical-align: middle;">${ cart.goods_brand }</td>
				<td style="vertical-align: middle;" id="count_${i.index}">${ cart.product_count }</td>
				<td style="vertical-align: middle;">${ cart.country }</td>
				<td style="vertical-align: middle;">
				<input type="hidden" value="${ cart.goods_rate_price  }" id="price_${i.index}"> 
				<fmt:formatNumber value="${ cart.goods_rate_price *  cart.product_count }" /> <span class="strikethrough"><fmt:formatNumber value="${ cart.goods_price  *  cart.product_count }" /></span> (원)   
				</td>
			</tr>
			</tbody>
			<tr>
			
			</tr>
			</c:forEach> 
				 <!-- 장바구니목록이 없는경우 -->  
	        <c:if test="${ empty list }"> 
				<tr>
					<td colspan="6" align="center">
						<b><font color=red>장바구니가 비었습니다.</font></b>
					</td>
				</tr>
			</c:if>
			
			
			
	
			<tr>
				<td align="right" id="goods_amount_all" colspan="2" width="20%">상품 총 금액:0원</td >
				<td> + </td>
				<td id="deliveryFee"  colspan="2" width="20%">배송비:0(원)</td>
				<td> = </td>
				<td id="total_amount" width="20%">0(원)</td> 
			</tr>
			
			<tr>
			<td colspan="7" align="right">
				<input type="button" value="선택삭제" class="button" onclick="delete_cart_select(this.form);">
				<input type="button" value="결제" class="button special"
				onclick="payment(this.form);" >
			</td>
			</tr>
				
				
				</table>   
				</div>
				
				
				
				
			</header>
		</div>	
		</form>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>