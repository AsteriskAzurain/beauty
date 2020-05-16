<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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

                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<!-- 正文开始 -->
						<div class="card">						
							<div class="card-body table-responsive">
							<h4 id="getsearch"></h4>
								<table id="usertab" class="table table-striped table-bordered first text-center">
									<thead>
										<tr>
											<th>id</th>
											<th width="50%">角色名称</th>	
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="blog_addhere">
										<c:forEach items="${rstlist}" var="type">
											<tr>
												<th>${type.id }</th>
												<th>${type.rolename }</th>	
												<th> 
													<div class="inline"> 
														<button type="button" class="btn btn-sm btn-outline-dark btn-upd mr-3" name="${type.id }">编辑</button>
														<button type="button" class="btn btn-sm btn-outline-danger btn-del" name="${type.id }">删除</button> 
													</div> 
												</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
        <!-- end main wrapper -->
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
			$("#role-admin a").addClass("active");

			$(".btn-upd").click(function() {
				var strid=$(this).attr("name");
				alert(strid)
			});
			
			$(".btn-del").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要删除吗？")) {
				    alert("已删除");
				    location.reload();
				  } else {
				    alert("已取消");
				  }
			});
		});
	</script>
</body>
</html>