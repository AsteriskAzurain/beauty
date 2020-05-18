<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String path = request.getContextPath();%>
</head>

<body>
	<h1>summernote</h1>
	<div>${editordata }</div>
	<h1>js</h1>
	<div id="rsthtml"></div>
	<h1>sqltrs</h1>
	<div>${sqlstr }</div>
	
	<script src="<%=path%>/js/jquery/jquery.min.js"></script>
	<script src="<%=path%>/js/popper.js/umd/popper.min.js"></script>
	<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jquery.cookie/jquery.cookie.js"> </script>
	<script src="<%=path%>/js/js.cookie.min.js"></script>
	<script src="<%=path%>/js/front.js"></script>
    <script type="text/javascript" src="<%=path%>/js/ms/htmlencode.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
		 var encodeHTML = ""
		var decodeHTML = HtmlUtil.htmlDecodeByRegExp("用正则表达式进行html解码：" + encodeHTML);
		rsthtml.innerHTML=decodeHTML
	    });
	</script>    
</body>
</html>