<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>后台管理中心</title>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<%String path=request.getContextPath(); %>
</head>
<body>
<!-- --------------------------------------------------delete模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">删除用戶</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="del_id" name="id">
							</div>
						</div>
						<div class="form-group">
						<h4><label  class="col-sm-8 control-label">确认要删除该用户吗？</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="deleteUser_btn">确认删除</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------delete的模态框结束位置------------------------------------------------------ -->

	<!-- --------------------------------------------------update模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用戶</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="updateList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="up_id" name="id">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_username" name="username" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="up_password"
									name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">选择您的角色</label>
							<div class="col-sm-10">
								<input type="text"  id="up_roleid"  name="roleid" placeholder="输入您的角色"class="form-control border-0 shadow form-control-lg" list="rolelist">
								<datalist id="up_rolelist">
									<option>admin</option>
									<option>user</option>
									<option>uploader</option>
								</datalist>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="sex" id="up_sex1" value=1 checked="checked"> 男</label> 
								<label class="radio-inline"> <input type="radio" name="sex" id="up_sex2" value=2> 女</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<!-- 省略了class:form-control -->
								<input type="date" id="up_birthday" name="birthday" placeholder="请输入生日">
							</div>
						</div>
						<div class="form-group">
							<label for="school" class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_school" name="school" placeholder="请输入学校">
							</div>
						</div>
						<div class="form-group">
							<label for="introduction" class="col-sm-2 control-label">个人介绍</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="up_introduction" name="introduction" rows="3"></textarea>
							</div>
						</div>

					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="updateUser_btn">修改用户</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------update的模态框结束位置------------------------------------------------------ -->

	<!-- --------------------------------------新增模态框-------------------------------------- -->
	<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">创建用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="saveList">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">再次输入密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password1" name="password1" placeholder="请再一次输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">选择您的角色</label>
							<div class="col-sm-10">

								<input type="text" id="roleid" name="roleid" placeholder="输入您的角色" class="form-control border-0 shadow form-control-lg" list="rolelist">
								<datalist id="rolelist">
									<option>admin</option>
									<option>user</option>
									<option>uploader</option>
								</datalist>

							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="sex" id="sex1" value=1 checked="checked"> 男</label> 
								<label class="radio-inline"> <input type="radio" name="sex" id="sex2" value=2> 女	</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="birthday" name="birthday" placeholder="请输入生日">
							</div>
						</div>
						<div class="form-group">
							<label for="school" class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="school" name="school" placeholder="请输入学校">
							</div>
						</div>
						<div class="form-group">
							<label for="introduction" class="col-sm-2 control-label">个人介绍</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="introduction" name="introduction" rows="3"></textarea>
							</div>
						</div>

					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveUser_btn">创建用户</button>
				</div>
			</div>

		</div>
	</div>
	<!-- ----------------------------------------------新增模态框结束位置------------------------------------- -->

	<div class="row" style="display: inline-flex; margin:20px 0 30px 20px;" >

		<div class="col-md-4">
			<form class="form-inline" action="${pageContext.request.contextPath}/user/selectLike">
				<div class="form-group">
					<label for="exampleInputName2">用户名：</label> 
					<input type="text"  class="form-control" name="username" id="search_username" autocomplete="on" placeholder="请输入您的用户名">
				</div>
				<button type="submit" class="btn btn-default" id="search_btn">查询用户</button>
			</form>
		</div>

		<div class="col-md-2">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveModal">添加用户</button>
		</div>
	</div>


	<div class="row" style="width: 95%;margin-left: 20px">
		<div class="col-md-12">
			<table class="table">
			<colgroup>
				<col style="width:5%;">
				<col style="width:10%;">
				<col style="width:5%;">
				<col style="width:5%;">
				<col style="width:10%;">
				<col style="width:5%;">
				<col style="width:20%;">
				<col style="width:20%;">
			</colgroup>
				<thead>
					<tr>
						<th>id</th>
						<th>username</th>
						<th>roleid</th>
						<th>sex</th>
						<th>birthday</th>
						<th>school</th>
						<th>introduction</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pageInfo.list}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.username}</td>
						<td>
						<c:if test="${user.roleid eq '1'}">管理员</c:if>
						<c:if test="${user.roleid eq 2}">用户</c:if>
						<c:if test="${user.roleid eq 3}">创作者</c:if>
						</td>
						<td>${user.sex==1?"男":"女"}</td>
						<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
						<td>${user.school}</td>
						<td>${user.introduction}</td>
							<td>
								<button type="button" class="btn btn-primary edit_btn" id="update_btn" data-toggle="modal" data-target="#updateModal">编辑</button>
								<button type="button" class="btn btn-danger del_btn" id="del_btn" data-toggle="modal" data-target="#deleteModal">删除</button>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	<div class="row text-center" style="width: 90%;">
		<div class="col-md-4">当前页数:${pageInfo.pageNum}页,总页数:${pageInfo.pages}页，总条数:${pageInfo.total}条</div>
		<div class="col-md-4">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a id="indexpage" href="#" aria-label="Previous">首页 </a></li>

					<c:if test="${pageInfo.hasPreviousPage}">
						<li><a id="prepage" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:if test="${!pageInfo.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 导航 -->
					<c:forEach items="${pageInfo.navigatepageNums}" var="pNum">
						<c:if test="${pNum==pageInfo.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=pageInfo.pageNum}">
							<li><a id="navpage" href="#">${pNum}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a id="nextpage" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
					<c:if test="${!pageInfo.hasNextPage }">
						<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span> </a></li>
					</c:if>
					
					<li><a id="endpage" href="#" aria-label="Previous">尾页 </a></li>

				</ul>
			</nav>
		</div>
		<div class="col-md-4"></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/custom/getcookie.js"></script>

	<script type="text/javascript">
	$(function(){
		//获取model传来的值
		var user=getCookie("like");
		$("#search_username").val(user);
		
		var navpage='${pageInfo.navigatepageNums}';
		var pdata='${pageInfo.list}';
		var pnum='${pageInfo.pageNum}';
		var prenum='${pageInfo.pageNum-1}';
		var nexnum='${pageInfo.pageNum+1}';
		var pn='${pageInfo.pages}';
		var getname=$("#search_username").val();
		var indexpn="<%=path%>/user/selectLike?username="+getname+"&pn=1";
		var prepn="<%=path%>/user/selectLike?username="+getname+"&pn="+prenum;
		var nextpn="<%=path%>/user/selectLike?username="+getname+"&pn="+nexnum;
		var navpn="<%=path%>/user/selectLike?username="+getname+"&pn="+navpage;
		var endpn="<%=path%>/user/selectLike?username="+getname+"&pn="+pn;
		
		console.log("indexpn:"+indexpn);
		console.log("prepn:"+prepn);
		console.log("nextpn:"+nextpn);
		console.log("navpn:"+navpn);
		console.log("endpn:"+endpn);
		$("#indexpage").attr("href",indexpn);
		$("#prepage").attr("href",prepn);
		$("#nextpage").attr("href",nextpn);
		$("#navpage").attr("href",navpn);
		$("#endpage").attr("href",endpn);	
		
	});

		$("#saveUser_btn").click(function() {
			//alert($("#saveModal form").serialize());

			var username = $("#username").val();
			var password = $("#password").val();
			var password1 = $("#password1").val();
			var radionum = document.getElementById("saveList").sex;
			for (var i = 0; i < radionum.length; i++) {
				if (radionum[i].checked)
					var sex = radionum[i].value;
			}

			sex = parseInt(sex);
			var roleid = $("#roleid").val();
			var birthday = $("#birthday").val();
			var school = $("#school").val();
			var introduction = $("#introduction").val();

			if (username == "" || password == "") {
				alert("用户名或密码不能为空");
				return false;
			}
			//判断两次密码是否一致
			if (password != password1) {
				alert("两次密码输入不一致");
				return false;
			}
			//判断用户名长度应该在6-16位
			if (username.length<6||username.length>16) {
				alert("用户名长度应该在6-16位");
				return false;
			}

			//判断密码应该在6-16位
			if (password.length<6||password.length>16) {
				alert("密码长度应该在6-16位");
				return false;

			}
			//转换rolename,admin为1，user为2，uploader为3
			if (roleid == "admin") roleid = 1;
			else if (roleid == "user") roleid = 2;
			else roleid = 3;

			var data1 = {
				"username" : username,
				"password" : password,
				"roleid" : roleid,
				"sex" : sex,
				"birthday" : birthday,
				"school" : school,
				"introduction" : introduction
			}

			$.ajax({
				url : "<%=path%>/user/saveUser",
				type : "POST",
				data : JSON.stringify(data1),
				contentType : 'application/json',
				success : function() {
					alert("数据保存成功");
					$("#saveModal").modal('hide');
				}
			});

		});

		//赋值操作
		$(document).on("click", ".edit_btn", function() {
			//修改框中用户信息回显
			
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			//将id的值传递给修改按钮的属性，方便发送Ajax请求
			$("#updateUser_btn").attr("edit-id", id1);
	
			var username1 = $(this).parent().parent().children("td").eq(1).text();
			var password1 = $(this).parent().parent().children("td").eq(2).text();
			var roleid1 = $(this).parent().parent().children("td").eq(3).text();
			var sex1 = $(this).parent().parent().children("td").eq(4).text();
			var birthday1 = $(this).parent().parent().children("td").eq(5).text();
			var school1 = $(this).parent().parent().children("td").eq(6).text();
			var introduction1 = $(this).parent().parent().children("td").eq(7).text();
			//将取到的值分别赋给updateModal里的字段
	
			//birthday格式化
			//自定义formatDate函数，最后格式化为'yy/MM/dd''
			function formatDate(date) {
				var date = new Date(date);
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				m = m < 10 ? '0' + m : m;
				var d = date.getDate();
				d = d < 10 ? ('0' + d) : d;
				return y + '-' + m + '-' + d;
			};
			birthday1=formatDate(birthday1);
	
			if (roleid1 == 1) roleid1 = 'admin';
			if (roleid1 == 2) roleid = 'user';
			else roleid = 'uploader';
	
			$("#up_id").val(id1);
			$("#up_username").val(username1);
			$("#up_password").val(password1);
			$("#up_roleid").val(roleid);
			$("#updateModal input[name=sex]").val(sex1);
			$("#up_birthday").val(birthday1);
			$("#up_school").val(school1);
			//textarea用val()赋值失败
			document.getElementById("up_introduction").value = introduction1;
		});

		$("#updateUser_btn").click(function() {

			var username = $("#up_username").val();
			var password = $("#up_password").val();
			var roleid = $("#up_roleid").val();
			var birthday = $("#up_birthday").val();
			var school = $("#up_school").val();
			var introduction = $("#up_introduction").val();
			var getid = $("#up_id").val();
			var id = parseInt(getid);
			//遍历2个radio button
			var radionum = document.getElementById("updateList").sex;
			for (var i = 0; i < radionum.length; i++) {
				if (radionum[i].checked)
					var sex = radionum[i].value;
			}

			if (sex == "男") sex = 1;
			else sex = 0;

			if (roleid == "admin") roleid = 1;
			if (roleid == "user") roleid = 2;
			if (roleid == "uploader") roleid = 3;

			if (username == null) {
				alert("请输入用户名");
				return false;
			}
			if (password == null) {
				alert("请输入密码");
				return false;
			}
			
			var data = {
				"id" : id,
				"password" : password,
				"username" : username,
				"roleid" : roleid,
				"sex" : sex,
				"birthday" : birthday,
				"introduction" : introduction,
				"school" : school,
			}

			$.ajax({
				url : "<%=path%>/user/updateUser",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("修改数据成功");
					$("#updateModal").modal('hide');
					window.location.reload();
					//window.location.href = "${pageContext.request.contextPath}/user/tologin";
				}
			});

		});

		$(document).on("click", ".del_btn", function() {
			//修改框中用户信息回显

			var del_id = $(this).parent().parent().children("td").eq(0).text();
			$("#del_id").val(del_id);
		});

		$("#deleteUser_btn").click(function() {
			var gid = $("#del_id").val();
			var id = parseInt(gid);
			var data = {
				"id" : id
			}
			$.ajax({
				url : "<%=path%>/user/deleteUser",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("数据成功删除");
					$("#deleteModal").modal('hide');
				}
			});
		});

			$("#search_btn").click(function() {
				var username = $("#search_username").val();
				var data1 = {
					"username" : username
				};
				//alert(JSON.stringify(data1));
			
				$.ajax({
					url : "<%=path%>/user/selectLike?username=" + username,
					type : "POST",
					data : JSON.stringify(data1),
					contentType : 'application/json',
					success : function() {
						//alert("success");
					}
				});
			})
	</script>

</body>
</html>