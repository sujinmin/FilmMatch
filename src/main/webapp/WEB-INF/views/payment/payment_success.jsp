<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<link rel="icon" href="../image/ban.png" />
<link rel="apple-touch-icon" href="../image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="../image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="../image/ban.png">
<link rel="manifest" href="../image/ban.png">
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>결제 결과</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<script type="text/javascript">                     
$(document).ready(function(){                    
location.href="${pageContext.request.contextPath}/payment/payment_list.do";
                                                                                                                                   
});

                                                             
</script>
</head>
<body>






</body>
</html>
<%--  
이 JSON 데이터는 토스 결제 API를 통해 결제가 성공적으로 이루어진 후에 반환되는 정보를 나타냅니다. 각 항목의 의미는 다음과 같습니다:
{
"country":"KR"
,"orderId":"sample-1712041474667"
,"cashReceipts":null
,"isPartialCancelable":true
,"lastTransactionKey":"EB5BD5938AF5E744150A24E2C4A26DB1"
,"discount":null
,"taxExemptionAmount":0
,"suppliedAmount":2838
,"secret":"ps_26DlbXAaV0KWeEJl0Egd3qY50Q9R"
,"type":"NORMAL"
,"cultureExpense":false
,"taxFreeAmount":0
,"requestedAt":"2024-04-02T16:04:42+09:00"
,"currency":"KRW"
,"paymentKey":"tviva20240402160442ifhs2"
,"virtualAccount":null
,"checkout":{"url":"https:\/\/api.tosspayments.com\/v1\/payments\/tviva20240402160442ifhs2\/checkout"}
,"orderName":"ㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ 외 1건"
,"method":"간편결제"
,"useEscrow":false
,"vat":284
,"mId":"tvivarepublica"
,"approvedAt":"2024-04-02T16:05:04+09:00"
,"balanceAmount":3122
,"version":"2022-11-16"
,"easyPay":{"amount":3122,"provider":"토스페이","discountAmount":0}
,"totalAmount":3122
,"cancels":null
,"transfer":null
,"mobilePhone":null
,"failure":null
,"receipt":{"url":"https:\/\/dashboard.tosspayments.com\/receipt\/redirection?transactionId=tviva20240402160442ifhs2&ref=PX"}
,"giftCertificate":null
,"cashReceipt":null
,"card":null
,"status":"DONE"
}

country: 거래가 발생한 국가의 코드입니다. 여기서 "KR"은 대한민국을 의미합니다.
orderId: 거래에 대한 고유 주문 식별자입니다.
cashReceipts: 현금 영수증 정보입니다. 여기서는 null로 반환되었으니, 현금 영수증이 발행되지 않았음을 의미합니다.
isPartialCancelable: 부분 취소 가능 여부를 나타냅니다. true는 부분 취소가 가능함을 의미합니다.
lastTransactionKey: 마지막 거래에 대한 키입니다. 이는 거래를 추적하거나 검증할 때 사용될 수 있습니다.
discount, taxExemptionAmount, taxFreeAmount: 할인 금액, 면세 금액, 비과세 금액을 나타냅니다. 여기서는 모두 null이거나 0으로, 적용된 금액이 없음을 의미합니다.
suppliedAmount: 공급가액으로, 상품이나 서비스의 순수한 가격을 의미합니다.
secret: API 통신에서 사용되는 비밀 키입니다. 이 키는 보안을 위해 공개되어서는 안 됩니다.
type: 거래 유형을 나타냅니다. "NORMAL"은 일반 거래임을 의미합니다.
requestedAt: 거래 요청 시간입니다.
currency: 거래 화폐 단위입니다. "KRW"는 대한민국 원화를 의미합니다.
paymentKey: 결제를 식별하는 데 사용되는 키입니다.
checkout: 결제 확인을 위한 URL입니다.
orderName: 주문 명칭입니다.
method: 결제 방법을 나타냅니다. "간편결제"는 토스의 간편 결제 방식을 사용했음을 의미합니다.
vat: 부가가치세 금액입니다.
mId: 가맹점 식별자입니다.
approvedAt: 결제 승인 시간입니다.
balanceAmount: 잔액입니다.
version: API 버전입니다.
easyPay: 간편 결제 정보입니다.
totalAmount: 총 결제 금액입니다.
status: 거래 상태입니다. "DONE"은 거래가 완료되었음을 의미합니다.
이 데이터는 테스트 결제를 위한 예시로, 실제 운영 환경에서는 secret과 같은 민감한 정보를 안전하게 관리해야 합니다. 실제 서비스에 적용할 때는 이러한 정보가 외부에 노출되지 않도록 주의해야 합니다.




--%>










