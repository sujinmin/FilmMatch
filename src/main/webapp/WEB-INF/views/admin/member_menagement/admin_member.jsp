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

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- ajax라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<script>
    function Modify(memIdx) {
        //mem_idx 확인
        console.log(memIdx);
        //console.log(vo.mem_modifydate);
        
        // AJAX 요청
        $.ajax({
            url: 'admin_modify.do?mem_idx=' + memIdx, // 요청할 URL
            type: 'GET', // HTTP 요청 방식 (GET, POST 등)
            data: { mem_idx: memIdx }, // 요청에 포함할 데이터
            dataType: 'html', // 응답 데이터 타입 (html, json 등)
            success: function(response) {
                // AJAX 요청 성공 시 처리
                $('#modifyFormContainer').html(response); // 요청한 화면을 modifyFormContainer에 표시
            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 처리
                console.error('AJAX request failed:', status, error);
            }
        });
    }
    // VIEW 조회화면
    function view(memIdx) {
        // AJAX 요청
        $.ajax({
            url: 'view.do?mem_idx=' + memIdx, // 요청할 URL
            type: 'GET', // HTTP 요청 방식 (GET, POST 등)
            data: { mem_idx: memIdx }, // 요청에 포함할 데이터
            dataType: 'html', // 응답 데이터 타입 (html, json 등)
            success: function(response) {
                // AJAX 요청 성공 시 처리
                $('#viewContainer').html(response); // 요청한 화면을 viewContainer에 표시
            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 처리
                console.error('AJAX request failed:', status, error);
            }
        });
    }
    function addr(){

        
    }

    function del(mem_idx) { //삭제처리
            
            //삭제확인
            if (confirm("정말 삭제하시겠습니까?")==false)return;
                
            //삭제처리
            location.href = "delete.do?mem_idx=" + mem_idx;
            
        }
</script>

</head>
<body class=""> <!-- class="sb-nav-fixed" -->
    <!-- header -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/header.jsp"/>
    <!-- menu -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_menu.jsp"/>


    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">회원관리</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                <li class="breadcrumb-item active">Charts</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    회원정보를 수정, 삭제, 관리 할 수 있는 페이지 입니다.
                    <!-- <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a> -->
                   
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    Area Chart Example
                </div>
                <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>

            <!-- 회원관리 테이블 -->
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    회원관리 테이블
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>

                            <tr>
                                <!-- 서치 바 -->
                            </tr>
                            <tr>
                                <th>회원번호</th>
                                <th>회원명</th>
                                <th>아이디</th>
                                <th>아이피</th>
                                <th>가입(갱신)일자</th>
                                <th>회원등급</th>
                                <th>편집</th>
                             </tr>

                        </thead>
                        <tbody>
                                <!-- Data출력 -->
                                <!-- for(MemberVo vo : list)   -->
                                <c:forEach var="vo"  items="${ list }">
                                    <tr>
                                        <!-- getter호출 -->
                                    <td style="text-align: center;">${ vo.mem_idx }</td>
                                    <td>${ vo['mem_name'] }</td>
                                    <td><span id="mem_id">${ vo.mem_id }</span></td>
                                    <td>${ vo.mem_ip }</td>
                                    <td>${ fn:substring(vo.mem_regdate,0,10) }<br>(${ fn:substring(vo.mem_modifydate,0,10) })</td>
                                    <td>${ vo.mem_grade }</td>
                                    
                                    <td>
                                        <input class="btn btn-success" type="button"  value="수정"
                                                    onclick="Modify('${vo.mem_idx}');">
                                                    <!-- onclick="location.href='admin_modify.do?mem_idx=${ vo.mem_idx }'" -->
                                        <input class="btn btn-info" type="button"  value="보기"
                                                onclick="view('${vo.mem_idx}');" >
                                        <input class="btn btn-primary" type="button"  value="주소보기"
                                                onclick="addr('${vo.mem_idx}');" >
                                                <input class="btn btn-danger"  type="button"  value="삭제" onclick="del('${vo.mem_idx}');">
                                    </td>
                                    </tr>
                                </c:forEach>
                                
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 회원주소목록 -->
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                   회원별 주소목록
                </div>
                <div class="card-body">
                    <!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->



                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>


            <div class="row">
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            회원정보 수정
                        </div>
                        <div class="card-body">
                                <!-- <canvas id="myBarChart" width="100%" height="50"></canvas> -->
                                <!-- 회원정보수정 화면 -->
                                <div id="modifyFormContainer"></div>
                        </div>
                        <!-- <input type="hidden" name="mem_modifydate" value="${vo.mem_modifydate}"> -->
                        <div class="card-footer small text-muted">Updated </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-pie me-1"></i>
                            회원정보조회 화면
                        </div>
                        <div class="card-body">
                            <!-- <canvas id="myPieChart" width="100%" height="50"></canvas> -->
                             <!-- 회원정보조회 화면 -->
                             <div id="viewContainer"></div>
                        
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
            </div>
        </div>
    </main>


    

    <!-- footer -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${ pageContext.request.contextPath }/js/admin/scripts.js"></script>
    <!-- <script src="${ pageContext.request.contextPath }/js/admin/demo/chart-pie-demo.js"></script> -->
    



</body>
</html>