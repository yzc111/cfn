<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>审核意见</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
			<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="./dist/flat/pink.css" rel="stylesheet">
	<link href="./dist/css/futurico.css" rel="stylesheet">
	
   <!-- <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>-->
   <script src="./dist/js/jquery-2.0.0.min.js"></script>
   <script src="./dist/js/icheck.min.js"></script>
   <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
   <script src="./dist/js/jquery.json.js"></script>
   <script src="./dist/js/jquery-2.12.js"></script>
   <style type="text/css">
   	table{
   		word-break:break-all; word-wrap:break-all;width:100%;overflow:auto;margin:20px;
   	}
   	table,td,th{
   		border:1px solid blue;
   	}
   </style>

  </head>
  
  <body>
  					<div align="right">
						<a href=".">&lt;back</a>
					</div>
    <h1>被退回的例句：</h1>
    <table>
    	<thead>
    		<tr>
    			<th>编号</th>
    			<th>例句</th>
    			<th>最后审核时间</th>
    			<th>审核意见</th>
    		</tr>
    	</thead>
    	
    	<tbody id="audittable" >
    	</tbody>
    	
    </table>
    
    <script type="text/javascript">
    $(document).ready(auditload());
    </script>
    
  </body>
  
</html>
