<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>

<head>
<title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/main.css">
 <!-- DAUM 주소검색 API -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <style>
    input:disabled {
    color: #dd2828;
    font-weight: bold; 
    }
    select:disabled {
    color: black;
    font-weight: bold;
    }
 </style>
<script type="text/javascript">

    $(document).ready(function() {// 페이지 로드 시에 실행될 코드
    
    var policy_a = "${vo.policy_a}";
    var policy_b = "${vo.policy_b}";
    var mem_gender = "${vo.mem_gender}";

    
    if (mem_gender === '남자') {
        $("#mem_gender").val('남자');
    } else if (mem_gender === '여자') {
        $("#mem_gender").val('여자');
    }

    if (policy_a === 'Y') {
        $("#policy_a").val('Y');
    } else if (policy_a === 'N') {
        $("#policy_a").val('N');
    } 

    if (policy_b === 'Y') {
        $("#policy_b").val('Y');
    } else if (policy_b === 'N') {
        $("#policy_b").val('N');
    }




     });


        
	function find_addr() {
		new daum.Postcode({
	        oncomplete: function(data) { //json
	        	//data = {"zonecode":"13529", "address":"경기 성남시 분당구",..."}
	        	// 주소창에서 선택된 주소값을 입력창에 넣어준다
	        	$("#mem_zipcode").val(data.zonecode);
	        	$("#mem_addr").val(data.roadAddress);
	        
	        }
	    }).open();
		
	} //end: fine_addr()
  	
	//이메일 정규식 2번 중첩되어 var로 변경
	var regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	var regula_phone = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

    //var mem_birth = document.getElementById("mem_birth").value;

	function send(send_form) {
		//폼에서 입력된값 체크...
		let mem_name = send_form.mem_name.value.trim();
		let mem_pwd = send_form.mem_pwd.value.trim();
		let mem_birth = send_form.mem_birth.value;
		let mem_email = send_form.mem_email.value;
		let mem_phone = send_form.mem_phone.value;
		let mem_zipcode = send_form.mem_zipcode.value;
		let mem_addr = send_form.mem_addr.value;
		
		if (mem_name=='') {
			alert('이름을 입력하세요!')
			send_form.mem_name.value='';
			send_form.mem_name.focus();
			return;
		}
		
		if (mem_pwd=='') {
			alert('비밀번호을 입력하세요!')
			send_form.mem_pwd.value='';
			send_form.mem_pwd.focus();
			return;
		}

        if (mem_birth == "") {
            alert("생년월일을 선택해주세요.");
            send_form.mem_birth.focus();
            return;
        }

		if (regular_email.test(mem_email)==false) {
			alert('이메일을 입력하세요! \n 옳바른 형식으로 입력하세요!')
			send_form.mem_email.value='';
			send_form.mem_email.focus();
			return;
		}

		if (regula_phone.test(mem_phone)==false) {
			alert('전화번호을 입력하세요! \n 옳바른 형식으로 입력하세요!')
			send_form.mem_phone.value='';
			send_form.mem_phone.focus();
			return;
		}
		
		if (mem_zipcode=='') {
			alert('우편번호을 입력하세요!')
			send_form.mem_zipcode.value='';
			send_form.mem_zipcode.focus();
			return;
		}
		if (mem_addr=='') {
			alert('주소을 입력하세요!')
			send_form.mem_addr.value='';
			send_form.mem_addr.focus();
			return;
		}

        if (confirm("정말 수정하시겠습니까?")) {
                send_form.action = "myinfo_modify.do";
                send_form.submit(); //전송	
        }else {
            return false; // 수정 취소 시 전송하지 않음
        }
	}

 </script>
</head>
<body>

<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="main">
    <div class="inner">
        <header class="major special"><h1>나의정보</h1>
            <p>나의 정보수정 / 나의 주소 목록</p>
        </header>
        <p></p>
        <p></p>
        <form id="send_form">
            <input type="hidden" name="mem_idx" value="${vo.mem_idx}">
            <!-- <canvas id="myBarChart" width="100%" height="50"></canvas> -->
            <div class="panel-body">
                <table class="table">
                    
                    <tr>
                        <th colspan="2">
                            <div>
                                <h2>나의 정보수정</h2>
                                <b>${ vo.mem_name }</b>님의 회원정보
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input class="form-control" type="text" id="mem_name" name="mem_name" value="${ vo.mem_name }"></td>
                        <!-- <input>tag의 속성 disabled="disabled"  form이 서버로 넘어갈 떄 주소에body에 안넘어간다. 
                                                readonly="readonly"는 등록된 값은 넘어간다.	-->
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td><input class="form-control" type="text" name="mem_id" readonly="readonly" value="${ vo.mem_id }" >
                            
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input class="form-control" type="password" id="mem_pwd" name="mem_pwd" value="${ vo.mem_pwd }"></td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <input class="form-control" type="date" name="mem_birth" id="mem_birth" required pattern="\d{4}-\d{2}-\d{2}" value="${ vo.mem_birth }"  readonly="readonly"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>
                            <select class="form-control" name="mem_gender" id="mem_gender"  readonly="readonly">
                                <option disabled>성별을 선택하세요</option>
                                <option value="남자">남자</option>
                                <option value="여자">여자</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input class="form-control" type="text" id="mem_email" name="mem_email" value="${ vo.mem_email }"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input class="form-control" type="text" id="mem_phone" name="mem_phone" value="${ vo.mem_phone }"></td>
                    </tr>
        
                    <tr>
                        <th style="vertical-align: middle;">주소</th>
                        <td>
                            <div style="display: inline-flex; align-items: center; margin-bottom: 10px;">
                                <input class="form-control" type="text" name="mem_zipcode" id="mem_zipcode" value="${ vo.mem_zipcode }">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="btn btn-info" type="button" value="주소검색" onclick="find_addr();">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <input class="form-control" type="text" name="mem_addr"  id="mem_addr" size="50" value="${ vo.mem_addr }">
                        </td>
                    </tr>
                   
                    <tr>
                        <th> 필수 이용약관 </th>
                        <td>
                            <select class="form-control" name="policy_a" id="policy_a"  readonly="readonly">
                                <option value="Y" selected>동의합니다.</option>
                                <option value="N">동의하지 않습니다.</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th> 개인정보 약관 </th>
                        <td>
                            <select class="form-control" name="policy_b" id="policy_b">
                                <option value="Y">동의합니다</option>
                                <option value="N">동의하지 않습니다.</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <input class="btn btn-primary" type="button" value="나의정보수정" 
                                    onclick="send(this.form);" >

                        </td>
                    </tr> 
                </table>
        
            </div>
        
                             
        
        </form>

        <!-- 회원주소 목록 -->

        <h2>나의 주소목록</h2>

        <form>
            <table>
                <tr>
                    <th colspan="5"><b>${vo.mem_name}</b>주소목록</th>
                </tr>
                
                
                <tr>
                    <th>번호</th>
                    <th>우편번호</th>
                    <th>주소</th>
                    <th>상세주소</th>
                    <th>편집</th>
                </tr>
                <c:forEach items="${ list }" var="vo">
                    <tr>
                        <td>${list.no}</td> <!-- 번호를 순서대로 표시 -->
                        <td>${list.zipcode}</td> <!-- 게시물 제목 -->
                        <td>${list.addr_street}</td>
                        <td>${list.addr_detail}</td>
                        <td>
                            <input class="button alt" type="button" value="삭제" onclick="location.href='addr_delete.do'">
                            <input class="button alt" type="button" value="수정" onclick="update();">
                        </td>

                    </tr>
                </c:forEach>
                
                <!-- 게시물이 없는경우 -->
                <c:if test="${ empty list }"> <!-- request Binding에서 줌 -->
                    <tr>
                        <td colspan="5" align="center">
                            <font color="red">등록된 주소가 없습니다.</font>
                        </td>
                    </tr>	
                </c:if>

            </table>

        </form>








    </div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script><script src="assets/js/skel.min.js"></script><script src="assets/js/util.js"></script><script src="assets/js/main.js"></script></body></html>
