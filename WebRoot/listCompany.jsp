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
		<title>校企合作智能管理平台</title>
		<script src="js/jquery.min.js"></script>
	</head>

<body class="bd">
<header class="header md">
	<div class="user-info"><span class="log-out"><a href="<%=request.getContextPath() %>/loginout.do">退出</a></span><a href="mdfUserPass.jsp?empNo=${sessionScope.empNo}"><span class="user">${sessionScope.empNo}</span></a></div>
</header>
<div class="home-banner md"></div>
<div class="school-inf">
	<p>广铁职院共有<span class="s1">12</span>个二级学院及单位,    共邀请<span class="s1"><a href="<%=request.getContextPath() %>/QyListQry.do">${requestScope.totalCpy}</a></span>家企业总共加入</p>
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
	<!--搜索框-->

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

	<!--搜索框 end-->
	<!--导航-->
	<div class="nav">
	<div class="navitem">机车车辆学院
    	<ul>
    		<li>
    			<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202001'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=1">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
    	</ul>
	</div>
	<div class="navitem">信息工程学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202002'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=2">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">电气工程学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202003'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=3">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">机电工程学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202004'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=4">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">运输物流学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202005'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=5">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">外语商贸学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202006'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=6">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">创新创业学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202007'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=7">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">国际合作学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202008'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=8">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">马克思主义学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202009'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">继续教育学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202010'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=10">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">铁道工程学院
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202011'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=11">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<div class="navitem">实训中心
		<ul>
			<li>
				<c:forEach var="list" items="${empList}">
					 	<c:if test="${list.empNo eq '202012'}">
							管理员：${list.empName}---<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=12">更多</a>
						</c:if>	
				 </c:forEach>
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	</div>
	<!--导航 end-->




	<!--学习列表-->
<div class="collegeBox">
<div class="row md">
 <dl>
 	<dt>机车车辆学院
 	<span>
 	<c:forEach var="list"  items="${sidLists}">
 	<c:if test="${list.schoolId eq 1}">
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=1">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=2&cpyName=${cpyName}">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=3">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=4">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=5">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=6">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=7">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=8">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=9">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=10">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=11">共${list.other1}家企业</a>
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
 		<a href="<%=request.getContextPath() %>/QyListQry.do?schoolId=12">共${list.other1}家企业</a>
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
	<!--学习列表 第二行-->
<div class="rowmd md">

</div>
	<!--学习列表 第二行 end-->
</div>
	<!--学习列表 end-->
<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>
<script>
$(".navitem").click(function(){
	$(this).toggleClass("on");
})

</script>
</body>
</html>
