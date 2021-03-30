<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<title>校企合作智能管理平台-企业决策信息</title>
	</head>

<body class="bgc">
<script>
function init(){
	//document.getElementById("cpyNameDiv").style.display="none";
	//document.getElementById("cpyDescDiv").style.display="none";
}

function initCheck(){
  var form = document.getElementById('mdfQyform');
  var cpyName = document.getElementById("cpyName").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cpyDesc = document.getElementById("cpyDesc").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cpyNature = document.getElementById("cpyNature").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var schContact = document.getElementById("schContact").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var schPos = document.getElementById("schPos").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cpyContact = document.getElementById("cpyContact").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var subject = document.getElementById("subject").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var industry = document.getElementById("industry").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var address = document.getElementById("address").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cooContent = document.getElementById("cooContent").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var closely = document.getElementById("closely").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cpyTele = document.getElementById("cpyTele").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var inTime = document.getElementById("inTime").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');

  //alert(cpyName);
	if(cpyName==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司名！";
			return;
	}
	else if(cpyDesc==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司简介！";
			return;
	}
	else if(cpyDecn==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(cpyNature==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(schContact==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(schPos==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(cpyContact==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(subject==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(industry==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(address==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(cooContent==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(closely==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(cpyTele==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else if(inTime==""){
			//$("#infoDiv").show();
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入公司决策信息！";
			return;
	}
	else{
		form.submit();
		window.close();
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
<span class="s-1">企业决策信息</span><!-- <span class="s-2">一共  <b>100000+</b>  家公司</span> --></div>
	<!--主体-->
<div class="content-box md">
	<!--输入-->
	<ul class="inputBox-1">
		<form id="mdfQyform" action="<%=request.getContextPath() %>/mdfQyDes.do" method="post">
	 	<input type="hidden" name="cpyId" value="<%=request.getParameter("cpyId") %>">
		<li><span class="s-1">企业名称：</span><input type="text" id="cpyName" name="cpyName" class="input-2" value="<%=new String(request.getParameter("cpyName").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">企业描述：</span><textarea id="cpyDesc" name="cpyDesc" rows="8" cols="80" class="input-2"><%=new String(request.getParameter("cpyDesc").getBytes("iso-8859-1"), "utf-8") %></textarea></li>
		<li><span class="s-1">决策信息：</span><textarea id="cpyDecn" name="cpyDecn" rows="8" cols="80" class="input-2"><%=new String(request.getParameter("cpyDecn").getBytes("iso-8859-1"), "utf-8") %></textarea></li>
	    
	    <li><span class="s-1">企业性质：</span><input type="text" id="cpyNature" name="cpyNature" class="input-2" value="<%=new String(request.getParameter("cpyNature").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">所属行业：</span><input type="text" id="industry" name="industry" class="input-2" value="<%=new String(request.getParameter("industry").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">公司所在地：</span><input type="text" id="address" name="address" class="input-2" value="<%=new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">面向专业：</span><input type="text" id="subject" name="subject" class="input-2" value="<%=new String(request.getParameter("subject").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">合作内容：</span><input type="text" id="cooContent" name="cooContent" class="input-2" value="<%=new String(request.getParameter("cooContent").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">紧密程度：</span><input type="text" id="closely" name="closely" class="input-2" value="<%=new String(request.getParameter("closely").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">学校联系人：</span><input type="text" id="schContact" name="schContact" class="input-2" value="<%=new String(request.getParameter("schContact").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">职务：</span><input type="text" id="schPos" name="schPos" class="input-2" value="<%=new String(request.getParameter("schPos").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">入库时间：</span><input type="text" id="inTime" name="inTime" class="input-2" value="<%=new String(request.getParameter("inTime").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">企业联系人：</span><input type="text" id="cpyContact" name="cpyContact" class="input-2" value="<%=new String(request.getParameter("cpyContact").getBytes("iso-8859-1"), "utf-8") %>"></li>
		<li><span class="s-1">电话：</span><input type="text" id="cpyTele" name="cpyTele" class="input-2" value="<%=new String(request.getParameter("cpyTele").getBytes("iso-8859-1"), "utf-8") %>"></li>
	    
	    
	    <li><span><input type="button" class="btn-submit" onclick="initCheck()" value="确认"></span>
	    <span><input type="button" class="btn-submit" onclick="history.back()"  value="返回"></span></li>
	 	<input type="hidden" value="<%=request.getAttribute("InfoMessage")%>" id="InfoMessage"/>
	 	<li><div id="infoDiv" name="infoDiv" class="tip-1" style="display:none"><span>${InfoMessage}</span></li></div>
		
		
		
		
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






