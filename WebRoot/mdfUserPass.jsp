<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<title>校企合作智能管理平台-修改密码</title>
	</head>

<body class="bgc" onload="init()">
<script>
function init(){
	document.getElementById("mgsDiv").style.display="none";
	document.getElementById("infoDiv").style.display="none";
	var InfoMessage = document.getElementById("InfoMessage").value;
	if (InfoMessage.length>5)
	{
	   document.getElementById("infoDiv").style.display="block";
	}
}

function initCheck(){
  var form = document.getElementById('mdfPassform');
  var empPasswd = document.getElementById("empPasswd").value;
  var other2 = document.getElementById("other2").value;
  var other3 = document.getElementById("other3").value;
  //alert(empPasswd);
	if(empPasswd==""){
			document.getElementById("mgsDiv").style.display="";
			document.getElementById("mgsDiv").innerHTML = "请输入原密码！";
			return;
	}
	else if(other2==""){
			document.getElementById("mgsDiv").style.display="";
			document.getElementById("mgsDiv").innerHTML = "请输入新密码！";
			return;
	}else if(other3==""){
			document.getElementById("mgsDiv").style.display="";
			document.getElementById("mgsDiv").innerHTML = "请再次输入新密码！";
			return;
	}else if(other2!=other3){
			document.getElementById("mgsDiv").style.display="";
			document.getElementById("mgsDiv").innerHTML = "两次输入不一致！";
			return;
	}
	else{
		form.submit();
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
<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=${sessionScope.ustId}" class="home">
返回首页
</a>
</c:if>

<span class="s-1">修改密码</span><!-- <span class="s-2">一共  <b>100000+</b>  家公司</span> --></div>
	<!--主体-->

<div class="content-box md pw">
	<!--输入-->
	<ul class="inputBox-1">
	<form id="mdfPassform" action="<%=request.getContextPath() %>/passwdModify.do" method="post">
	<li><span class="s-1">员工号</span><div class="text-1">${sessionScope.empNo}<input type="hidden" id="empNo" name="empNo" value="${sessionScope.empNo}"></div></li>
		<li><span class="s-1">原密码</span><input type="text" class="input-2" id="empPasswd" name="empPasswd" placeholder="原密码"></li>
		<li><span class="s-1">新密码</span><input type="text" class="input-2" id="other2" name="other2" value="" placeholder="新密码"></li>
		<li><span class="s-1">重复新密码</span><input type="text" class="input-2" id="other3" name="other3" placeholder="新密码"></li>
	<!-- <li><div class="tip-1">请输入企业名称</div></li>
		<li><div class="tip-2">成功提交</div></li>
		<li><div class="tip-3">这只是一个提示</div></li> -->
		<li><span><input type="button" onclick="initCheck()" class="btn-submit" value="确认"></span>
		<span><input type="button" class="btn-submit" onclick="history.back()"  value="返回"></span></li>
			<div id="mgsDiv" class="tip-1"></div>
	<!-- 			 
		<div class="tip-1">请输入企业名称</div>
		<div class="tip-2">成功提交</div>
	 -->
	 <input type="hidden" value="<%=request.getAttribute("InfoMessage")%>" id="InfoMessage"/>
	<div id="infoDiv" class="tip-1"><li><span>${InfoMessage}</span></li></div>
		</form>
	</ul>
</div>
<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>

</body>
</html>


