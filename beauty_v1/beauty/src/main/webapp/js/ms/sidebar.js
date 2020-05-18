document.writeln("<div id=\'sidebar\' class=\'nav-left-sidebar sidebar-dark\'>");
document.writeln("	<div class=\'menu-list\'>");
document.writeln("		<nav class=\'navbar navbar-expand-lg navbar-light\'>");
document.writeln("			<div class=\'collapse navbar-collapse\' id=\'navbarNav\'>");
document.writeln("				<ul class=\'navbar-nav flex-column\'>");
document.writeln("					<li>");
document.writeln("						<a class=\'navbar-brand\' href=\'index\' style=\'color:white;\'>reachableBeauty</a>");
document.writeln("					</li>");

if(roleid==1){
	document.writeln("<!-- role == admin -->");
	document.writeln("<li class=\'nav-divider\'>");
	document.writeln("	User");
	document.writeln("</li>");
	document.writeln("<li id=\'user-admin\' class=\'nav-item \'>");
	document.writeln("	<!-- a class=\'active\' -->");
	document.writeln("	<a class=\'nav-link\' href=\'adminuser\'>");
	document.writeln("		<i class=\'fa fa-fw fa-user-circle\'></i> 用户管理");
	document.writeln("		<span class=\'badge badge-success\'>6</span>");
	document.writeln("	</a>");
	document.writeln("");
	document.writeln("</li>");
	document.writeln("<li id=\'role-admin\' class=\'nav-item \'>");
	document.writeln("	<a class=\'nav-link\' href=\'adminrole\'>");
	document.writeln("		<i class=\'fa fa-fw fa-user-plus\'></i> 角色管理");
	document.writeln("		<span class=\'badge badge-success\'>6</span>");
	document.writeln("	</a>");
	document.writeln("</li>");
	document.writeln("<li class=\'nav-divider\'>");
	document.writeln("	Blog");
	document.writeln("</li>");
	document.writeln("<li id=\'type-admin\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'admintype\'>");
	document.writeln("		<i class=\'fa fa-fw fa-list-alt\'></i>类别管理");
	document.writeln("	</a>");
	document.writeln("</li>");
	document.writeln("<li id=\'blog-admin\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'adminblog\'>");
	document.writeln("		<i class=\'fa fa-fw fa-newspaper-o\'></i>博客管理");
	document.writeln("	</a>");
	document.writeln("</li>");
	document.writeln("<li id=\'cmt-admin\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'admincomment'>");
	document.writeln("		<i class=\'fa fa-fw fa-comments\'></i>评论管理");
	document.writeln("	</a>");
	document.writeln("</li>");
}else{
	document.writeln("<!-- role == uploader -->");
	document.writeln("<li class=\'nav-divider\'>");
	document.writeln("	创作中心");
	document.writeln("</li>");
	document.writeln("<li id=\'add-up\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'addblog\'>");
	document.writeln("		<i class=\'fa fa-fw fa-list-alt\'></i>添加博客");
	document.writeln("	</a>");
	document.writeln("</li>");
	document.writeln("<li id=\'blog-up\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'upblog\'>");
	document.writeln("		<i class=\'fa fa-fw fa-newspaper-o\'></i>博客管理");
	document.writeln("	</a>");
	document.writeln("</li>");
	document.writeln("<li id=\'cmt-up\' class=\'nav-item\'>");
	document.writeln("	<a class=\'nav-link\' href=\'upcomment\'>");
	document.writeln("		<i class=\'fa fa-fw fa-comments\'></i>评论管理");
	document.writeln("	</a>");
	document.writeln("</li>");
}

document.writeln("					<li class=\'nav-divider\'></li>");
document.writeln("					<li class=\'nav-item\'>");
document.writeln("						<a class=\'nav-link\' href=\'login\'>");
document.writeln("							<i class=\'fa fa-fw fa-sign-out\'></i>登出");
document.writeln("						</a>");
document.writeln("					</li>");
document.writeln("				</ul>");
document.writeln("			</div>");
document.writeln("		</nav>");
document.writeln("	</div>");
document.writeln("</div>");