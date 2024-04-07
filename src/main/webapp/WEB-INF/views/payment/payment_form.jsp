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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<style type="text/css">
th{
 vertical-align: middle;
        text-align: center;
}

</style>
<script type="text/javascript">
let amount = ${total_amount_all};
var goodsNames = [];
let goods_name="no";
let path = "/payment/";
let successUrl = window.location.origin + path + "success.do";
let failUrl = window.location.origin + path + "fail.do";
let callbackUrl = window.location.origin + path + "va_callback.do";
let orderId=new Date().getTime();
let user_email="${user.mem_email}";

// cart_idx 값을 문자열로 조합
 // URL 파라미터로 온 cart_idx 값들을 저장하는 배열
const urlParams = new URLSearchParams(window.location.search);
const cartIdxValues = urlParams.getAll('cart_idx');


var cart_idx_string = cartIdxValues.map(idx => 'cart_idx=' + idx).join('&');

let customerName="${user.mem_name}";	
if(amount<30000) {
	amount=amount+3000;
}

 let tossPayments = TossPayments("test_ck_Z1aOwX7K8melA9eOqzRm8yQxzvNP");
$(document).ready(function() {



	
	$('[id^="goods_name_"]').each(function() {
    		goodsNames.push($(this).val());
	});
    
	var arrayLength = goodsNames.length;
	//alert(arrayLength);
	if(arrayLength==1){
		goods_name=goodsNames[0];
		
	}
	else{
		goods_name=goodsNames[0]+" 외 "+(arrayLength-1) +"건";
		
	}

	//alert(goods_name);
	
    // select 요소가 변경될 때
    $('#card_list').change(function() {
        // 선택한 카드의 값과 hidden 값을 가져오기
        var selectedCardNum = $('option:selected', this).data('card-number');
        var selectedCardType = $('option:selected', this).data('card-type');
        
        // 가져온 값을 각각의 input 태그에 입력
        $('#card_number').val(selectedCardNum);
        $('#card_type').val(selectedCardType);
    });
    
  
});


	function find_addr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// {"zonecode":"03366","address":"서울 은평구 불광로 2길 33"}
				$("#pay_zipcode").val(data.zonecode);
				$("#pay_addr").val(data.address);
			} 
		}).open();
	}

	function send(f) {

        let paymentMethod=f.paymentMethod.value;
		console.log(goods_name);
		if(confirm("해당상품을 결제하시겠습니까?") == false) return;


 			var pay_zipcode = $('#pay_zipcode').val();
            var pay_addr = $('#pay_addr').val();
            var deliveryFee=$('#deliveryFee').val();
            var pay_name = $('#pay_name').val();

            let successUrlWithParams  = successUrl + '?'+cart_idx_string+
			     '&pay_zipcode=' + encodeURIComponent(pay_zipcode) +
                '&pay_addr=' + encodeURIComponent(pay_addr) +
                '&deliveryFee=' + encodeURIComponent(deliveryFee) +
                '&pay_name=' + encodeURIComponent(pay_name);
		    
			let pay_phone=$('#pay_phone').val();
			let clean_phone = pay_phone.replace(/-/g, '').replace(/\D/g, '');




		 let jsons = {
        "card": {
            "amount": amount,
            "orderId": "test-"+orderId,
            "orderName": goods_name,
            "successUrl": successUrlWithParams,
            "failUrl": failUrl,
            "cardCompany": null,
            "cardInstallmentPlan": null,
            "maxCardInstallmentPlan": null,
            "useCardPoint": false,
            "customerName": customerName,
            "customerEmail": user_email,
            "customerMobilePhone": clean_phone,
            "taxFreeAmount": null,
            "useInternationalCardOnly": false,
            "flowMode": "DEFAULT",
            "discountCode": null,
            "appScheme": null
        },
        "transfer": { //계좌이체 결제창

            "amount": amount,
            "orderId": "test-"+orderId,
            "orderName": goods_name,
            "successUrl": successUrlWithParams,
            "failUrl": failUrl,
            "customerName": customerName,
            "customerEmail": user_email,
            "customerMobilePhone": clean_phone,
            "taxFreeAmount": null,
            "cashReceipt": {
                "type": "소득공제"
            },
            "useEscrow": false

        },
        "phone": { // 휴대폰 결제창

            "amount": amount,
            "orderId": "test-"+orderId,
            "orderName": goods_name,
            "successUrl": successUrlWithParams,
            "failUrl": failUrl,
            "mobileCarrier": null

        },

        "certificate": { //상품권 결제창
            "amount": amount,
            "orderId":  "test-"+orderId,
            "orderName": goods_name,
            "successUrl": successUrlWithParams,
            "failUrl": failUrl
        },


	}


		if(paymentMethod=="카드"){
	  
		pay('카드',jsons.card);
		}
		else if(paymentMethod=="계좌이체"){
			pay(paymentMethod,jsons.transfer);
		}

		
	}
	

	
	


/*--------------------------------------------------------------------토스 결제-------------------------------------------------------------------------------------------------------------*/
    

    function pay(method, requestJson) {
      


        tossPayments.requestPayment(method, requestJson)        
            .catch(function (error) {

                if (error.code === "USER_CANCEL") {
                    alert('유저가 취소했습니다.');
                } else {
                    alert(error.message);
                }

            });
    }



	
   
/*--------------------------------------------------------------------토스 결제-------------------------------------------------------------------------------------------------------------*/




</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title></head>

<body>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="one">
<div class="inner">
			<header class="align-center">
				<h1>결제정보</h1>
			</header>
			<form class="form-inline">
				
				
				<div style="width: 1300px; margin: auto;">
					<table class="table table-wrapper">
						<tr>
							<th><label>우편번호</label></th>
							<td><input class="form-control" name="pay_zipcode" id="pay_zipcode" value="${user.mem_zipcode}"> <input class="button special small" type="button" value="주소검색" onclick="find_addr();"></td>
						</tr>
						<tr>
							<th><label>배송지</label></th>
							<td><input class="form-control" name="pay_addr" id="pay_addr" size="50" value="${user.mem_addr}"></td>
						</tr>

				
						<tr>
							<th><label>결제방식</label></th>
							<td><select style="width: 20%" id="paymentMethod">
									<option>결제 방식을 선택하세요</option>
									<option value="카드">카드결제</option>
									<option value="계좌이체">계좌이체</option>
							

							</select></td>
						</tr>

						<tr>
							<th><label>주문자</label></th>
							<td><span><input class="form-control" name="pay_name" id="pay_name"  size="50" value=""></span></td>
						</tr>

						<tr>
							<th><label>전화번호</label></th>
							<td><input class="form-control" name="pay_phone" id="pay_phone" size="50" value="${user.mem_phone}"></td>
						</tr>

						<tr>
							<th><label>주문상품</label></th>
							<td>
								<table class="table table-bordered">

									<tr bgcolor="#dedede">
										<th width="25%" colspan="2">제품명</th>

										<th width="15%">금액</th>
										<th width="15%">상품수량</th>
										<th width="30%">상품이미지</th>


										<!-- <th>삭제</th> -->
									</tr>

									<!--  for(CartVo cart : cart_list)   -->
									 <c:forEach var="payment" items="${payment_list}" varStatus="status"> 
										<input type="hidden" value="${payment.cart_idx}" name="cart_idx">
										<tr align="center">
										
											<td colspan="2"><input type="hidden" value="${payment.goods_name}" name="goods_name" id="goods_name_${status.index}" >${payment.goods_name}</td>
											<td><b>
											<fmt:formatNumber value="${payment.goods_rate_price * payment.product_count}"/>   <span class="strikethrough"><fmt:formatNumber value="${payment.goods_price * payment.product_count}"/></span></b>
											</td>
											<td><input type="hidden" value="${payment.product_count}" name="product_count">${payment.product_count}</td>
											<td><img src="${pageContext.request.contextPath}/upload/${payment.image_url}" width="200" height="200"> <input type="hidden" value="${payment.image_url}" name="image_url"></td>


										</tr>

									 </c:forEach> 





									<tr>
										<td colspan="3" align="right">상품 결제 금액 :</td>
										<td align="right"><fmt:formatNumber value="${total_amount_all}" /> (원) <input type="hidden" value="${total_amount_all}" name="total_amount_all"></td>

									</tr>
									<tr>
										<td colspan="3" align="right">(총 결제 금액이 3,0000원 이상일 경우 배송비는 무료 입니다.)배송비 :</td>
										<c:if test="${ total_amount_all<30000}"> 
											<td align="right"><fmt:formatNumber value="3000" /> (원)</td>
											<input type="hidden" name="deliveryFee" id="deliveryFee" value="3000">
										 </c:if>
										 <c:if test="${ total_amount_all>=30000}">
											<td align="right"><fmt:formatNumber value="0" /> (원)</td>
											<input type="hidden" name="deliveryFee" id="deliveryFee" value="0">
										</c:if> 
									</tr>

									<tr>
										<td colspan="3" align="right">총 결재액 :</td>
										 <c:if test="${total_amount_all<30000}"> 
											<td align="right"><b style="font-size: 20px"><fmt:formatNumber value="${total_amount_all+3000}" /> (원)</b></td>
											<input type="hidden" value="3000" name="amount_appr">

										 </c:if> 
										 <c:if test="${ total_amount_all>=30000}">
											<td align="right"><b style="font-size: 20px"><fmt:formatNumber value="${total_amount_all}" /> (원)</b></td>
											<input type="hidden" value="0" name="amount_appr">
										</c:if> 
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: right;"><input type="button" value="결제" class="btn btn-primary" onclick="send(this.form);"></td>
						</tr>
					</table>
				</div>
			</form>

		</div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>