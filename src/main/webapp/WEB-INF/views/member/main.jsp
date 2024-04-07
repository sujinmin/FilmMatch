<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="이메일" aria-label="Username" id="signupModalInputtedUserEmail">
        <span class="input-group-text">@</span>
        <input type="text" class="form-control" placeholder="naver.com" id="showSelectedValue" value ="naver.com" aria-label="Username" disabled='true' />
           <select class="form-select" aria-label="Default select example" onchange="selectEmailChange(this)">
              <option selected value ="naver">네이버</option>
              <option value="google">구글</option>
              <option value="daum">다음</option>
              <option value="user_email_input">직접입력</option>
        </select>
    </div>
    <div class="d-grid gap-2 col-6 mx-auto">
        <button type="button" class="btn btn-primary" id="checkEmail" onclick="checkEmail()">이메일 인증</button>
    </div>
    <div id='checkEmailConfirm' ></div>
</body>
</html>