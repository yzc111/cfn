<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

  <head>
<base href="<%=basePath%>">

<title>文件下载</title>
<link rel="icon" href="./img/logo.ico"/>
<link rel="shortcut icon" href="./img/logo.ico"/> 
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>

	<div align="left">
		<a href=".">&lt;back</a>
	</div>

     <center>
        <h2>${message}</h2>
    </center>
   <form action="${pageContext.request.contextPath}/servlet/ListFileServlet"  enctype="multipart/form-data" method="post">
 
        <input type="submit" value="目录">
    </form>
         <!-- 遍历Map集合 -->
    <c:forEach var="me" items="${fileNameMap}">
        <c:url value="/servlet/DownLoadServlet" var="downurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}">下载</a>
      <br/>
    </c:forEach>
    

     	    <!--  a href = "http://172.27.9.214:8080/assianno/assianno.jsp" >返回</a>-->
             <!-- 遍历Map集合 -->

    
    <!-- 遍历Map集合 -->
   

</body>
</html>