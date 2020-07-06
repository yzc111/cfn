<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.io.*,java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传结果</title>
</head>
<body>
    <center>
        <h2>${message}</h2>
         <h2>3s 后返回……</h2>
    </center>
    
 
<script>
onload=function(){
    setInterval(go, 1000);
};
var x=3; //利用了全局变量来执行
function go(){
    x--;
    if(x>0){
        document.getElementById("time").innerHTML=x;  //每次设置的x的值都不一样了。
    }else{
        location.href="http://localhost:8080/assianno/assianno.jsp	";  // 设置你的注册页面
    } 
}  
</script>
<span id="time">3</span>
</html>