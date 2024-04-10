<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Management</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css"> -->

<!-- DAUM 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
</script>

</head>
<body class=""> <!-- class="sb-nav-fixed" -->
<form>
    <input type="hidden" name="mem_idx" value="${vo.mem_idx}">
    <!-- <canvas id="myBarChart" width="100%" height="50"></canvas> -->
    <div class="panel-body">
        <table class="table">
            <tr>
                <th>회원번호</th>
                <td>${ vo.mem_idx }</td>
            </tr>
            <tr>
                <th><label>이름</label></th>
                <td>${ vo.mem_name }</td>
            </tr>
            <tr>
                <th><label>아이디</label></th>
                <td>${ vo.mem_id }</td>
            </tr>
            <tr>
                <th><label>비밀번호</label></th>
                <td>${ vo.mem_pwd }</td>
            </tr>
            <tr>
                <th><label>생년월일</label></th>
                <td>${ vo.mem_birth }</td>
            </tr>
            <tr>
                <th><label>성별</label></th>
                <td>${ vo.mem_gender }</td>
            </tr>
            <tr>
                <th><label>아이피</label></th>
                <td>${ vo.mem_ip }</td>
            </tr>
            <tr>
                <th><label>가입일자</label></th>
                <td>${ vo.mem_regdate }</td>
            </tr>
            <tr>
                <th><label>갱신일자</label></th>
                <td>${ vo.mem_modifydate }</td>
            </tr>
            <tr>
                <th><label>비밀번호</label></th>
                <td>${ vo.mem_pwd }</td>
            </tr>
            <tr>
                <th><label>이메일</label></th>
                <td>${ vo.mem_email }</td>
            </tr>
            <tr>
                <th><label>전화번호</label></th>
                <td>${ vo.mem_phone }</td>
            </tr>
            <tr>
                <th><label>우편번호</label></th>
                <td>
                    ${ vo.mem_zipcode }
                </td>
            </tr>
            <tr>
                <th><label>주소</label></th>
                <td>
                   ${ vo.mem_addr }
                </td>
            </tr>
            <tr>
                <th> 회원등급 </th>
                <td>${ vo.mem_grade }</td>
            </tr>
            <tr>
                <th> 필수 이용약관 </th>
                <td>${ vo.policy_a }</td>
            </tr>
            <tr>
                <th> 개인정보 약관 </th>
                <td>${ vo.policy_b }</td>
            </tr>
            
        </table>

    </div>

                     

</form>
</body>
</html>