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
                            <h2 class="pageheader-title">评论管理</h2>
                        </div>
                    </div>
                </div>
                <!-- end pageheader -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
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
											<th width="25%">评论内容</th>
											<th>评论者</th>
											<th>博客id</th>
											<th>被回复id</th>
											<th>点赞数</th>
											<th>回复时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="cmt_addhere"></tbody>
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
			$("#cmt-admin a").addClass("active");
			$("#cmt-up a").addClass("active");
			
			loadpagebtn("#pagehandle")
			$("#pagehandle").find("li").addClass("btn")
			
			gettable(1,"")
			
			$("#backsearch").click(function() {
				var roleid=<%=session.getAttribute("roleid")%>
				var upid=<%=session.getAttribute("SESSION_UserID")%>
				if(roleid==1) upid=0;
				var keyword=$("#keyword").val()
				//alert(keyword)
				gettable(1,keyword)
			});
		});
		
		function writetable(data) {
			var n = data.rstmap.length
			var myhtml=""
				for (i=0; i<n; i++){
					var id =  data.rstmap[i].id
					var cmt = data.rstmap[i].comment
					var cmterid = data.rstmap[i].userid
					var cmter = data.cmtermap[i]
					var blogid = data.rstmap[i].blogid
					var cmtid = data.rstmap[i].cmtid
					var n_like = data.rstmap[i].likenum
					var strtime = data.rstmap[i].createtime;
					
					cmt=cmt.substring(0,20)
					var cdate = todate(strtime)

					myhtml += ( '<tr>' + '<th scope="row ">' + id +'</th>' 
							+ '<th>' + cmt + '</th>'
							+ '<th>' + cmter + '</th>'
							+ '<th>' + blogid + '</th>'
							+ '<th>' + cmtid + '</th>'
							+ '<th>' + n_like + '</th>'
							+ '<th>' + cdate + '</th>'
							+ '<th> <div class="inline"> '  )
					if( data.rstmap[i].delFlag==false){
						myhtml+=(
								'<button type="button" class="btn btn-sm btn-outline-success btn-res" name="' + id + '">恢复</button>'		
						)
					}else{
						myhtml+=(
								'<button type="button" class="btn btn-sm btn-outline-danger btn-del" name="' + id + '">删除</button>'
					)}
					myhtml+=( ' </div> </th></tr>' )
				}
			cmt_addhere.innerHTML=myhtml
		}
		
		function gettable(pn,kw) {
			//@RequestParam Integer pn, @RequestParam Integer upid, @RequestParam String keyword
			var roleid=<%=session.getAttribute("roleid")%>
			var upid=0
			if(roleid==3) upid=<%=session.getAttribute("SESSION_UserID")%>
			var data = {
					"pn" : pn,
					"upid" : upid,
					"keyword":kw
				};

			console.info(data)
			//alert(JSON.stringify(data))
			$.ajax({
				url: "<%=path %>/back/getcmt",
				type: 'post',
				dataType:'JSON',
				data: data,
				success:function(response,status,xhr){
					console.log(response);
					console.log(status);
					console.log(xhr);
					writetable(response);
					var cpn=response.pageinfo.pageNum
					pageload(gettable,response,cpn);
					addcpn(cpn);
					afterajax(kw);
				},
				error:function(){
					alert('error');
				}
			});
		}
		
		function afterajax(kw) {
			$("#pagehandle  a").click(function() {
				var pn=($(this).attr("name"))
				gettable(pn,kw)
			});
			
			$(".btn-del").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要删除吗？")) {
				    window.location.href="<%=path%>/back/deletecmt?id="+strid
				  } else {
				    alert("已取消");
				  }
			});
			
			$(".btn-res").click(function() {
				var strid=$(this).attr("name");
				if (confirm("确认要恢复吗？")) {
				    window.location.href="<%=path%>/back/undodelcmt?id="+strid
				  } else {
				    alert("已取消");
				  }
			});
		}
		
	</script>
</body>
</html>