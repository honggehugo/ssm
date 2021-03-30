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

<body onload="checkInitVal()" class="bgc">
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

function checkInitVal(){
 var m = document.getElementById("psnSex");
 for(var i=0;i<=m.options.length;i++)
 {  
   if(parseInt(m.options[i].value)==parseInt(${qyn.psnSex}))
   {      
    m.options[i].selected=true;   
    break;
   }
 }
}

function initCheck(){
  var form = document.getElementById('mdform');
  var psnName = document.getElementById("psnName").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var psnAge = document.getElementById("psnAge").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');    
  var psnPhone = document.getElementById("psnPhone").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var hisInfo = document.getElementById("hisInfo").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var relaInfo = document.getElementById("relaInfo").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var famInfo = document.getElementById("famInfo").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var itsInfo = document.getElementById("itsInfo").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var deal = document.getElementById("deal").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var typee = document.getElementById("typee").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  var cpyId = document.getElementById("cpyId").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  //alert(deal +"  "+typee+"  "+cpyId);
	if(psnName==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入姓名！";
			return;
	}
	if(psnAge==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入年龄！";
			return;
	}
	else if(psnPhone==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入电话号码！";
			return;
	}else if(isNaN(psnPhone)){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "电话号码请输入数字！";
			return;
	}else if(hisInfo==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入主要经历！";
			return;
	}else if(relaInfo==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入关系网！";
			return;
	}else if(famInfo==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入家庭情况！";
			return;
	}/*else if(itsInfo==""){
			document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请输入兴趣爱好！";
			return;
	}*/else{
		form.action="<%=request.getContextPath() %>/mdfQyEmp.do?deal="+deal+"&type="+typee+"&cpyId="+cpyId;
		//alert(form.action);
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
<span class="s-1">企业人员信息维护</span><!-- <span class="s-2">一共  <b>100000+</b>  家公司</span> --></div>
<div class="content-box md">   
	<!--输入-->
	<ul class="inputBox-1">
	<form id="mdform" action="<%=request.getContextPath() %>/mdfQyEmp.do" method="post">
	 	<input type="hidden" id="psnId" name="psnId" value="${qyn.psnId}">
	 	<input type="hidden" id="cpyId" name="cpyId" value="${cpyId}">
		<li><span class="s-1">姓名：</span><input type="text"  id="psnName" name="psnName" value="${qyn.psnName}"></li>
		<li><span class="s-1">姓别：</span><select id="psnSex" name="psnSex"  class="period">
				<option value="2" >&nbsp;&nbsp;男&nbsp;&nbsp;</option>
			<option value="1">&nbsp;&nbsp;女&nbsp;&nbsp;</option>
		</select></li>
		<li><span class="s-1">年龄：</span><input type="text"  id="psnAge" name="psnAge" maxlength="3" value="${qyn.psnAge}">【岁】</li>
		<!-- <li><span class="s-1">照片：</span><input type="text" name="psnImg"></li>
		<li><span class="s-1">性别：</span>
		<input type="text" name="psnSex">
		</li>-->
		<li><span class="s-1">电话号码：</span><input type="text" id="psnPhone" name="psnPhone" value="${qyn.psnPhone}"  maxlength="11"></li>
		<li><span class="s-1">主要经历：</span><textarea name="hisInfo"  id="hisInfo" rows="8" cols="150" class="input-2">${qyn.hisInfo}</textarea></li>
		<li><span class="s-1">关系网：</span><textarea name="relaInfo"  id="relaInfo" rows="8" cols="150" class="input-2">${qyn.relaInfo}</textarea></li>
		<li><span class="s-1">家庭情况：</span><textarea name="famInfo"  id="famInfo" rows="8" cols="150" class="input-2">${qyn.famInfo}</textarea></li>
		<li class="intrBox"><span class="s-1">个人标签/</br>兴趣爱好</span>
			<div class="intrItem">
				<img src="img/intr-1.jpg" alt="">
				<span class="in-check">经济</span>
				<textarea name="itsInfo1"  id="itsInfo1" class="textarea-1">${qyn.itsInfo1}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-2.jpg" alt="">
				<span class="in-check">美食</span>
				<textarea name="itsInfo2"  id="itsInfo2"   class="textarea-1">${qyn.itsInfo2}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-3.jpg" alt="">
				<span class="in-check">服装</span>
				<textarea name="itsInfo3"  id="itsInfo3"  class="textarea-1">${qyn.itsInfo3}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-4.jpg" alt="">
				<span class="in-check">汽车</span>
				<textarea name="itsInfo4"  id="itsInfo4"   class="textarea-1">${qyn.itsInfo4}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-5.jpg" alt="">
				<span class="in-check">旅游</span>
				<textarea name="itsInfo5"  id="itsInfo5"  class="textarea-1">${qyn.itsInfo5}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-6.jpg" alt="">
				<span class="in-check">社交</span>
				<textarea name="itsInfo6"  id="itsInfo6"   class="textarea-1">${qyn.itsInfo6}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-7.jpg" alt="">
				<span class="in-check">古董、字画、书法</span>
				<textarea name="itsInfo7"  id="itsInfo7"  class="textarea-1">${qyn.itsInfo7}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-8.jpg" alt="">
				<span class="in-check">读书</span>
				<textarea name="itsInfo8"  id="itsInfo8"   class="textarea-1">${qyn.itsInfo8}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-9.jpg" alt="">
				<span class="in-check">外语</span>
				<textarea name="itsInfo9"  id="itsInfo9" class="textarea-1">${qyn.itsInfo9}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-10.jpg" alt="">
				<span class="in-check">音乐、电影</span>
				<textarea name="itsInfo10"  id="itsInfo10" class="textarea-1">${qyn.itsInfo10}</textarea>
			</div>
			<div class="intrItem">
				<img src="img/intr-1.jpg" alt="">
				<span class="in-check">其他标签</span>
				<textarea name="itsInfo"  id="itsInfo" class="textarea-1">${qyn.itsInfo}</textarea>
			</div>
			</li>
	   	 		<input type="hidden" value="<%=request.getAttribute("InfoMessage")%>" id="InfoMessage"/>
	   	 		<input type="hidden" value="${deal}" id="deal" name="deal"/>
	   	 		<input type="hidden" value="${type}" id="typee" name="typee"/>
	 		<div id="infoDiv" class="tip-1" style="display:none"><li><span>${InfoMessage}</span></li></div>


			<li>
			<input type="button" onclick="initCheck()" class="btn-submit"     value="            确认            ">
			<input type="button" class="btn-submit" onclick="history.back()"  value="            返回            ">
			</li>  
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



