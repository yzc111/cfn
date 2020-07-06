<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人信息</title>
<link rel="icon" href="./img/logo.ico"/>
<link rel="shortcut icon" href="./img/logo.ico"/> 
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<!-- <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">-->
<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./dist/flat/pink.css" rel="stylesheet">
<link href="./dist/css/futurico.css" rel="stylesheet">
<link
	href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="./dist/css/buttons.css" rel="stylesheet">

<!-- <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>-->
<script src="./dist/js/jquery-2.0.0.min.js"></script>
<script src="./dist/js/icheck.min.js"></script>
<!--   <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>-->
<script src="./dist/js/bootstrap.min.js"></script>
<script src="./dist/js/jquery.json.js"></script>
<script src="./dist/js/jquery-2.12.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div align="right">
						<a href=".">&lt;back</a><br> <a href="./UserAudit.jsp">&lt;审核意见</a><br><a href="http://115.24.12.89:8080/cfn/servlet/UpdateSoftServlet" target="_blank">下载管理软件</a>
					</div>
					<div align="center" class="col-xs-12">
						<h3>个人信息</h3>
						<p>
							<i>带星号的例句为入库后需要重新标注的例句</i>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12">
								<div align="center">
									<p>
										<input type="radio" name="selecttype" value="frameid">
										框架：<select id="frameselect"></select> <input type="radio"
											name="selecttype" value="framename"> 输入框架名：<input
											type="text" id="frameinput" />
									</p>
									<button class="btn btn-large btn-primary" type="button"
										onclick="selectsentence()">筛选</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<table class="table table-condensed table-hover table-striped">
									<thead>
										<tr>
											<th style="width: 60px;">编号</th>
											<th>例句</th>
											<th style="width: 60px;">状态</th>
											<th style="width: 80px;">操作</th>
										</tr>
									</thead>
									<tbody id="sentencetable">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						selectsentence();
					});
</script>

</html>
