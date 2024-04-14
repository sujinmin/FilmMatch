<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
--><html><head><title>Generic - Introspect by TEMPLATED</title><meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>

<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="main"><div class="inner">
        <header class="major special"><h1>Mypage</h1>
            <p>위치는 : member   >   mypage_form</p>
        </header>
        <p></p>
        <p></p>

        <table>
            <tr>
                <th>장바구니</th>
                <td>
                    <a href="${pageContext.request.contextPath}/cart/cart_form.do"><button type="button" >버튼</button></a>
                </td>
            </tr>
            <tr>
                <th>결제내역</th>
                <td> <a href="${pageContext.request.contextPath}/payment/payment_list.do"><button type="button"  >버튼</button></a></td>
            </tr>
            <tr>
                <th>나의정보</th>
                <td> <a href="${pageContext.request.contextPath}/mypage_myinfo.do"><button type="button">버튼</button></a></td>
            </tr>
            <tr>
                <th>내가쓴 글</th>
                <td><a href="${pageContext.request.contextPath}/support/support_home.do"><button type="button">버튼</button></a></td>
            </tr>

        </table>




    </div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
</body>
</html>
