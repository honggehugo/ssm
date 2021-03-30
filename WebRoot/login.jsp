<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<title>校企合作智能管理平台-登录</title>
	</head>


	<!--头部-->
<header class="header md">
	<div class="user-info"><!--  <span class="log-out"><a href="loginOut.jsp">退出</a></span><a href="mdfUserPass.jsp?empNo=${sessionScope.empNo}"><span class="user">${sessionScope.empNo}</span></a>--></div>
</header>
<body class="bgc" onload="init()">
<script>
function init(){
	document.getElementById("msgDiv").style.display="none";
	var msgInfo = document.getElementById("msgInfo").value;
	var InfoMessage = document.getElementById("InfoMessage").value;
	//alert(msgInfo.length);
	if (msgInfo.length>=5)
	{
	   document.getElementById("msgDiv").style.display="block";
	}
	if (InfoMessage.length>=5)
	{
	   document.getElementById("infoDiv").style.display="block";
	}
}

function initCheck(){
  var form = document.getElementById('loginform');
  var empNo = document.getElementById("empNo").value;
  var empPasswd = document.getElementById("empPasswd").value;
	if(empNo==""){
			document.getElementById("msgDiv").style.display="block";
			document.getElementById("msgDiv").innerHTML = "请输入工号！";
			return;
	}
	if(empPasswd==""){
			document.getElementById("msgDiv").style.display="block";
			document.getElementById("msgDiv").innerHTML = "请输入密码！";
			return;
	}
	//alert('222');
    form.submit();
}
</script>
	<!--主体-->
<div class="logo-box">
	<!--输入-->
	<h2 class="h2-2">用户登录<span class="s-1">LOGIN</span></h2>
	<input type="hidden" value="<%=request.getAttribute("msgInfo")%>" id="msgInfo"/>
	<input type="hidden" value="<%=request.getAttribute("InfoMessage")%>" id="InfoMessage"/>
	<form id="loginform" action="<%=request.getContextPath() %>/loginSys.do" method="post">
		<ul class="inputBox-1">
			<li><span class="s-1">员工号</span><input type="text" id="empNo" name="empNo" class="input-2" placeholder="员工号"></li>
			<li><span class="s-1">密码</span><input type="password" class="input-2" id="empPasswd" name="empPasswd" placeholder="密码"></li>
			<span ><input type="button" class="btn-submit" onclick="initCheck()" value="                      确认                      "></span>
			<!-- <li>	<span class="btn-submit">确定</span></li>
			<!-- <li class="link-1"><a href="#">忘记密码？</a></li> -->
			</br>
			<div id="infoDiv" class="tip-2" style="display:none"><li><span >${InfoMessage}</span></li></div>
			<div id="msgDiv" class="tip-1"><li><span>${msgInfo}</span></li></div>
		</ul>
	</form>

</div>

<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>

</body>
</html>
