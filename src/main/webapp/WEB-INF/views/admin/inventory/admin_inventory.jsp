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
<!-- 재고관리 css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/goods_inventory.css">

<script>
     window.onload=function(){
      
      setTimeout(showMessage,200);
           
   };
   //interver
    function showMessage() {
        
        if("${ param.error eq 'remain_not' }"=='true')
        {
            alert('재고목록에 출고할\n상품이 없습니다');
        }
        
        if("${ param.error eq 'remain_lack' }"=='true')
        {
            alert('출고할 상품수량이 부족합니다');
        }
    }
</script>

</head>
<body class=""> <!-- class="sb-nav-fixed" -->
    <!-- header -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
    <!-- menu -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_menu.jsp"/>


    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">입고_재고_출고 관리</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                <li class="breadcrumb-item active">Charts</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    굿즈상품을 입고, 재고, 출고 관리를 할 수 있는 페이지 입니다.
                    <!-- <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a> -->
                   
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    Area Chart Example
                </div>
                <div class="card-body">
                    <!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->
                    <!-- 재고관리 -->
                    <div id="main_box">
                        <h1 style="text-align:center;">상품재고관리 시스템</h1>
                        <hr id="gap">
                        <div id="sub_box">
                            <div class="job_box" >
                                <%@include file="inventory_in.jsp" %>
                            </div>
                            <div class="job_box">
                                <%@include file="inventory_remain.jsp" %>
                            </div>
                            <div class="job_box">
                                <%@include file="inventory_out.jsp" %>
                            </div> 
                            
                            <!-- 입고/출고작업 -->
                            <div class="input_box">
                               <%@include file="inventory_in_form.jsp" %>
                            </div>
                            
                            <div class="input_box" style="border:none;"></div>
                            
                            <div class="input_box">
                               <%@include file="inventory_out_form.jsp" %>
                            </div>
                            
                        </div>
                      </div>





                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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