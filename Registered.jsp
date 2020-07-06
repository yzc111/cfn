<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Registered.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="./dist/js/jquery-2.0.0.min.js"></script>

  </head>
  
  <body>
    <div align="center">
    	<h1 align="center">欢迎注册辅助标注用户</h1>
    	<div align="center" style="width:100%">
    		<table>
    			<tr>
    				<td>用户名：</td>
    				<td><input type="text" id="username" pattern="[A-z|a-z|0-9]+" title="请输入英文或数字" /></td>
    			</tr>
    			<tr>
    				<td>密码：</td>
    				<td><input type="password" id="pw1"/></td>
    			</tr>
    			<tr>
    				<td>确认密码：</td>
    				<td><input type="password" id="pw2"/></td>
    			</tr>
    			<tr>
    				<td>自我说明：</td>
    				<td><textarea rows="6" id="desc"></textarea></td>
    			</tr>
    			<tr>
    				<td><img alt="验证码" src="patchca.png" style="cursor:pointer;vertical-align:text-bottom;"
				onclick="this.src=this.src+'?'+Math.random();"></td>
    				<td><input id="patchca" type="text" placeholder="请输入左侧验证码"></td>
    			</tr>
    			<tr>
    				<td align="center"><button type="submit" onclick="submit()">提交</button></td>
    				<td align="center" onclick="reset()"><button>重置</button></td>
    			</tr>
    		</table>
    	</div>
    </div>    
  </body>
  <script type="text/javascript">
	function submit(){
		var username=document.getElementById("username").value;
		var pw1=document.getElementById("pw1").value;
		var pw2=document.getElementById("pw2").value;
		var desc=document.getElementById("desc").value;
		var patchca=document.getElementById("patchca").value;
		if(username.match(/\W/)){
			alert("用户名只能是英文和数字");
			return;
		}
		if(pw1!=pw2){
			alert("两次密码输入不一致");
			return;
		}
		if(username==""||pw1==""||pw2==""||desc==""||patchca==""){
			alert("请填入完整信息");
			return;
		}
		
		$.post("/assianno/servlet/RegisteredUser",{
			username:username,
			password:pw1,
			desc:desc,
			patchca:patchca
		},function(data,status){
			if(status=="success"){
				if(data=="2"){
					alert("通讯故障。。。");
					return;
				}
				if(data=="1"){
					alert("用户名已被注册");
					return;
				}
				if(data=="0"){
					alert("注册成功，请等待审核！");
					window.location.href="";
				}
				if(data=="3"){
					alert("验证码错误！");
					return;
				}
			}
		});
	}

function reset(){
	document.getElementById("username").value="";
	document.getElementById("pw1").value="";
	document.getElementById("pw2").value="";
	document.getElementById("desc").value="";	
}
	
</script>
  
</html>
