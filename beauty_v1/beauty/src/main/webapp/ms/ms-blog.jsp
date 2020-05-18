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
                            <h2 class="pageheader-title">博客管理</h2>
                        </div>
                    </div>
                </div>
                <!-- end pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12  table-responsive">
						<!-- 正文开始 -->
						<form class="form-inline">
							<div class="input-group mb-2" style="width: 35%;">
								<input id="keyword" type="text" name="searchname" placeholder="请输入搜索内容" aria-describedby="button-addon2" class="form-control">
								<input type="hidden" name="back" value="back">
								<div class="input-group-append">
									<button id="backsearch" type="button" class="btn btn-primary">搜索</button>
								</div>
							</div>
						</form>
						
						<div class="card">						
							<div class="card-body table-responsive">
							<h4 id="getsearch"></h4>
								<table id="usertab" class="table table-striped table-bordered first text-center">
									<thead>
										<tr>
											<th>id</th>
											<th width="25%">标题</th>
											<th>类别</th>
											<th>创建时间</th>
											<th>收藏数</th>
											<th>评论数</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="blog_addhere"></tbody>
								</table>
								
								<div class="text-center" id="handlecontainer">
									<div id="pagehandle"></div>
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
	<script type="text/javascript" src="<%=path%>/js/ms/loadpageplugin.js"></script>
	<script type="text/javascript" src="<%=path%>/js/ms/blogadmin.js"></script>

	<script type="text/javascript">
	
		$(window).on('load', function(){
			
			$("#sidebar").find("a").removeClass("active");
			$("#blog-admin a").addClass("active");
			$("#blog-up a").addClass("active");

			loadpagebtn("#pagehandle")
			//$("#pagehandle").find("li").addClass("btn")
			gettable(1)
			
			$("#backsearch").click(function() {
				var roleid=<%=session.getAttribute("roleid")%>
				var upid=<%=session.getAttribute("SESSION_UserID")%>
				if(roleid==1) upid=0;
				var keyword=$("#keyword").val()
				//alert(keyword)
				$.ajax({
					url: '<%=path %>/back/search',
					type: 'get',
					dataType:'JSON',
					data:{"keyword": encodeURI(keyword), "upid": upid }  ,
					success:function(response,status,xhr){
						console.log(response)
						console.log(status)
						console.log(xhr)
						if(response.rstmap!=null){
							writetable(response);
							$("#getsearch").text("搜索结果为：")
							$("#handlecontainer").empty();
							afterajax();
						}else{
							blog_addhere.innerHTML="<div><h3>暂无结果</h3></div>"	
						}
					},
					error:function(){
						alert("error");
					}
				});
			});
			
			var msg="<%=request.getAttribute("msg")%>"
			if(msg!=null && msg!='null' && msg!='') alert(msg)
			
		});
				
		function gettable(pn) {
			var roleid=<%=session.getAttribute("roleid")%>
			var upid=<%=session.getAttribute("SESSION_UserID")%>
			if (roleid==3){
				//alert(roleid)
				var target = "<%=path %>/back/getbyid";
				var data = {
						"pn" : pn,
						"upid" : upid
					};
			}else{
				var target = "<%=path %>/back/getall";
				var data = {
						"pn" : pn
					};
			}
			console.info(data)
			//alert(JSON.stringify(data))
			$.ajax({
				url: target,
				type: 'get',
				dataType:'JSON',
				data: data,
				contentType : 'application/json',
				success:function(response,status,xhr){
					console.log(response);
					console.log(status);
					console.log(xhr);
					writetable(response);
					var cpn=response.pageinfo.pageNum
					pageload(gettable,response,cpn);
					addcpn(cpn);
					afterajax(target);
				},
				error:function(){
					alert('error');
				}
			});
		}
		
		function afterajax(target) {
			$("#pagehandle  a").click(function() {
				//alert("hello")
				// #numpage > li:nth-child(2) > a
				//alert($(this).attr("name"))
				var pn=($(this).attr("name"))
				gettable(pn)
			});
			
			$(".btn-upd").click(function() {
				var strid=$(this).attr("name");
				window.location.href="<%=path%>/back/editblog?blogid="+strid
			});
			
			$(".btn-del").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要删除吗？")) {
				    window.location.href="<%=path%>/back/editblog?blogid="+strid
				  } else {
				    alert("已取消");
				  }
			});
			
			$(".btn-res").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要恢复吗？")) {
				    window.location.href="<%=path%>/back/undodelblog?blogid="+strid
				  } else {
				    alert("已取消");
				  }
			});
			
		}
	</script>

	
</body>
</html>