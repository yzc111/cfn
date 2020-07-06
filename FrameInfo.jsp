<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="icon" href="./img/logo.ico"/>
<link rel="shortcut icon" href="./img/logo.ico"/> 
    <title>框架信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
	      <script src="./dist/js/jquery.json.js"></script>
	
	 <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

   


  </head>
  
  <body>
  <h1 id="frameinfo">框架信息：</h1>
<table class="table table-condensed table-hover table-bordered" contenteditable="true">
	<thead>
		<tr>
			<th>框架元素名</th>
			<th>框架元素英文名</th>
			<th>是否为核心框架元素</th>
			<th>框架元素描述</th>
		</tr>
	</thead>
	<tbody id="frameelementbody">
	</tbody>
</table>

<script type="text/javascript">
$(document).ready(function(){
   var json=eval(<%=(String)request.getAttribute("frameinfo")%>);
   document.getElementById("frameinfo").innerHTML+=json.framedef;
   $.each(eval("("+json.frameelementsjsonstring+")"),function(n,item){
   document.getElementById("frameelementbody").innerHTML+="<tr><td>"+item.frameelementname+"</td><td>"+item.frameelementname_en+"</td><td>"+item.iscore+"</td><td>"+item.frameelementdescription+"</td></tr><tr> <td> </td><td> </td><td> </td><td>"+item.frameelementsentence+"</td></tr>";
   });
});
</script>
  </body>
</html>
