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

    $(document).ready(function() {// 페이지 로드 시에 실행될 코드
    
    var mem_grade = "${vo.mem_grade}"; // JSP에서 가져온 회원 등급 정보
    var policy_a = "${vo.policy_a}";
    var policy_b = "${vo.policy_b}";
    var mem_gender = "${vo.mem_gender}";

    // 회원 등급에 따라 선택 옵션 설정
    if (mem_grade === '관리자') {
        $("#mem_grade").val('관리자');
    } else if (mem_grade === '일반') {
        $("#mem_grade").val('일반');
    } else {
        // 기타 등급일 경우 기본값 설정
        // $("#mem_grade").val('평론가');
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

    if (mem_gender === '남자') {
        $("#mem_gender").val('남자');
    } else if (mem_gender === '여자') {
        $("#mem_gender").val('여자');
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

	function send(f) {
		//폼에서 입력된값 체크...
		let mem_name = f.mem_name.value.trim();
		let mem_pwd = f.mem_pwd.value.trim();
		let mem_birth = f.mem_birth.value;
		let mem_email = f.mem_email.value;
		let mem_phone = f.mem_phone.value;
		let mem_zipcode = f.mem_zipcode.value;
		let mem_addr = f.mem_addr.value;
		
		if (mem_name=='') {
			alert('이름을 입력하세요!')
			f.mem_name.value='';
			f.mem_name.focus();
			return;
		}
		
		if (mem_pwd=='') {
			alert('비밀번호을 입력하세요!')
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			return;
		}

        if (mem_birth == "") {
            alert("생년월일을 선택해주세요.");
            f.mem_birth.focus();
            return;
        }

		if (regular_email.test(mem_email)==false) {
			alert('이메일을 입력하세요! \n 옳바른 형식으로 입력하세요!')
			f.mem_email.value='';
			f.mem_email.focus();
			return;
		}

		if (regula_phone.test(mem_phone)==false) {
			alert('전화번호을 입력하세요! \n 옳바른 형식으로 입력하세요!')
			f.mem_phone.value='';
			f.mem_phone.focus();
			return;
		}
		
		if (mem_zipcode=='') {
			alert('우편번호을 입력하세요!')
			f.mem_zipcode.value='';
			f.mem_zipcode.focus();
			return;
		}
		if (mem_addr=='') {
			alert('주소을 입력하세요!')
			f.mem_addr.value='';
			f.mem_addr.focus();
			return;
		}

        if (confirm("정말 수정하시겠습니까?")) {
                f.action = "modify.do";
                f.submit(); //전송	
        }else {
            return false; // 수정 취소 시 전송하지 않음
        }
	}

 </script>

</head>
<body class=""> <!-- class="sb-nav-fixed" -->
<form>
    <input type="hidden" name="mem_idx" value="${vo.mem_idx}">
    <!-- <canvas id="myBarChart" width="100%" height="50"></canvas> -->
    <div class="panel-body">
        <table class="table">
            <tr>
                <th colspan="2">
                    회원번호 : ${ vo.mem_idx }<br>
                    ${ vo.mem_name }(${ vo.mem_id })님의 회원정보수정
                </th>
            </tr>
            <tr>
                <th><label>이름</label></th>
                <td><input class="form-control"  type="text" name="mem_name" value="${ vo.mem_name }"></td>
                <!-- <input>tag의 속성 disabled="disabled"  form이 서버로 넘어갈 떄 주소에body에 안넘어간다. 
                                        readonly="readonly"는 등록된 값은 넘어간다.	-->
            </tr>
            <tr>
                <th><label>아이디</label></th>
                <td><input class="form-control" name="mem_id" readonly="readonly" value="${ vo.mem_id }">
                <!-- name : parameter로 서버로 넘어가는 data
                        id : 서버로 보이지 않음 -->
                    
                </td>
            </tr>
            <tr>
                <th><label>비밀번호</label></th>
                <td><input class="form-control" type="text" name="mem_pwd" value="${ vo.mem_pwd }"></td>
            </tr>
            <tr>
                <th><label>생년월일</label></th>
                <td>
                    <label>
                        <input class="form-control" type="date" name="mem_birth" id="mem_birth" required pattern="\d{4}-\d{2}-\d{2}" value="${ vo.mem_birth }" />
                    </label>
                </td>
            </tr>
            <tr>
                <th><label>성별</label></th>
                <td>
                    <select class="form-control" name="mem_gender" id="mem_gender">
                        <option disabled selected>성별을 선택하세요</option>
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th><label>이메일</label></th>
                <td><input class="form-control" name="mem_email" value="${ vo.mem_email }"></td>
            </tr>
            <tr>
                <th><label>전화번호</label></th>
                <td><input class="form-control" name="mem_phone" value="${ vo.mem_phone }"></td>
            </tr>

            <tr>
                <th style="vertical-align: middle;">주소</th>
                <td>
                    <div style="display: inline-flex; align-items: center; margin-bottom: 10px;">
                        <input class="form-control" name="mem_zipcode" id="mem_zipcode" value="${ vo.mem_zipcode }">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-info" type="button" value="주소검색" onclick="find_addr();">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <input class="form-control"  name="mem_addr"  id="mem_addr" size="50" value="${ vo.mem_addr }">
                </td>
            </tr>
            <tr>
                <th> 회원등급 </th>
                <td>
                    <select class="form-control" name="mem_grade" id="mem_grade">
                        <option value="일반">일반</option>
                        <option value="관리자">관리자</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th> 필수 이용약관 </th>
                <td>
                    <select class="form-control" name="policy_a" id="policy_a">
                        <option value="Y">동의하합니다.</option>
                        <option value="N">동의하지 않습니다.</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th> 개인정보 약관 </th>
                <td>
                    <select class="form-control" name="policy_b" id="policy_b">
                        <option value="Y">동의하합니다.</option>
                        <option value="N">동의하지 않습니다.</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="button" value="회원수정" 
                            onclick="send(this.form);" >
                    <!-- <input class="btn btn-success" type="button" value="목록보기"
                            onclick="location.href='list.do'" > -->
                </td>
            </tr> 
        </table>

    </div>
</form>
</body>
</html>