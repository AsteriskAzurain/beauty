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
<!-- --------------------------------------新增模态框-------------------------------------- -->
<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="saveList" action="<%=path%>/back/addrole" method="post" >
					<div class="form-group">
						<label class="col-sm-5 control-label">角色名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="rolename" name="rolename" placeholder="请输入角色名称" required="required">
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-outline-primary" id="btn-add" form="saveList">创建角色</button>
				<button type="button" class="btn btn-outline-dark" data-dismiss="modal">关闭</button>
			</div>
		</div>

	</div>
</div>
<!----------------------------------------新增模态框结束位置-------------------------------------- -->
<!-- --------------------------------------回收站模态框-------------------------------------- -->
<div class="modal fade" id="restoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body restoremodel">
				<table id="usertab" class="table table-striped table-bordered first text-center">
					<thead>
						<tr>
							<th>id</th>
							<th width="50%">类别名称</th>	
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="blog_addhere">
						<c:forEach items="${reslist}" var="role">
							<tr>
								<th>${role.id }</th>
								<th>${role.rolename }</th>	
								<th> 
									<div class="inline"> 
										<button type="button" class="btn btn-sm btn-outline-success btn-res" name="${role.id }">恢复</button> 
									</div> 
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-outline-dark" data-dismiss="modal">关闭</button>
			</div>
		</div>

	</div>
</div>
<!-- --------------------------------------回收站模态框结束位置-------------------------------------- -->

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
                            <h2 class="pageheader-title">角色管理</h2>
                        </div>
                    </div>
                </div>
                <!-- end pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<!-- 正文开始 -->
						<div class="card">
							<div class="card-header p-4">
								<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#saveModal">添加角色</button>
								<button type="button" class="btn btn-outline-dark ml-3" data-toggle="modal" data-target="#restoreModal">恢复角色</button>
							</div>
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
										<c:forEach items="${rstlist}" var="role">
											<tr>
												<th>${role.id }</th>
												<th>${role.rolename }</th>	
												<th> 
													<div class="inline"> 
														<button type="button" class="btn btn-sm btn-outline-danger btn-del" name="${role.id }">删除</button> 
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
				    window.location.href="<%=path%>/back/deleterole?roleid="+strid
				  } else {
				    alert("已取消");
				  }
			});

			$(".btn-res").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要恢复吗？")) {
				    window.location.href="<%=path%>/back/undodelrole?roleid="+strid
				  } else {
				    alert("已取消");
				  }
			});
		});
		
		var msg="<%=request.getAttribute("msg")%>"
		if(msg!=null && msg!='null' && msg!='') alert(msg)
		
	</script>
</body>
</html>