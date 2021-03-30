<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 将Html4改为html5 -->
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<!DOCTYPE HTML">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<title>校企合作智能管理平台</title>
	</head>
<body>
<header class="header md">
	<div class="user-info"><span class="log-out"><a href="<%=request.getContextPath() %>/loginout.do">退出</a></span><a href="mdfUserPass.jsp?empNo=${sessionScope.empNo}"><span class="user">${sessionScope.empNo}</span></a></div>
</header>
<script>
function showList(sid){
	var qryForm = document.getElementById("qryform");
	var cpyName = document.getElementById("cpyName").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	var cpyState = document.getElementById("cpyState").value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	//alert(sid+"  "+cpyName+"  "+cpyState);
	qryForm.action="<%=request.getContextPath()%>/QyListQry.do?schoolId="+sid;
	if(cpyName!=""){
	 	qryForm.action = qryForm.action+"&cpyName="+cpyName;
	}if(cpyState!=""){
		qryForm.action = qryForm.action+"&cpyState="+cpyState;
	}
	//alert(qryForm.action);
	qryForm.submit();
}

function checkRadio(){
	var cst=${cpyState}==null?"":${cpyState};
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
<div class="home-banner md"></div>
<div class="school-inf">
	<p>广铁职院共有<span class="s1">12</span>个二级学院及单位,共邀请<span class="s1"><a href="<%=request.getContextPath() %>/QyListQry.do">${requestScope.totalCpy}</a></span>家企业总共加入</p>
	<ul class="tree">
	   <c:forEach items="${showLists}" var="item" >
    		<c:if test="${item.cpyState==0}">
    			<li><a href="<%=request.getContextPath() %>/QyListQry.do?cpyState=0"><img src="img/tree-1.gif" alt=""><b>${item.other1}</b>成长期企业</a></li>		
    		</c:if>
    		<c:if test="${item.cpyState==1}">
    			<li><a href="<%=request.getContextPath() %>/QyListQry.do?cpyState=1"><img src="img/tree-2.gif" alt=""><b>${item.other1}</b>成熟期企业</a></li>		
    		</c:if>    	
    		<c:if test="${item.cpyState==2}">
    			<li><a href="<%=request.getContextPath() %>/QyListQry.do?cpyState=2"><img src="img/tree-3.gif" alt=""><b>${item.other1}</b>结果期企业</a></li>
    		</c:if>
    		<c:if test="${item.cpyState==3}">
    			<li><a href="<%=request.getContextPath() %>/QyListQry.do?cpyState=3"><img src="img/tree-4.gif" alt=""><b>${item.other1}</b>创新转型期企业</a></li>
    		</c:if>    		
        </c:forEach>
	</ul>
</div>
  <body onload="checkRadio()">
  
  
  
  
  <!--     /////////////////////////html4.01改为html5后操作        -->
  <div>
	<details>
		<summary>机车车辆学院</summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202001'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=1">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list" items="${addLists}">
					
					 	<c:if test="${list.schoolId eq 1}">
					 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
							 	<c:if test="${list.cpyState==0}">
							 		<span class="tree-1"><b>${list.cpyName}</b></span>	
							 	</c:if>
							 	<c:if test="${list.cpyState==1}">
							 		<span class="tree-2"><b>${list.cpyName}</b></span>
							 	</c:if>
							 	<c:if test="${list.cpyState==2}">
							 		<span class="tree-3"><b>${list.cpyName}</b></span>
							 	</c:if>
							 	<c:if test="${list.cpyState==3}">
							 		<span class="tree-4"><b>${list.cpyName}</b></span>
							 	</c:if>
							</a>
					 	</c:if>	
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>信息工程学院 </summary>
		<div>
			<details>
			<c:forEach var="list" items="${empList}">
				 	<c:if test="${list.empNo eq '202002'}">
						<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=2">更多</a></summary>
					</c:if>	
			 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 2}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>电气工程学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202003'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=3">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 3}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
  
  <details>
		<summary>机电工程学院</summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202004'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=4">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 4}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>运输物流学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202005'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=5">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 5}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>外语商贸学院</summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202006'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=6">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 6}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>创新创业学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202007'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=7">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 7}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>国际合作学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202008'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=8">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 8}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>马克思主义学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202009'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 9}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>继续教育学院</summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202010'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=10">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 10}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>铁道工程学院 </summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202011'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=11">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 11}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
	<details>
		<summary>实训中心</summary>
		<div>
			<details>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202012'}">
							<summary>管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=12">更多</a></summary>
						</c:if>	
				 </c:forEach>
				<div>
					<c:forEach var="list"  items="${addLists}">
				 	<c:if test="${list.schoolId eq 12}">
				 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
						 	<c:if test="${list.cpyState==0}">
						 		<span class="tree-1"><b>${list.cpyName}</b></span>	
						 	</c:if>
						 	<c:if test="${list.cpyState==1}">
						 		<span class="tree-2"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==2}">
						 		<span class="tree-3"><b>${list.cpyName}</b></span>
						 	</c:if>
						 	<c:if test="${list.cpyState==3}">
						 		<span class="tree-4"><b>${list.cpyName}</b></span>
						 	</c:if>
						</a>
				 	</c:if>	 
				 	</c:forEach>
				</div>
			</details>
		</div>
	</details>
	
  </div>
  
  
    <!--     /////////////////////////       -->
    
    
    
     
<div class="searchBox md">
     <form id="qryform" action="<%=request.getContextPath() %>/queryQy.do" method="post">
			企业名称：<input type="text" id="cpyName" name="cpyName" class="input-1" value="${cpyName}" placeholder="输入企业名称">
		<select id="cpyState" name="cpyState"  class="period">
			<option value="6" >全部</option>
			<option value="0">成长期企业</option>
			<option value="1">成熟期企业</option>
			<option value="2">结果期企业</option>
			<option value="3">创新转型期企业</option>
		</select>
		<input class="btnSearch" type="submit" value="搜索"><a class="btnAdd" href="addQyInfo.jsp">添加企业</a>
	</form>
</div>

<div class="collegeBox">
<div class="row md">
 <dl>
 	<dt>机车车辆学院
 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 1}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=1">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span>
 	</dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 1}">
 	    <a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>	
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>
		</a>
 	</c:if>	 
 	</c:forEach> 
 	</dd>	
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=1">查看所有企业</a></span></div>
 </dl>	
 <dl>
 	<dt>信息工程学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 2}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=2&cpyName=${cpyName}">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 2}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>		
		 	</a>  
 	</c:if>
 	</c:forEach> 
 	</dd>		
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=2">查看所有企业</a></span></div>
 </dl>	
  <dl>
 	<dt>电气工程学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 3}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=3">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 3}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if> 
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=3">查看所有企业</a></span></div>
 </dl>
</div>
<div class="row md">
<dl>
 	<dt>机电工程学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 4}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=4">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 4}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>	 
		 	</a>
 	</c:if>
 	</c:forEach>
 	 </dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=4">查看所有企业</a></span></div>
 </dl>
  <dl>
 	<dt>运输物流学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 5}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=5">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 5}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>	 
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=5">查看所有企业</a></span></div>
 </dl>
  <dl>
 	<dt>外语商贸学院  	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 6}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=6">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 6}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>	 
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=6">查看所有企业</a></span></div>
 </dl>
</div>
<div class="row md">
<dl>
 	<dt>创新创业学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 7}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=7">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 7}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if> 	
		 	</a> 
 	</c:if>
 	</c:forEach> 
 	</dd>	
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=7">查看所有企业</a></span></div>
 </dl>	
 <dl>
 	<dt>国际合作学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 8}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=8">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 8}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=8">查看所有企业</a></span></div>
 </dl>
  <dl>
 	<dt>马克思主义学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 9}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 9}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">查看所有企业</a></span></div>
 </dl>
</div>
<div class="row md">
<dl>
	 	<dt>继续教育学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 10}">
 		总共加入<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=10">${list.other1}</a>家企业
 	</c:if>
 	</c:forEach>
 	</span></dt>
	 	<dd>
	 	<c:forEach var="list"  items="${addLists}">
	 	<c:if test="${list.schoolId eq 10}">
	 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
			 	<c:if test="${list.cpyState==0}">
			 		<span class="tree-1"><b>${list.cpyName}</b></span>
			 	</c:if>
			 	<c:if test="${list.cpyState==1}">
			 		<span class="tree-2"><b>${list.cpyName}</b></span>
			 	</c:if>
			 	<c:if test="${list.cpyState==2}">
			 		<span class="tree-3"><b>${list.cpyName}</b></span>
			 	</c:if>
			 	<c:if test="${list.cpyState==3}">
			 		<span class="tree-4"><b>${list.cpyName}</b></span>
			 	</c:if>
		</a>	 
	 	</c:if>
	 	</c:forEach> 	
	 	</dd>
	 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=10">查看所有企业</a></span></div>	

	 </dl>
	 
	 <dl>
 	<dt>铁道工程学院 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 11}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 11}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">查看所有企业</a></span></div>
 </dl>
 <dl>
 	<dt>实训中心 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 12}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">总共加入${list.other1}家企业</a>
 	</c:if>
 	</c:forEach>
 	</span></dt>
 	<dd>
 	<c:forEach var="list"  items="${addLists}">
 	<c:if test="${list.schoolId eq 12}">
 	<a href="<%=request.getContextPath() %>/queryQyById.do?cpyId=${list.cpyId}">
		 	<c:if test="${list.cpyState==0}">
		 		<span class="tree-1"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==1}">
		 		<span class="tree-2"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==2}">
		 		<span class="tree-3"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	<c:if test="${list.cpyState==3}">
		 		<span class="tree-4"><b>${list.cpyName}</b></span>
		 	</c:if>
		 	</a>
 	</c:if>
 	</c:forEach>
 	</dd>
 	<div class="ct"><span class="readMore"><a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">查看所有企业</a></span></div>
 </dl>
</div>

</div>
<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>
  </body>
</html>
