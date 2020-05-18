<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎</title>
<% String path = request.getContextPath();%>

</head>

<body>
<h2>Hello World!</h2>
<h2>欢迎您，老师</h2>
<h2>项目前台：<a href="<%=path %>/user/tologin">beauty/user/tologin</a></h2>
<h2>项目后台：<a href="<%=path%>/back/login">beauty/back/login</a></h2>
</body>
</html>