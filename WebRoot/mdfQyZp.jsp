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
		<title>校企合作智能管理平台-添加决策数据</title>
	</head>

<body onload="init()" class="bgc">
<script>
 function addText(){
        var div = document.getElementById("div");
        //div.innerHTML += "<div class='recruitBox-2' id='xqhz'><a href='#' onclick='deleteText(this)'><span class='btn-4'>删除</a> &nbsp;&nbsp;&nbsp;  年份<input id='jobYear' name='jobYear'  maxlength='4' type='text' placeholder='输入4位数字年份如2019' value=''>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人数<input type='text' id='jobNum' name='jobNum'  placeholder='输入数字人数' value=''>人</span></div>";
        div.innerHTML += "<div class='recruitBox-2' id='xqhz'><a href='#' onclick='deleteText(this)'><span class='btn-4'>删除</a> &nbsp;&nbsp;&nbsp;	年份<input id='jobYear' maxlength='4' name='jobYear' type='text' value='' placeholder='输入4位数字年份如2019'>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在职实习生<input type='text' id='jobNum' name='jobNum' value='' placeholder='输入数字人数'>人 &nbsp;&nbsp;&nbsp;转正毕业生<input type='text' id='gradNum' name='gradNum' value='' placeholder='输入数字人数'>人&nbsp;&nbsp;&nbsp;招聘人数<input type='text' id='employNum' name='employNum' value='' placeholder='输入数字人数'>人</span></div>"
    }
    function deleteText(This){
        //获取删除按钮的父元素 的 父元素 利用 爷爷元素 删除
        This.parentNode.parentNode.removeChild(This.parentNode);
    }
	
	function checkSub(){
		document.getElementById("infoDiv").style.display="block";
		var form = document.getElementById('mdfQyform');
		
		var list=document.getElementById("div").getElementsByTagName("input");
 		//alert(list.length);
 		if(list.length==0){
		    document.getElementById("infoDiv").style.display="";
			document.getElementById("infoDiv").innerHTML = "请点击添加按钮添加一条数据!";
			return;
		}
		   //var strData="";
		  //对表单中所有的input进行遍历
		 for(var i=0;i<list.length && list[i];i++)
		 {
		       //判断是否为文本框
		       if(list[i].type=="text")  
		       {
		            //strData +=list[i].id+":"+list[i].value+"--";
		           var dt = list[i].value.replace(/^\s\s*/, ''); 
		           //alert(dt);      
		           if(dt==null||dt==""){
		           		document.getElementById("infoDiv").style.display="";
						document.getElementById("infoDiv").innerHTML = "年份和招聘人数都不能为空!";
						return;
		           }
		           if(isNaN(dt)){
		           	    document.getElementById("infoDiv").style.display="";
						document.getElementById("infoDiv").innerHTML = "年份和招聘人数格式应为数字!";
						return;
		           }
		       }
		 }

	    form.submit();	
	}
	
   function init(){
    var msg = document.getElementById("InfoMessage").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    //alert(msg);
    if(msg.length>5){
   		document.getElementById("infoDiv").style.display="block"; 	
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
<div class="content-box md recruit">
 <form id="mdfQyform" action="<%=request.getContextPath() %>/mdfQyZp.do" method="post">

	    <input type="hidden" id="cpyId" name="cpyId" value="${cId}">  
	    <input type="hidden" id="other1" name="other1" value="${cName}">
		<input type='hidden' id='cpyState' name='cpyState'  value="2">
	<!--输入-->
	<ul class="recruitBox-1">
		<li><b>&nbsp;&nbsp;&nbsp;${cName}&nbsp;&nbsp;历年招聘人数:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;<input type="button" onclick="addText()"  class="submit-2" value="增加一条">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li><input type="button" onclick="checkSub()"  class="submit-2" value="提交数据">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li><input type="button" onclick="history.back()"  class="submit-2" value="返回"></li>
	</ul>

		<div id="div">
			<c:forEach var="list"  items="${qjbList}">
			<div class="recruitBox-2" id='xqhz'>
					<a href="#" onclick='deleteText(this)'><span class="btn-4">删除</a> &nbsp;&nbsp;&nbsp;  
					年份<input id='jobYear' maxlength='4' name='jobYear' type='text' value="${list.jobYear}">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					在职实习生<input type='text' id='jobNum' name='jobNum' value="${list.jobNum}">人 &nbsp;&nbsp;&nbsp;  
					转正毕业生<input type='text' id='gradNum' name='gradNum' value="${list.gradNum}">人&nbsp;&nbsp;&nbsp;  
					招聘人数<input type='text' id='employNum' name='employNum' value="${list.employNum}">人</span>
			</div>
			</c:forEach>
		</div>	
		
	 		<input type="hidden" value="<%=request.getAttribute("InfoMessage")%>" id="InfoMessage"/>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		 	<div id="infoDiv" name="infoDiv" class="tip-1" style="display:none"><li><span>${InfoMessage}</span></li></div>
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
