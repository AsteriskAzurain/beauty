<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<%
	String path = request.getContextPath();
%>
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
<!-- Style-CSS -->
<link rel="stylesheet" href="<%=path%>/css/style.css" type="text/css" media="all" />
<!-- Font-Awesome-Icons-CSS -->
<link href="<%=path%>/css/font-awesome.min.css" rel="stylesheet">
<!-- Web-Fonts -->
<link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="<%=path%>/css/custom.css">

</head>
<body>
	<!-- main banner -->
	<div class="main-top" id="home">
		<!-- header -->
		<header>
			<div class="container-fluid">
				<div class="header d-lg-flex justify-content-between align-items-center py-3 px-sm-3">
					<!-- logo -->
					<div id="logo">
						<h1>
							<a href="<%=path%>/index"><span class="fa fa-linode mr-2"></span>reachableBeauty</a>
						</h1>
					</div>
					<!-- //logo -->
					<div class="d-flex mt-lg-1 mt-sm-2 mt-3 justify-content-center">

						<!-- 头像 -->
						<img id="headpic" src="#" class="headpic">

						<!-- search -->
						<div class="search-w3layouts mr-3">
							<form action="<%=path%>/jsp/searchresult.jsp" method="post" class="search-bottom-wthree d-flex">
								<input class="search" type="search" name="searchname"  placeholder="Search Here..." required>
								<button class="form-control btn" type="submit">
									<span class="fa fa-search"></span>
								</button>
							</form>
						</div>


						<!-- //search -->
						<!-- 登出&个人中心 -->
						<a class="dwn-w3ls btn mr-1" href="<%=path%>/center/tocenter" target="_blank">
							<span class="fa fa-user-circle-o" title="个人中心"></span>
						</a> 
						<a class="dwn-w3ls btn" href="<%=path%>/user/logout" target="_self"> 
							<span class="fa fa-sign-out" title="退出登录"></span>
						</a>
						<!-- //logout&usercenter -->
					</div>
				</div>
			</div>
		</header>
		<!-- //header -->

		<!-- navbar -->
		<div class="navbar nav-wrapper smoothie">
			<div class="container">
				<div class="row" style="width: 100%; height: 300px">
					<div class="up_center">
						<h4>
							<label id="centername" class="centername" style="color: white"></label>
						</h4>
					</div>
					<div class="col-sm-12">
						<div id="navbar-1">
							<ul class="nav navbar-nav navbar-center text-center">
								<!-- 将user_info.jsp更改为toinfo,其他几个同。通过下面Js实现接口跳转 -->
								<li>
									<a href="#" role="button" onclick="change_frame('user_follow')"> <span class="fa fa-heart-o mr-2"></span>关注</a>
								</li>
								<li>
									<a href="#" role="button" onclick="change_frame('tolove')"> <span class="fa fa-star-o mr-2"></span>收藏</a></li>
								<li>
									<!-- 将user_info.jsp更改为toinfo,通过下面Js实现接口跳转 --> 
									<a href="#" role="button" onclick="change_frame('toinfo')"> <span class="fa fa-cog mr-2"></span>个人信息</a>
								</li>
								<li>
									<a href="#" role="button" onclick="change_frame('tosetting')"> <span class="fa fa-pencil mr-2"></span>设置</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //navbar -->

	</div>
	<!-- //main banner -->

	<!-- 子页面 -->
	<iframe id="userframe" src="#"> </iframe>

	<!-- //子页面 -->

	<!-- JavaScript files-->
	<script src="<%=path%>/js/jquery/jquery.min.js"></script>
	<script src="<%=path%>/js/popper.js/umd/popper.min.js"></script>
	<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jquery.cookie/jquery.cookie.js"> </script>
	<script src="<%=path%>/js/js.cookie.min.js"></script>
	<script src="<%=path%>/js/front.js"></script>
	<script src="<%=path%>/js/custom/getcookie.js"></script>

	<script type="text/javascript">

		$(function() {
			var getpic2="${getpic2}";
			//alert(getpic);
			var concatpic = '/beauty/' + getpic2;
			$("#headpic").attr('src', concatpic);

			var cookiestr = getCookie("user");
			var cookiename = cookiestr.split("#")[0];
			cookiename=decodeURIComponent(cookiename)
			var cookieid = cookiestr.split("#")[2];
			$("#centername").text(cookiename + "的个人空间");
			var url = "<%=path%>/center/user_follow?followerid="	+ cookieid;
			$("#userframe").attr("src", url);

			var id = parseInt(cookieid);
			$.ajax({
				url : "<%=path%>/center/getpic2?id="+ id,
				type : "GET",
				success : function() {
					console.info("user info succeed")
				}
			});

		});
		
		function change_frame(value) {
			var url = "<%=path%>/center/" + value;
			//beauty/center/selectInfo?id=xxx
			//从cookie中取出cookieid
			var cookiestr = getCookie("user");
			if (cookiestr != "")
				var cookieid = cookiestr.split("#")[2];
			if (value == 'user_follow')
				var url = "<%=path%>/center/" + value + "?followerid=" + cookieid;
			else {
				var url = "<%=path%>/center/" + value;
			}

			var frame = document.getElementById("userframe");
			frame.src = url;
			frame.style.height = frame.contentWindow.document.documentElement.scrollHeight + 'px'
		}


	</script>
</body>
</html>