<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>编辑</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  <c:set var="isShow"><%=new String(request.getParameter("isShow").getBytes("iso-8859-1"), "utf-8") %></c:set>
  <c:set var="a"><%=new String(request.getParameter("a").getBytes("iso-8859-1"), "utf-8") %></c:set>
  <c:set var="data"><%=new String(request.getParameter("data").getBytes("iso-8859-1"), "utf-8") %></c:set>
  <c:set var="cpyId"><%=new String(request.getParameter("cpyId").getBytes("iso-8859-1"), "utf-8") %></c:set>
  <body>
  
  <script type="text/javascript">
  	function subBtn(){
  		document.getElementById("infoForm").submit();
  		setTimeout("window.parent.location.reload();",10);
  		
  	}
  </script>
  
  
  <c:if test="${isShow=='unedit'}">
	  	<p>${data }</p>
	  	
	  	
	  </c:if>
	  
  <c:if test="${isShow=='edit'}">
  <form id="infoForm" name="infoForm" action="<%=request.getContextPath() %>/mdfQyChange.do" method="post">
  	<input type="hidden" name="cpyId" value="${cpyId}">
  	<textarea rows="7" cols="32" name="${a }">${data}</textarea>
  	
  	<a href="javascript:void (0);" onclick="subBtn();">确定修改</a>
  </form>
  
  
  </c:if>
     
  </body>
</html>
