<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>美 一眼望穿 后台管理系统</title>
<% String path = request.getContextPath();%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" >
   <!--  <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css"> -->
    <link href="<%=path %>/css/ms/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/css/ms/style.css">
    <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="../css/ms/fontawesome-all.css"> -->


</head>
<body>

    <!-- main wrapper -->
    <div class="dashboard-main-wrapper">

        <!-- left sidebar -->
       <script type="text/javascript">
			//var roleid = ${roleid}
			var roleid=<%=session.getAttribute("roleid")%>
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
                            <h2 class="pageheader-title">用户管理</h2>
                        </div>
                    </div>
                </div>
                <!-- end pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

						<iframe id="userframe"  src="<%=path%>/user/selectLike?username=" height="500px"  width="100%" frameborder="0"></iframe>
					
                    </div>
                </div>
            </div>

            <!-- footer -->
            <div class="footer text-center ">
                Copyright &copy; 2020. reachableBeauty All rights reserved.
            </div>
            <!-- end footer -->
        </div>
        <!-- end main wrapper -->
    </div>
    <!-- end main wrapper -->

    <!-- Optional JavaScript -->
    <!-- <script src=" ../assets/vendor/jquery/jquery-3.3.1.min.js "></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js "></script>
    <script src="../assets/vendor/slimscroll/jquery.slimscroll.js "></script> 
    <script src="<%=path%>/js/ms/main-js.js "></script> -->
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

			var thisheight = $("#userframe").contents().find("body").height() + 10;
			$("#userframe").height(thisheight < 500 ? 500 : thisheight);

		});
	</script>
</body>
</html>