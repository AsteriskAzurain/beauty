<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>美 一眼望穿 后台管理系统</title>
<% String path = request.getContextPath();%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" >
    <link href="<%=path %>/css/ms/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/css/ms/style.css">
    <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css">
</head>
<body>

    <!-- main wrapper -->
    <div class="dashboard-main-wrapper">

        <!-- left sidebar -->
		<script type="text/javascript">
			var roleid = ${roleid}
		</script>
		<script type="text/javascript" src="<%=path %>/js/ms/sidebar.js"></script>
        <!-- end left sidebar -->
        
        <!-- wrapper  -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
			<!-- pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">主页</h2>
                        </div>
                    </div>
                </div>
                <!-- end pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<!-- 正文开始 -->
						<div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="card" id="d-heading">
                                        <div class="card-body">
                                            <h1>欢迎登录</h1>
                                    		<h1 class="display-4">美，一眼望穿</h1>
                                        	<h2>后台管理系统</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                  </div>
                </div>
            </div>
            <!-- footer -->
            <div class="footer text-center ">
                Copyright &copy; 2020. reachableBeauty All rights reserved.
            </div>
            <!-- end footer -->
        </div>
        <!-- end  wrapper -->
    </div>

    <!-- end main wrapper -->

    <!-- Optional JavaScript -->

    <script src="<%=path%>/js/jquery/jquery.min.js"></script>
	<script src="<%=path%>/js/popper.js/umd/popper.min.js"></script>
	<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jquery.cookie/jquery.cookie.js"> </script>
	<script src="<%=path%>/js/js.cookie.min.js"></script>
	<script src="<%=path%>/js/front.js"></script>
	<script src="<%=path%>/js/custom/getcookie.js"></script>
	
	<script type="text/javascript">
		$(window).on('load', function(){
			
			$("#sidebar").find("a").removeClass("active");
			$("#user-admin a").addClass("active");

		});
	</script>
</body>
</html>