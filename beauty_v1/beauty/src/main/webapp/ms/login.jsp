<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录 后台管理系统</title>

<% String path = request.getContextPath();%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" >
    <link href="<%=path %>/css/ms/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/css/ms/style.css">
    <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css">
	    <style>
		    html,
		    body {
		        height: 100%;
		    }
		
		    body {
		        display: -ms-flexbox;
		        display: flex;
		        -ms-flex-align: center;
		        align-items: center;
		        padding-top: 40px;
		        padding-bottom: 40px;
		    }
    </style>

</head>
<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center">
           		 <a class='navbar-brand' href='#' style='color:black;'>reachableBeauty</a>
				<span class="splash-description">欢迎登录后台管理系统</span>
			</div>
            <div class="card-body">
                <form action="<%=path %>/back/login" method="post">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="username" type="text" placeholder="请输入用户名" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password"  type="password" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" name="reb"><span class="custom-control-label">记住密码</span>
                        </label>
                    </div>
                    <h5>${msg }</h5>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
                    
                </form>
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="<%=path%>/js/jquery/jquery.min.js"></script>
    <script src="<%=path%>/js/bootstrap/bootstrap.bundle.js"></script>
	<script src="<%=path%>/js/custom/getcookie.js"></script>
</body>
</html>