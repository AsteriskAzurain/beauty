<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xx 的 主页</title>
<%
	String path = request.getContextPath();
%>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Meta tag Keywords -->

<!-- Custom-Files -->
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="<%=path%>/css/style.css" type="text/css"
	media="all" />
<!-- Style-CSS -->
<link href="<%=path%>/css/font-awesome.min.css" rel="stylesheet">
<!-- Font-Awesome-Icons-CSS -->

<link href="<%=path%>/css/ups/animate.css" rel="stylesheet">
<link href="<%=path%>/css/ups/newstyle.css" rel="stylesheet">

<!-- Web-Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,300italic,400italic'
	rel='stylesheet' type='text/css'>
<!-- //Web-Fonts -->

<script src="<%=path%>/js/ups/jquery.min.js"></script>
<script src="<%=path%>/js/ups/modernizr.custom.js"></script>


</head>
<body>

	<!-- main banner -->
	<div class="main-top" id="home">
		<!-- header -->
		<header>
			<div class="container-fluid">
				<div
					class="header d-lg-flex justify-content-between align-items-center py-3 px-sm-3">
					<!-- logo -->
					<div id="logo">
						<h1>
							<a href="index.jsp"><span class="fa fa-linode mr-2"></span>reachableBeauty</a>
						</h1>
					</div>
					<!-- //logo -->
					<div class="d-flex mt-lg-1 mt-sm-2 mt-3 justify-content-center">
						<!-- search -->
						<div class="search-w3layouts mr-3">
							<form action="#" method="post"
								class="search-bottom-wthree d-flex">
								<input class="search" type="search" placeholder="Search Here..."
									required>
								<button class="form-control btn" type="submit">
									<span class="fa fa-search"></span>
								</button>
							</form>
						</div>
						<!-- //search -->
						<!-- 登出&个人中心 -->
						<a class="dwn-w3ls btn mr-1" href="usercenter.jsp" target="_blank">
							<span class="fa fa-user-circle-o" title="个人中心"></span>
						</a> <a class="dwn-w3ls btn" href="login.jsp" target="_self"> <span
							class="fa fa-sign-out" title="退出登录"></span>
						</a>
						<!-- //logout&usercenter -->
					</div>
				</div>
			</div>
		</header>
		<!-- //header -->
	</div>
	<!-- //main banner -->

	<!-- head -->
	<div class="py-5 banner_w3lspvt-2">
		<div class="container pb-xl-5 pb-lg-3">
			<div class="py-xl-4 ">
				<c:forEach items="${uplist}" var="ulist" begin="0" end="0">
					<div class="col-lg-12 mt-5 row">
						<div class="col-lg-2">
							<img alt="" src="<%=path%>/<c:out value="${ulist.profileimg}" />"
								style="max-width: 100px;">
						</div>
						<div class="col-lg-8  ">
							<h2 class="mb-4">
								<c:out value="${ulist.username}"></c:out>
							</h2>
							<h4>欢迎来到我的空间</h4>
						</div>
						<div class="col-lg-2 mt-4"
							style="height: 40px; text-align: center;">
							<!-- 传入followerid和uploaderid -->
							<%-- <c:if test="${empty sub}">
								<a
									href="#"
									class="btn button-style" id="subscribe1">未关注</a>
							</c:if> --%>

							<a href="#" class="btn button-style" id="subscribe"></a>

							<div class="mt-3">
								<a
									href="${pageContext.request.contextPath}/center/upfanlist?id=${ulist.id}"
									id="fancount">粉丝数：${fan}</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- //head -->

	<!-- order nav -->
	<section class="why bg-li py-4" id="why">
		<div class="container">
			<div class="row c-acolor">
				<span class="col-md-1 fa fa-sort-amount-desc fa-2x mr-2"></span>
				<div class="col-md-2">
					<h4>
						<a href="#">时间<i class="fa fa-clock-o ml-2"></i></a>
					</h4>
				</div>
				<div class="col-md-2">
					<h4>
						<a href="#">热度<i class="fa fa-thermometer-full ml-2"></i></a>
					</h4>
				</div>

			</div>
		</div>
	</section>
	<!-- //order nav -->

	<!--  CONTENT WRAPPER -->
	<div id="content-wrapper" class="c-newfont">
		<section id="about" class="page-section">
			<div class="row white">
				<div class="col-sm-9">
					<div class="row">
						<div class="col-md-12 blog-bg">
							<div
								class="col-md-2 col-sm-2 col-xs-2 blog-meta fade-down float-left">
								<h3>Most</h3>
								<h3>Popular</h3>
								<div class="blog-counts">
									<h5>
										<i class="fa fa-comment"></i><span class="counter">14</span>
									</h5>
									<h5>
										<i class="fa fa-heart"></i><span class="counter">56</span>
									</h5>
								</div>
							</div>
							<div class="grid mask">
								<figure>
									<img class="img fade-down" src="<%=path%>/images/bg2.jpg">
									<figcaption>
										<a class="btn btn-primary btn-lg" href="#"><i
											class="fa fa-link"></i></a>
									</figcaption>
								</figure>
							</div>
							<div
								class="col-md-10 col-md-offset-2 col-sm-10 col-xs-10 col-xs-offset-2 blog-content fade-up">
								<p>Armed with insight, we embark on designing the right
									brand experience that engages the audience. It encompasses both
									the strategic direction and creative execution that solves a
									business problem and brings the brand to life.</p>
							</div>
						</div>
						<!-- /col -->
					</div>
					<!-- /row -->
				</div>


				<div class="col-sm-3 col-sm-offset-1 single-post-sidebar">
					<h3 class="sidebar-title mt0 mb-5">最近更新</h3>

					<div class="row sidebar-post">
						<div class="col-md-4">
							<img class="sb-img" src="<%=path%>/images/folio01.jpg" alt="Alt">
						</div>
						<div class="col-md-8 sidebar-post-content">
							<h4>Blog Post A</h4>
							<div class="blog-meta-main">
								<span class="post-meta-link"><i class="fa fa-clock-o"></i>
									更新于 2分钟前</span>
							</div>
						</div>
					</div>


				</div>
				<!-- col-md-6 -->
			</div>
		</section>

	</div>
	<!-- CONTENT WRAPPER -->

	<!-- copyright bottom -->
	<div class="copy-bottom bg-li py-4 border-top">
		<div class="container-fluid">
			<div class="d-md-flex px-md-3 position-relative text-center">
				<!-- copyright -->
				<div class="copy_right mx-md-auto mb-md-0 mb-3">
					<p class="text-bl let">Copyright &copy; 2020. reachableBeauty
						All rights reserved.</p>
				</div>
				<!-- //copyright -->
				<!-- move top icon -->
				<a href="#home" class="move-top text-center"> <span
					class="fa fa-level-up" aria-hidden="true"></span>
				</a>
				<!-- //move top icon -->
			</div>
		</div>
	</div>
	<!-- //copyright -->

	<!-- JavaScript files-->

	<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/js/ups/plugins.js"></script>
	<script src="<%=path%>/js/ups/init.js"></script>

	<script type="text/javascript">
		$(function() {
			var b=2;
			console.log("b="+typeof(b.toString()));
			console.log('${fan}');
			console.log('${fanlist}');
			console.log('${uplist}');
			console
			var getid = '${uplist.get(0).id}';
			console.log(getid);
			var sublist = '${sub}';
			console.log("text=" + '${text}');
			var uploaderid = '${uplist.get(0).id}';

			var str = getCookie("user");
			//followerid
			//从后端获取判断信息
			var followerid = str.split("#")[2];
			$
					.ajax({
						url : "${pageContext.request.contextPath}/center/subscribe?uploaderid="
								+ uploaderid
								+ "&followerid="
								+ followerid,
						type : "GET",
						success : function() {

							$("#subscribe").text('${text}');
						}
					});
			
			
			

		});
		

		//subscribe是关注/未关注的btn
		$("#subscribe")
				.click(
						function() {
							//返回的select列表
							//后端返回关注/没关注的字符串
							var text = $("#subscribe").text();

							var uploaderid = '${uplist.get(0).id}';

							var str = getCookie("user");
							//followerid
							//从后端获取判断信息
							var followerid = str.split("#")[2];
							//逻辑:if第一次把关注->取消关注，而‘${sub}’的值未变，第二次关注就会错误，所以不能用sub来判断，要用text值判断

							//关注->取消关注
							if (text == "已关注") {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/center/subdelete?uploaderid="
													+ uploaderid
													+ "&followerid="
													+ followerid,
											type : "GET",
											success : function() {
												alert("取消关注成功");
												alert("请手动刷新页面以保证粉丝数正常显示");
												$("#subscribe").text("未关注");
												window.location.reload();
											}
										});

							}
							//未关注->加关注
							else {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/center/subinsert?uploaderid="
													+ uploaderid
													+ "&followerid="
													+ followerid,
											type : "GET",
											success : function() {
												alert("关注成功");
												alert("请手动刷新页面以保证粉丝数正常显示");
												$("#subscribe").text("已关注");
												window.location.reload();
											}
										});

							}

						});

		function getCookie(cookiename) {

			var name = cookiename + "=";
			var str = document.cookie.split(';');
			var le = str.length;
			for (var i = 0; i < str.length; i++) {
				var ind = str[i];
				while (ind.charAt(0) == ' ')
					ind = ind.substring(1);

				var saf = ind.length;
				if (ind.indexOf(name) != -1)
					return ind.substring(name.length, ind.length);

			}
			return "";

		}
	</script>






</body>
</html>