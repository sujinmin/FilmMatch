<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Management</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">


</head>
<body class=""> <!-- class="sb-nav-fixed" -->
    <!-- header -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/header.jsp"/>
    <!-- menu -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_menu.jsp"/>


    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">출고관리</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                <li class="breadcrumb-item active">Charts</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    Chart.js is a third party plugin that is used to generate the charts in this template. The
                    charts below have been customized - for further customization options, please visit the official
                    <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>
                    .
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
            <div class="row">
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            Bar Chart Example
                        </div>
                        <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-pie me-1"></i>
                            Pie Chart Example
                        </div>
                        <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
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