<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");//设置编码格式为中文
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<!-- ECharts单文件引入 -->
	<script src="./js/echarts.js"></script>
		<title>校企合作智能管理平台-企业详情</title>
	</head>

<body class="bgc" onload="init();">
				
	
	<!--头部-->
	<input id='zpYear' name='zpYear' type='hidden' value="${zpYear}">
	<input id='zpNum' name='zpNum' type='hidden' value="${zpNum}">
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
	<span class="s-1">企业详情</span>
	<span class="s-1">
	<c:if test="${ErrMessage!='' and ErrMessage!=null}">
	<div class="tip-1">${ErrMessage}</div>
	</c:if>
	<c:if test="${InfoMessage!=''and InfoMessage!=null}">
	<div class="tip-2">${InfoMessage}</div>
	</c:if>
	</span>
</div>
	<!--主体-->
<div class="contentBox-2">
  <h2 class="h2-1">
	  <div class="detailInf-1">
		  <c:if test="${qcy.cpyState==0}">
    			<span><img src="img/tree-1.gif" alt=""></span>成长期
    		</c:if>
    		<c:if test="${qcy.cpyState==1}">
    			<span><img src="img/tree-2.gif" alt=""></span>成熟期
    		</c:if>    	
    		<c:if test="${qcy.cpyState==2}">
    			<span><img src="img/tree-3.gif" alt=""></span>结果期
    		</c:if>
    		<c:if test="${qcy.cpyState==3}">
    			<span><img src="img/tree-4.gif" alt=""></span>创新期
    		</c:if>
				
		</div>
  	<b>${qcy.cpyName}</b><span class="s-1">广东省第一批产教融合型企业入库培育企业</span><a href="mdfQyDes.jsp?cpyId=${qcy.cpyId}&cpyName=${qcy.cpyName}&cpyDesc=${qcy.cpyDesc}&cpyDecn=${qcy.cpyDecn}&cpyNature=${qcy.cpyNature}&industry=${qcy.industry}&address=${qcy.address}&subject=${qcy.subject}&cooContent=${qcy.cooContent}&closely=${qcy.closely}&schContact=${qcy.schContact}&schPos=${qcy.schPos}&inTime=${qcy.inTime}&cpyContact=${qcy.cpyContact}&cpyTele=${qcy.cpyTele}"  class="btn-edit"></a>

  </h2>
	<div class="detailInf-2"><img src="img/${qcy.cpyImg}.jpg" alt=""><p>${qcy.cpyDesc}</p></div>
</div>
<div class="contentBox-4">
	<!--责任人列表-->
	<div class="detailInf-3">
   	<!--左边-->
		<ul class="boxLeft-2">
			<li><b>${stuInfo.jobYear}年</b></li>
			<li>
			<c:if test="${stuInfo.jobNum==null}">
    			<b>0</b>
    		</c:if> 
    		 <b>${stuInfo.jobNum}</b><span>在职实习生</span></li>
			<li>
			<c:if test="${stuInfo.gradNum==null}">
    			<b>0</b>
    		</c:if> 
    		 <b>${stuInfo.gradNum}</b><span>转正毕业生</span></li>
			<li>
			<c:if test="${stuInfo.employNum==null}">
    			<b>0</b>
    		</c:if> 
			<b>${stuInfo.employNum}</b><span>招聘人数</span></li>
		</ul>
    <!--左边 end-->
		<ul class="bigTree">
			<img src="img/bigTree.jpg" alt="">
			<li class="app app-1">总经理
				<div class="contentProcess">
	 			 <b></b>
				     <!--总经理-->
						 <div class="leaderItem">
					 		<ul>
					 		<h3 class="h3-1"><a href="<%=request.getContextPath() %>/mdfQyEmpInit.do?cpyId=${qcy.cpyId}&type=1" class="btn-edit"></a ><a href="<%=request.getContextPath() %>/mdfQyEmpInit.do?cpyId=${qcy.cpyId}&type=1" class="btn-add"></a ><span class="s-1">请维护公司分管领导</span></h3>
					 		<li><img src="img/default-1.jpg" alt=""><span class="s-2">总经理</span><br><span class="s-1">
							<c:choose>
							<c:when test="${qcy.ceoid=='' or qcy.ceoid== null}">
							请添加
							</c:when>
								<c:otherwise>
								${ceo.psnName}<c:if test="${ceo.psnSex eq 1}">【女】</c:if><c:if test="${ceo.psnSex eq 2}">【男】</c:if>
								</span><br><span class="s-2">${ceo.psnPhone}</span><div class="s-3">查看画像</div>
					 			<!--画像详情-->
								<div class="figure">
								
					 				<b></b>
					 				<div class="figureL">
					 					<span>${ceo.itsInfo1}</span><span>${ceo.itsInfo2}</span><span>${ceo.itsInfo3}</span><span>${ceo.itsInfo4}</span><span>${ceo.itsInfo5}</span>
					 				</div>
					 				<div class="figureR">
					 					<span>${ceo.itsInfo6}</span><span>${ceo.itsInfo7}</span><span>${ceo.itsInfo8}</span><span>${ceo.itsInfo9}</span><span>${ceo.itsInfo10}</span>
					 					<span>${ceo.itsInfo}</span>
					 				</div>

					 			</div>
					 			<!--画像详情 end-->
								</c:otherwise>
							</c:choose>
					 		</li>
					 		</ul>
					 	</div>
						<!--总经理 end-->
	      </div>
			</li>
			<li class="app app-2">主要产品
				<div class="contentProcess">
	 			 <b></b>
	 			 <!--主要产品-->
				 <div class="leaderItem">
			 		<ul>
			 		
			 			
			 			<h3 class="h3-1"><a href="editCont.jsp?a=products&data=${qcy.products}&cpyId=${qcy.cpyId}&isShow=edit" target="editProducts" class="btn-edit"></a ><span class="s-1">请维护公司信息</span></h3>
			 		
			 			<iframe id="myIframe" src="editCont.jsp?a=products&data=${qcy.products}&cpyId=${qcy.cpyId}&isShow=unedit" name="editProducts" width="210px" scrolling="no" frameborder="0">  </iframe>
			 			
			 			
			 			
			 		
			 		</ul>
			 	</div>
				<!--主要产品 end-->
				 
			 </div>
			</li>
			<li class="app app-3">组织架构
				<div class="contentProcess">
	 			 <b></b>
	 			 <!--主要产品-->
				 <div class="leaderItem">
			 		<ul>
			 		
			 			<h3 class="h3-1"><a href="editCont.jsp?a=organStru&data=${qcy.organStru}&cpyId=${qcy.cpyId}&isShow=edit" target="editOrganStru" class="btn-edit"></a ><span class="s-1">请维护公司信息</span></h3>
			 		
			 			<iframe id="myIframe" src="editCont.jsp?a=organStru&data=${qcy.organStru}&cpyId=${qcy.cpyId}&isShow=unedit" name="editOrganStru" width="210px" scrolling="no" frameborder="0">  </iframe>
			 			
			 		
			 		
			 		</ul>
			 	</div>
				<!--主要产品 end-->
				 
			 </div>
			</li>
			<li class="app app-4">人事主管
				<div class="contentProcess">
	 			 <b></b>
	 			 <!--主要产品-->
				 <div class="leaderItem">
			 		<ul>
			 		<h3 class="h3-1"><a href="editCont.jsp?a=personnel&data=${qcy.personnel}&cpyId=${qcy.cpyId}&isShow=edit" target="editPersonnel" class="btn-edit"></a ><span class="s-1">请维护公司信息</span></h3>
			 		
			 			<iframe src="editCont.jsp?a=personnel&data=${qcy.personnel}&cpyId=${qcy.cpyId}&isShow=unedit" name="editPersonnel" width="210px" scrolling="no" frameborder="0">  </iframe>
			 		
			 		</ul>
			 	</div>
				<!--主要产品 end-->
				 
			 </div>
			</li>
			<li class="app app-5">人力决策部门
				<div class="contentProcess">
	 			 <b></b>
	 			 <!--主要产品-->
				 <div class="leaderItem">
			 		<ul>
			 		<h3 class="h3-1"><a href="editCont.jsp?a=manDepart&data=${qcy.manDepart}&cpyId=${qcy.cpyId}&isShow=edit" target="editManDepart" class="btn-edit"></a ><span class="s-1">请维护公司信息</span></h3>
			 		
			 			<iframe src="editCont.jsp?a=manDepart&data=${qcy.manDepart}&cpyId=${qcy.cpyId}&isShow=unedit" name="editManDepart" width="210px" scrolling="no" frameborder="0">  </iframe>
			 		
			 		</ul>
			 	</div>
				<!--主要产品 end-->
				 
			 </div>
			</li>
		</ul>

		<!--右边-->
		<table border="0" class="boxRight-2">
				<!--右边--><tr><th>企业性质</th><td>${qcy.cpyNature}</td></tr>
				<tr><th>所属行业</th><td>${qcy.industry}</td></tr>
				<tr><th>公司所在地</th><td>${qcy.address}</td></tr>
				<tr><th>面向专业</th><td>${qcy.subject}</td></tr>
				<tr><th>合作内容</th><td>${qcy.cooContent}</td></tr>
				<tr><th>紧密程度</th><td>${qcy.closely}</td></tr>
				<tr><th>学校联系人</th><td>${qcy.schContact}</td></tr>
				<tr><th>职务</th><td>${qcy.schPos}</td></tr>
				<tr><th>入库时间</th><td>${qcy.inTime}</td></tr>
				<tr><th>企业联系人</th><td>${qcy.cpyContact}</td></tr>
				<tr><th>电话</th><td>${qcy.cpyTele}</td></tr>
		</table>

		<!--右边 end-->

		<!--下边 end-->
	<div class="detailInf-4">
		<h2><!-- 每年招聘情况趋势图  --><a href="<%=request.getContextPath() %>/zpQy.do?cid=${qcy.cpyId}&cName=${qcy.cpyName}" class="btnAddCom">添加招聘信息</a></h2>
		
		<div class="chart" id="main" style="width: 100%;height:600px;">
		
		<p>企业用人需求趋势图</p>
		</div>
		<div class="chart">
		
		<p>近三年营业增长示意图</p>
		</div>
	</div>



	</div>

</div>

<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>
<script type="text/javascript">

		
	 // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
	    var option = {
	    		 title: {
	    		        text: '每年招聘情况趋势图'
	    		    },
                tooltip: {
                    show: true,
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        crossStyle: {
                            color: '#999'
                        }
                    }
                },
                toolbox: {
                    feature: {
                        dataView: {show: false, readOnly: false},
                        magicType: {show: false, type: ['line', 'bar']},
                        restore: {show: false},
                        saveAsImage: {show: false}
                    }
                },
                legend: {
                    data:['每年招聘情况趋势图']
                },
                xAxis : [
                    {
                        type : 'category',
                        data : [
                       		<c:forEach var="list"  items="${qjbList}">${list.jobYear},</c:forEach>
                        ],
	                    axisPointer: {
	                        type: 'shadow'
	                    }
                    }
                ],
                yAxis : [
                    {	
                        type : 'value',
                    	min: 0,
                        max: 50,
                        interval: 5,
                        axisLabel: {
                            formatter: '{value} 人'
                        }
                    }
                ],
                series : [
                    {
                        "name":"历年招聘人数",
                        "type":"bar",
                        barWidth : 50,
                        "data":[<c:forEach var="list"  items="${qjbList}">${list.jobNum},</c:forEach>]
                    },
                    {
                        "name":"历年招聘人数",
                        "type":"line",
                        itemStyle: {
                            normal: {
                                color: '#000',
                                lineStyle:{
                                    width:5//设置线条粗细
                                }
                            }
                        },
                        //yAxisIndex: 1,
                        "data":[<c:forEach var="list"  items="${qjbList}">${list.jobNum},</c:forEach>]
                    }
                ]
            };
    
            // 为echarts对象加载数据 
            myChart.setOption(option);
	    
		function sigToDob(name){
			return name.replace(/\'/g,'"');
		}
		
	</script>
</body>
</html>
