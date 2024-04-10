<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- JSTL설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
    <title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="../assets/css/main.css">
<!-- <link href="../js/member/login.js"> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css"> -->
<style>
    .signup__btn{
       background:#33ccff;
       color:white;
       display:block;
       width:92.5%;
       max-width:680px;
       height:50px;
       border-radius:8px;
       margin:0 auto;
       border:none;
       cursor:pointer;
       /* font-size:14px; */
       font-family: 'Montserrat', sans-serif;
       box-shadow:0 15px 30px rgba(51, 204, 255, 0.36);
      transition:.2s linear;
      &:hover{
        box-shadow:0 0 0 rgba(51, 204, 255, 0.0);
      }
    }
    .policy_box{
        vertical-align: middle;
        padding: 30px;
        margin: auto;
        margin-bottom: 30px;
        width: 80%;
        
    }
    textarea{  /* width: 100%; */
	resize: none;
    height: 400px;
    vertical-align: middle;
    }
    .signup_btn{
        vertical-align: middle;
        width: 50%;
        text-align: center;
        display: flex;
    }
</style>
<script>
    function checkAgreement(f) {
        // "동의하겠습니다" 라디오 버튼이 선택되었는지 확인
        var agreementChecked = document.getElementById("a_y").checked;
        
        if (!agreementChecked) {
            // 알람 표시
            alert("약관에 동의해야 합니다.");
            // 회원가입 진행 버튼 비활성화
            document.getElementById("signup_button").disabled = true;
        } else {
            // 회원가입 진행 버튼 활성화
            //alert('화면전환');
            //location.href = "${pageContext.request.contextPath}/member/signup_form.do";
            f.action = "signup_form.do";
            f.submit();

        }
    }
</script>

</head>

<body>


<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>

<section id="main">
    <div class="inner">
        <header class="major special"><h1>개인정보 수집 ‧ 이용 동의서</h1></header>
        <h2>FilmAMtch 서비스 동의</h2>

        <section id="main"><!-- class="row uniform 50%" -->
           
            <!-- new form -->
            <form>
                <section>
                <table style="border: #33ccff;">
                    <tr>
                        <h3>이용약관 (필수)</h3>
                        <hr>

                        <div class="policy_box">
                            <iframe class="scroll" src="https://www.ftc.go.kr/solution/skin/doc.html?fn=b5bbcffdef4f9e856121b2ba1c0089df8c1dac13565ee8e66ba6d0ab318c011f&rs=/fileupload/data/result/BBSMSTR_000000002320/"
                              width="100%" height="400px"></iframe>
                              저희는 공정거래 위원회의 표준약관을 준수 합니다.<br>
                              위 약관의 OO회사은 저희 FilmAMtch를 의미합니다.
                        </div>
                    </tr>
                    <tr>      
                        <div id="main " style="text-align: center;">
                            <div class="policy_box">
                                <!-- 4u 12u$(xsmall) -->
                                <input type="radio" id="a_y" name="policy_a" value="Y" checked><label for="a_y">동의합니다.</label>
                            
                                <input type="radio" id="a_n" name="policy_a" value="N"><label for="a_n">동의하지않습니다.</label>
                            </div>
                        </div>               
                    </tr>
                    
                    <tr>
                        <h3>개인정보 수집및동의약관</h3>
                        <hr>
                        <textarea class="policy_box scroll">
1. 개인정보의 수집항목 및 수집방법 
통계청 나라통계사이트에서는 기본적인 회원 서비스 제공을 위한 필수정보로 실명인증정보와 가입정보로 구분하여 다음의 정보를 수집하고 있습니다. 필수정보를 입력해주셔야 회원 서비스 이용이 가능합니다.

    가. 수집하는 개인정보의 항목 
    * 수집하는 필수항목
        - 실명인증정보 : 이름, 휴대전화번호, 본인 인증 또는 I-PIN(개인식별번호), GPKI
        - 가입정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전화번호, 기관명
    * 선택항목
        - 주소, 기관의 부서명
    
    [컴퓨터에 의해 자동으로 수집되는 정보]
    인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
    - IP주소, 서비스 이용기록, 방문기록 등
    
    나. 개인정보 수집방법
        홈페이지 회원가입을 통한 수집 

2. 개인정보의 수집/이용 목적 및 보유/이용 기간
통계청 나라통계사이트에서는 정보주체의 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 통계청 나라통계사이트 서비스를 이용하기 위한 최소한의 개인정보를 보유 및 이용 하게 됩니다. 회원가입 등을 통해 개인정보의 수집·이용, 제공 등에 대해 동의하신 내용은 언제든지 철회하실 수 있습니다. 회원 탈퇴를 요청하거나 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업 폐지 등의 사유발생시 개인 정보를 지체 없이 파기합니다.

    * 실명인증정보
    - 개인정보 수집항목 : 이름, 휴대폰 본인 인증 또는 I-PIN(개인식별번호), GPKI
    - 개인정보의 수집·이용목적   : 홈페이지 이용에 따른 본인 식별/인증절차에 이용
    - 개인정보의 보유 및 이용기간 : I-PIN / GPKI는 별도로 저장하지 않으며 실명인증용으로만 이용

    * 가입정보
    - 개인정보 수집항목 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전환번호, 기관명
    - 개인정보의 수집·이용목적 : 홈페이지 서비스 이용 및 회원관리, 불량회원의 부정 이용방지, 민원신청 및 처리 등
    - 개인정보의 보유 및 이용기간 : 2년 또는 회원탈퇴시

정보주체는 개인정보의 수집·이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 통계청 나라통계사이트에 회원가입이 되지 않으며, 통계청 나라통계사이트에서 제공하는 서비스를 이용할 수 없습니다.

3. 수집한 개인정보 제3자 제공
통계청 나라통계사이트에서는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
        
4. 개인정보 처리업무 안내
통계청 나라통계사이트에서는 개인정보의 취급위탁은 하지 않고 있으며, 원활한 서비스 제공을 위해 아래의 기관을 통한 실명인증 및 공공 I-PIN, GPKI 인증을 하고 있습니다. 

    * 수탁업체
    - 행정자치부
        · 위탁업무 내용 : 공공 I-PIN, GPKI 인증
        · 개인정보 보유 및 이용 기간 : 행정자치부에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음.  
                        </textarea>
                    </tr>
                    <tr>      
                        <div id="main " style="text-align: center;">
                            <div class="policy_box">
                                <!-- 4u 12u$(xsmall) -->
                                <input type="radio" id="b_y" name="policy_b" value="Y" checked><label for="b_y">동의합니다.</label>
                            
                                <input type="radio" id="b_n" name="policy_b" value="N"><label for="b_n">동의하지않습니다.</label>
                            </div>
                        </div>               
                    </tr>
                    <tr>
                        <hr>
                        <!-- 회원가입 버튼 -->
                        <div class="policy_box signup_btn">
                            <button class="signup__btn" value="회원가입 진행" onclick="checkAgreement(this.form); return false;">
                                회원가입 진행
                                <!-- onclick="location.href='signup_form.do'" -->
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="signup__btn" onclick="location.href='../index.do'; return false;">
                                
                                회원가입 취소
                            </button>
                        </div>
                    </tr>
                </table>
                </section>
            </form>

        </section>
    </div>
</section>





<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
<!-- Scripts -->
<!-- <script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script> -->
</body>
</html>
