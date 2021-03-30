<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String schoolId = request.getParameter("schoolId")==null?"":request.getParameter("schoolId");
//request.setAttribute("schoolId", schoolId);
%>
<!DOCTYPE HTML">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		
		<title>校企合作智能管理平台-企业列表</title>
	</head>

<body class="bgc" onload="checkRadio();">
<script>
function checkRadio(){
	var cst=${cState};
	//alert(cst);
	var cpyStateObj = document.getElementById("cpyState").options;
  	for (var i=0; i<cpyStateObj.length; i++) {
            if (cpyStateObj[i].value == cst) {
                  cpyStateObj[i].selected = true;
                  break;
               }
         }
}
</script>
	<!--头部-->
<header class="header md">
	<div class="user-info"><span class="log-out"><a href="<%=request.getContextPath() %>/loginout.do">退出</a></span><a href="mdfUserPass.jsp?empNo=${sessionScope.empNo}"><span class="user">${sessionScope.empNo}</span></a></div>
</header>
	<!--面包屑-->
<div class="crumb md">
<c:if test="${ustId eq '0001'}">
<a href="<%=request.getContextPath() %>/getAllCompany.do" class="home">
返回首页
</a>
</c:if>
<c:if test="${ustId ne '0001'}">
<a href="#" class="home">
返回首页
</a>
</c:if>
<span class="s-1">企业列表</span><!-- <span class="s-2">一共  <b>100000+</b>  家公司</span> --></div>
	<!--主体-->
<div class="content-box md">
		<!--搜索框-->
<div class="searchBox md">
     <form action="<%=request.getContextPath() %>/queryQyList.do?dptno=${requestScope.dptno}" method="post">
			企业名称：<input type="text" id="cpyName" name="cpyName" class="input-1" value="${cName}" placeholder="输入企业名称">
		<select id="cpyState" name="cpyState"  class="period">
			<option value="6">全部</option>
			<option value="0">成长期企业</option>
			<option value="1">成熟期企业</option>
			<option value="2">结果期企业</option>
			<option value="3">创新转型期企业</option>
		</select>
		<input class="btnSearch" type="submit" value="搜索">
		<a class="btnAdd" href="addQyInfo.jsp?dptno=${requestScope.dptno}">
		添加企业</a>
	</form>
</div>


	<!--列表-->	
<c:forEach var="list"  items="${addLists}">
	<div class='companyItem'>
		<a href='<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}'>
			<img src='img/defaultCompany.jpg'>
			<div class='companyBoxR'><span class='s-1'>${list.cpyName}</span><span class='s-2'>${list.other3}</span><span>${list.other2}</span>
				<c:if test='${list.cpyDesc.length() <= 100}'><p>${list.cpyDesc}</p></c:if>
				<c:if test='${list.cpyDesc.length() > 100}'><p>${list.cpyDesc.substring(0,100)}......</p></c:if>
			</div>
		</a>
		</br>
	</div>
</c:forEach>
<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>
</body>
</html>
