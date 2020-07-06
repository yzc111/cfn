<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>">

<title>文件上传</title>
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

</head>

<body>

      <center>
        <h2>${message}</h2>
        
    </center>
  
    <form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">

        上传文件：<input type="file" name="file1"><br/>
  
        <input type="submit" value="提交">
    </form>
    
    <form action="${pageContext.request.contextPath}/servlet/delete"  enctype="multipart/form-data" method="post">
 
        <input type="submit" value="目录">
    </form>
      <c:forEach var="me" items="${fileNameMap}">
        <c:url value="/servlet/DownLoadServlet" var="downurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}">下载</a>
       
         <c:url value="/servlet/delete" var="delurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
       <t/><a href="${delurl}">删除</a>
        <br/>
    </c:forEach>
    
    	 <!--a href = "http://172.27.9.214:8080/assianno/assianno.jsp" >返回</a>-->
  </body>
</html>