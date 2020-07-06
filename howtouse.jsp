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

<title>如何使用人机协同标注系统</title>
<link rel="icon" href="./img/logo.ico" />
<link rel="shortcut icon" href="./img/logo.ico" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div align="center">
		<h1>如何使用人机协同标注系统</h1>
		<p>首先，你需要注册一个账号，注册成功后请耐心等待审核，一旦审核通过，那么您就可以使用我们的标注系统了！</p>
		<p>如果您的账户通过审核，那么请耐心观看下面这些视频，它将会告诉您如何完成一条例句的标注。（视频只是演示标注过程，不保证标注结果的正确性。）
		</p>
		<table cellspacing="15px" width="100%" cellpadding="3">
			<tbody>
				<tr bgcolor="Beige">
					<td align="center">
						<dl>
							<dt><h2>通过输入例句获得分词结果</h2></dt>
							<dd>
								<video width="800" height="480" controls> 
								<source	src="howtouse/us/us.mp4" type="video/mp4"> 
								<source src="howtouse/us/us.webm" type="video/webm"> 
								<object	data="howtouse/us/us.mp4" width="800" height="480">
									<embed width="800" height="480" src="howtouse/us/us.swf">
								</object>
								</video>
							</dd>
						</dl>
					</td></tr>
					<tr bgcolor="Beige">
					<td align="center">
						<dl>
							<dt><h2>使用系统例句</h2></dt>
							<dd>
								<video width="800" height="480" controls> 
								<source	src="howtouse/ss/ss.mp4" type="video/mp4"> 
								<source src="howtouse/ss/ss.webm" type="video/webm"> 
								<object	data="howtouse/ss/ss.mp4" width="800" height="480">
									<embed width="800" height="480" src="howtouse/ss/ss.swf">
								</object>
								</video>
							</dd>
						</dl>
					</td>
				</tr>
				<tr bgcolor="Beige">
					<td align="center">
						<dl>
							<dt><h2>修改分词结果</h2></dt>
							<dd>
								<video width="800" height="480" controls> 
								<source	src="howtouse/cs/cs.mp4" type="video/mp4"> 
								<source src="howtouse/cs/cs.webm" type="video/webm"> 
								<object	data="howtouse/cs/cs.mp4" width="800" height="480">
									<embed width="800" height="480" src="howtouse/cs/cs.swf">
								</object>
								</video>
							</dd>
						</dl>
					</td>
				</tr>
				<tr bgcolor="Beige">
					<td align="center">
						<dl>
							<dt>
								<h2>标注例句</h2>
							</dt>
							<dd>
							<video width="800" height="480" controls> 
								<source	src="howtouse/ms/ms.mp4" type="video/mp4"> 
								<source src="howtouse/ms/ms.webm" type="video/webm"> 
								<object	data="howtouse/ms/ms.mp4" width="800" height="480">
									<embed width="800" height="480" src="howtouse/ms/ms.swf">
								</object>
								</video>
							</dd>
						</dl>
					</td>
				</tr>
			</tbody>
		</table>

		<p>感谢您耐心的观看完整个视频，这里有几点需要提示的</p>
		<table>
			<tr>
				<td><p>第一：在使用系统例句时，您不仅需要提供词元，您还需指定该词元所属的框架，可以通过下拉菜单或是输入框架名。</p></td>
			</tr>
			<tr>
				<td><p>第二：视频中演示了标注一个框架的情形，如果您想标注该条例句中的其他框架，只需在框架信息中点击其他框架的框架名，标注区域自动标注出例句中的目标词后，就可以进行标注该框架。最后，不要忘了在框架信息中勾选“提交此框架”！</p></td>
			</tr>
			<tr>
				<td><p>第三：如果登录后，您发现您的用户名旁边出现了数字，这表明您的例句收到了审核意见，需要进行修改。单机数字，即可看到。</p></td>
			</tr>
			<tr>
				<td><p>第四：封锁中的框架，是指那些正在后台进行训练的框架，此阶段请不要进行标注，以免浪费宝贵的资源。训练时间一般几分钟到几个小时不等。如果某个框架超过24小时处于封锁状态，请联系我们！</p></td>
			</tr>
			<tr>
				<td><p style="color: red;font-weight: bolder;">第五：对于词性的操作，例如修改分词，选择操作字段时，请将词和词性同时选中；对于标记后的部分进行操作时，请保证尖括号或是花括号的完整，即要成对的选择尖括号或是花括号</p></td>
			</tr>
			<tr>
				<td><p>第六：如果出现点击登录或是其他按钮后没有反应，请及时更新您的浏览器，我们推荐IE9以上、Chrome和FireFox浏览器</p></td>
			</tr>
			<tr>
				<td><p>最后：感谢您使用山西大学人机协同标注系统，如果有任何意见或是建议，请联系我们！我们真诚的感谢您的支持与信任。</p></td>
			</tr>
		</table>
		<a href="."><strong>开始标注！</strong></a>
	</div>
</body>
</html>
