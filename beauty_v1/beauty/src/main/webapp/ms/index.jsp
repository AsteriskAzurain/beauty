<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<div class="ml-5 mt-3">
									<h3>欢迎登录</h3>
									<h1>美，一眼望穿</h1>
									<div class="d-xl-inline-block mb-5">
									<span><font size="5">reachableBeauty</font></span>
									<span class="ml-3"><font size="5">后台管理系统</font></span>
									</div>									
								</div>
								
								<div class="card influencer-profile-data">
		                            <div class="card-body">
		                                <div class="row">
		                                    <div class="col-xl-2 col-lg-4 col-md-4 col-sm-4 col-12">
		                                        <div class="text-center">
		                                            <img src="<%=path %>/${loginuser.profileimg }" alt="User Avatar" class="rounded-circle user-avatar-xxl">
		                                            </div>
		                                        </div>
		                                        <div class="col-xl-10 col-lg-8 col-md-8 col-sm-8 col-12">
		                                            <div class="user-avatar-info">
		                                                <div class="m-b-20">
		                                                    <div class="user-avatar-name">
		                                                        <h2 class="mb-1">${loginuser.username }</h2>
		                                                    </div>		                                                    
		                                                </div>
		                                                <div class="user-avatar-address">
		                                                    <p class="pb-3">
		                                                    	${loginuser.introduction }
		                                                    	<c:if test="${empty  loginuser.introduction}">暂无个性签名</c:if>
		                                                    </p>		                                                    
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
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
			
			var cookiestr = getCookie("user");
			var cookieid = cookiestr.split("#")[2];
			var id = parseInt(cookieid);
			var cookiename = cookiestr.split("#")[0];
			cookiename=decodeURIComponent(cookiename)
			
			$("#sidebar").find("a").removeClass("active");

			// get user info
			/* $.ajax({
				url: 'comment/normal/add',
				type: 'get',
				dataType:'JSON',
				data:{"userid": id }  ,
				success:function(response,status,xhr){
					console.log(response)
					console.log(status)
					console.log(xhr)
				},
				error:function(){
					alert("error");
				}
			}); */
		});
	</script>
</body>
</html>