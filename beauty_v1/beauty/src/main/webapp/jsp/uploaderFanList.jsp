<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${uplist[0].username} 的 主页</title>
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
<link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<%=path%>/css/users/follow.css">
<link rel="stylesheet" href="<%=path%>/css/custom.css">
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
				<div class="header d-lg-flex justify-content-between align-items-center py-3 px-sm-3">
					<!-- logo -->
					<div id="logo">
						<h1>
							<a href="${pageContext.request.contextPath}/index"><span class="fa fa-linode mr-2"></span>reachableBeauty</a>
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
						<a class="dwn-w3ls btn mr-1" href="${pageContext.request.contextPath}/center/tocenter" target="_blank"> 
							<span class="fa fa-user-circle-o" title="个人中心"></span>
						</a>
						 <a class="dwn-w3ls btn" href="${pageContext.request.contextPath}/user/logout" target="_self"> 
							<span class="fa fa-sign-out" title="退出登录"></span>
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
							<img alt="" src="<%=path%>/<c:out value="${ulist.profileimg}" />" style="max-width: 100px;" class="img-thumbnail">
						</div>
						<div class="col-lg-8  ">
							<h2 class="mb-4">
								<c:out value="${ulist.username}"></c:out>
							</h2>
							<h4>欢迎来到我的空间</h4>
						</div>
						<div class="col-lg-2 mt-4" style="height: 40px; text-align: center;">
							<!-- <a href="#" class="btn button-style">关注 Follow</a> -->
							<div class="mt-3">
								<h3><a href="#">粉丝数：${fan}</a></h3>
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
						<a href="#">粉丝列表<i class="fa fa-clock-o ml-2"></i></a>
					</h4>
				</div>
			</div>
		</div>
	</section>
	<!-- //order nav -->
	<!-- 粉丝列表 -->
	<section class="white-wrapper allow-overflow">
		<div id="fandiv">
			<ul class="relation-list">
				<c:forEach items="${fanlist}" var="list" varStatus="aa">
					<li class="list-item row">
						<a href="${pageContext.request.contextPath}/center/uploader?uploaderid=<c:out value="${list.id}"/>" target="_blank" class="cover"> 
							<img src="<%=path%>/<c:out value="${list.profileimg}" />" alt="">
						</a>
						<div class="content" id="content">
							<a href="#" target="_blank" class="title"> 
								<span><c:out value="${list.username}" /></span>
							</a>	
							<p title="<c:out value="${list.introduction}" />" class="desc">
								<c:out value="${list.introduction}" />
							</p>
							<div class="fans-action">							
									<button type="button" class="btn btn-default" name="subscribe" id="subscribe${list.id}" value="${list.id}">${arr2[aa.index]}</button>			
									<form id="hhhh">
										<input type="hidden" name="hide" id="hide${aa.index}" value="${list.id}">
										<input type="hidden" name="message" id="message" value="${info}">
										<input type="hidden" name="text1" id="text1" value="${list1[0]}">
									</form>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>


	<!--  CONTENT WRAPPER -->

	<!-- CONTENT WRAPPER -->

	<!-- copyright bottom -->
	<div class="copy-bottom bg-li py-4 border-top">
		<div class="container-fluid">
			<div class="d-md-flex px-md-3 position-relative text-center">
				<!-- copyright -->
				<div class="copy_right mx-md-auto mb-md-0 mb-3">
					<p class="text-bl let">Copyright &copy; 2020. reachableBeauty All rights reserved.</p>
				</div>
				<!-- //copyright -->
				<!-- move top icon -->
				<a href="#home" class="move-top text-center"> 
					<span class="fa fa-level-up" aria-hidden="true"></span>
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
	<script src="<%=path%>/js/custom/getcookie.js"></script>

	<script type="text/javascript">
		$(function() {
			var getpic="${getpic}";
			//alert(getpic);
			var concatpic='/beauty/'+getpic;
			$("#headpic").attr('src',concatpic);
			
			var cookiestr = getCookie("user");
			var cookieid = cookiestr.split("#")[2];

			var id=parseInt(cookieid);
			$.ajax({
				url:"${pageContext.request.contextPath}/center/getpic?id="+id,
				type:"GET",
				success:function(){}
			});
			console.log('${fan}');
			console.log('${fanlist}');
			console.log('${uplist}');
			console.log("text1="+'${list1}');			
			
			var str = getCookie("user");
			var followerid = parseInt(str.split("#")[2]);
			var fanlist='${fanlist}';
			var count='${fan}';
			var uploaderid=parseInt($("#hide").val());
				var arr=[];
				//alert('${fanlist[0].id}');
				
			$('[name=hide]').each(function(i){				
				arr.push(parseInt($("#hide"+i.toString()).val()));
			});
			//[object Array]: [52, 42, 41, 40, 39, 32, 35, 43]
			console.log(arr);
			var data={
					"arr":arr,
					"followerid":followerid	
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/center/subscribelist",
				type : "POST",
				data:   data,
				traditional:true,
				success : function(data) {}
			});
		});

		//未关注->关注,followerid取当前行用户的id
		$('[name=subscribe]').click(function(){
			var uploaderid=$(this).val();
			//alert(uploaderid);
			var str = getCookie("user");
			var followerid = str.split("#")[2];
			if($(this).text()=='未关注'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/center/subinsert1?uploaderid=" + uploaderid + "&followerid=" + followerid,
				type:"POST",
				success:function(){
					//var aaa=$(this).parent().children("form").children("input").eq(1).val();
					//alert(aaa);
					alert("成功添加关注");
						$("#subscribe"+uploaderid.toString()).text("已关注");
					}						
				});
			}
			//先进行插入，能插入的都插完就只剩取消关注到了
			else{
				var uploaderid=$(this).val();
				//alert(uploaderid);
				var str = getCookie("user");
				var followerid = str.split("#")[2];
				$.ajax({
					url:"${pageContext.request.contextPath}/center/subdelete1?uploaderid=" + uploaderid + "&followerid=" + followerid,
					type:"POST",
					success:function(){
						alert("成功取消关注");
						$("#subscribe"+uploaderid.toString()).text("未关注");
					}										
				});
			}			
		});

	</script>






</body>
</html>