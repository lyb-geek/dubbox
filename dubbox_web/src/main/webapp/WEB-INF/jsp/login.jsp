<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>登录页</title>
<script type="text/javascript" src="${basePath}js/modules/main/login.js"></script>
<script type="text/javascript">
//解决iframe窗体丢失Session时登录窗口显示在子页面的问题
$(function() {
	//初始化
	login.init();
	
    if (top.location != self.location) {
        top.location = self.location;
    }
});
//键盘回车事件
$(document).keyup(function(event){
    if (event.keyCode == 13) {
        login.login();
    }
});
</script>
</head>
<body>
	<!-- 如果用户之前登录过了，直接跳转到登录页面 -->
	<shiro:authenticated>
		<% response.sendRedirect(basePath + "index"); %>
	</shiro:authenticated>
	<div class="head"><br/></div>
	<div class="col-xs-3 col-md-offset-4 container">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h3>用户登录</h3>
				<span class="text-danger">(密码加密这些就不做了，各有各的加密方法)</span>
			</div>
			<div class="panel-body">
				<form action="login" id="form">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th colspan="2">
								<h4 class="text-center text-danger" id="info">
									<c:if test="${not empty param.kickout}">您被踢出登录！</c:if>
								</h4>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="text-center"><h4>帐号:</h4></th>
							<td><input type="text" class="form-control" name="username" id="username" placeholder="请输入名称" /></td>
						</tr>
						<tr>
							<th class="text-center"><h4>密码:</h4></th>
							<td><input type="password" class="form-control" name="password" id="password" placeholder="请输入密码" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" name="rememberMe" id="ck" /><label for="ck">请记住我(30 Day)</label></td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="javascript:void(0);" class="btn btn-primary col-md-offset-4" id="submitbtn">登陆</a>
								<a href="javascript:void(0);" class="btn btn-primary col-md-offset-1">清空</a>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>