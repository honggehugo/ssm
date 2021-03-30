<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String empName = request.getSession().getAttribute("empName")==null?"":request.getSession().getAttribute("empName").toString().trim();
//request.setAttribute("ustId", ustId);
%>

<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<title>校企合作智能管理平台-添加企业</title>
	</head>

<body class="bgc" onload="init()">
<script>
function init(){
	document.getElementById("cpyNameDiv").style.display="none";
	document.getElementById("cpyDescDiv").style.display="none";
	
	//var ss = ${requestScope.dptno}
	//alert(ss);
}

function initCheck(){
  var form = document.getElementById('addQyform');
  var cpyName = document.getElementById("cpyName").value;
  var cpyDesc = document.getElementById("cpyDesc").value;
  //var schoolId = document.getElementById("schoolId").value;
	if(cpyName==""){
			document.getElementById("cpyNameDiv").style.display="";
			return;
	}
	else if(cpyDesc==""){
			document.getElementById("cpyNameDiv").style.display="none";
			document.getElementById("cpyDescDiv").style.display="";
			return;
	}
	else{
		//form.action="<%=request.getContextPath() %>/addQyInfo.do?schoolId="+schoolId;
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

<span class="s-1">添加企业</span><!-- <span class="s-2">一共  <b>100000+</b>  家公司</span> --></div>
	<!--主体-->
<div class="content-box md">
	<!--输入-->
	<ul class="inputBox-1">
	 <form id="addQyform" action="<%=request.getContextPath() %>/addQyInfo.do" method="post">
		<li><span class="s-1">企业名称</span><input type="text" id="cpyName" name="cpyName" class="input-2" placeholder="企业名称"></li>
		<li><span class="s-1">企业介绍</span><textarea id="cpyDesc" name="cpyDesc" rows="8" cols="80" class="input-2"></textarea></li>
		<c:if test="${param.dptno == null}">
		<li><span class="s-1">所属学院${schoolId}</span><div>    	
					<select class="period"  name="schoolId">
						<option value="1" check="checked">机车车辆学院</option>
					    <option value="2">信息工程学院</option>
						<option value="3">电气工程学院</option>
						<option value="4">机电工程学院</option>
						<option value="5">运输物流学院</option>
						<option value="6">外语商贸学院</option>
						<option value="7">创新创业学院</option>
						<option value="8">国际合作学院</option>
						<option value="9">马克思主义学院</option>
						<option value="10">继续教育学院</option>
					</select></div>
		</li>
		</c:if>
		<li><span class="s-1">添加人姓名</span><span style="line-height:30px">${sessionScope.empName}</span></li>
		<li><span><input type="button" class="btn-submit" onclick="initCheck()" value="确定" ></span><span><input type="button" class="btn-submit" onclick="history.back()" value="返回" ></span></li>
		<c:if test="${param.dptno != null}">
			<input type="hidden" id="schoolId" name="schoolId" value="<%=request.getParameter("dptno")==null?"":request.getParameter("dptno")%>">
		</c:if>
		<input type="hidden" name="cpyState" value="0">
				 
			<div id="cpyNameDiv"><li><span class="tip-1">请输入企业名称</span></li></div>
			<div id="cpyDescDiv"><li><span class="tip-1">请输入企业介绍</span></li></div>
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

