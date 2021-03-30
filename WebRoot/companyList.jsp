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
    
    <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		
		<link rel="stylesheet" href="css/toPage.css">
		
		<title>校企合作智能管理平台-企业列表</title>
	</head>

<body class="bgc" onload="checkRadio();">
<script>
function checkRadio(){
	//var cst=${cState};
	var cst="成熟期";
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
	<c:if test='${addLists.size()<=6}'>
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
	</c:if>
	<c:if test='${addLists.size()>6}'>
		<div class="page_2"></div>
	</c:if>
	
	
	
	
	<!--先引入jquery-->

    <script src="js/jquery.min.js"></script>

    <!--再引入toPage.js-->

    <script type="text/javascript">
    function page_ctrl(data_obj) {

  var obj_box=(data_obj.obj_box!== undefined)?data_obj.obj_box:function () {

    return;

  };//翻页容器dom对象,必要参数

  var total_item=(data_obj.total_item!== undefined)?parseInt(data_obj.total_item):0;//数据条目总数,默认为0,组件将不加载

  var per_num=(data_obj.per_num!== undefined)?parseInt(data_obj.per_num):10;//每页显示条数,默认为10条

  var current_page=(data_obj.current_page!== undefined)?parseInt(data_obj.current_page):1;//当前页,默认为1

  var total_page=Math.ceil(total_item/per_num);//计算总页数,不足2页,不加载组件

  if(total_page<2){

    return;

  }

  //在指定容器内加载分页数据

  $(obj_box).append('<div class="page_content"></div>');

  //在指定容器内加载分页插件

  $(obj_box).append('<div class="page_ctrl"></div>');

  function page_even() {

    /*加载数据*/

    function change_content() {

      /*此处根据项目实际自行编写页面显示内容的方法,举例说明:*/

      var page_content='';//当前页内容
		
		var arr = new Array();
 
            <c:forEach items="${addLists}" var= "list">
                var module = {"cpyId":"${list.cpyId}","cpyName":"${list.cpyName}","other3":"${list.other3}","other2":"${list.other2}","cpyDesc":"${list.cpyDesc}"}
                arr.push(module)
            </c:forEach>
		
		
      for(var i=0;i<per_num;i++){
      //第1页-1  *4
		var n=(current_page-1)*per_num+i;
		if(n==${addLists.size()}){
		 break;
		}
		
        page_content+="<div class='companyItem'><a href='<%=request.getContextPath() %>/queryQyById.do?cpyId=";
        page_content+= arr[n].cpyId +"'><img src='img/defaultCompany.jpg'><div class='companyBoxR'><span class='s-1'>";
        page_content+= arr[n].cpyName +"</span><span class='s-2'>";
        page_content+= arr[n].other3 +"</span><span>";
        page_content+= arr[n].other2 +"</span>";
        if(arr[n].cpyDesc.length <= 100){
			page_content+= "<p>"+ arr[n].cpyDesc+ "</p>";
		}else{
			page_content+= "<p>"+ arr[n].cpyDesc.substring(0,100)+"......</p>";
		}
        page_content+= "</div></a></br></div>";
        
      }

      $(obj_box).children('.page_content').html(page_content);

    }

    change_content();

    var inp_val=(current_page==total_page)?1:current_page+1;//跳转页数,input默认显示值

    var append_html='<button class="prev_page">上一页</button>';

    for(var i=0;i<total_page-1;i++){

      if(total_page>8&&current_page>6&&i<current_page-3){

        if(i<2){

          append_html+='<button class="page_num">'+(i+1)+'</button>';

        }

        else if(i==2){

          append_html+='<span class="page_dot">•••</span>';

        }

      }

      else if(total_page>8&&current_page<total_page-3&&i>current_page+1){

        if(current_page>6&&i==current_page+2){

          append_html+='<span class="page_dot">•••</span>';

        }else if(current_page<7){

          if(i<8){

            append_html+='<button class="page_num">'+(i+1)+'</button>';

          }else if(i==8){

            append_html+='<span class="page_dot">•••</span>';

          }

        }

        //append_html+='<span class="page_dot">•••</span>';

      }

      else{

        if(i==current_page-1){

          append_html+='<button class="page_num current_page">'+(i+1)+'</button>';

        }

        else{

          append_html+='<button class="page_num">'+(i+1)+'</button>';

        }

      }

    }

    if(current_page==total_page){

      append_html+='<button class="page_num current_page">'+(i+1)+'</button>';

    }else{

      append_html+='<button class="page_num">'+(i+1)+'</button>';

    }

    append_html+='<button class="next_page">下一页</button><span class="page_total">共 '+total_page+' 页, 到第</span><input class="input_page_num" type="text" value="'+inp_val+'"><span class="page_text">页</span><button class="to_page_num">确定</button>';

    $(obj_box).children('.page_ctrl').append(append_html);

    if(current_page==1){

      $(obj_box+' .page_ctrl .prev_page').attr('disabled','disabled').addClass('btn_dis');

    }else{

      $(obj_box+' .page_ctrl .prev_page').removeAttr('disabled').removeClass('btn_dis');

    }

    if(current_page==total_page){

      $(obj_box+' .page_ctrl .next_page').attr('disabled','disabled').addClass('btn_dis');

    }else{

      $(obj_box+' .page_ctrl .next_page').removeAttr('disabled').removeClass('btn_dis');

    }

  }

  page_even();

  $(obj_box+' .page_ctrl').on('click','button',function () {

    var that=$(this);

    if(that.hasClass('prev_page')){

      if(current_page!=1){

        current_page--;

        that.parent('.page_ctrl').html('');

        page_even();

      }

    }

    else if(that.hasClass('next_page')){

      if(current_page!=total_page){

        current_page++;

        that.parent('.page_ctrl').html('');

        page_even();

      }

    }

    else if(that.hasClass('page_num')&&!that.hasClass('current_page')){

      current_page=parseInt(that.html());

      that.parent('.page_ctrl').html('');

      page_even();

    }

    else if(that.hasClass('to_page_num')){

      current_page=parseInt(that.siblings('.input_page_num').val());

      that.parent('.page_ctrl').html('');

      page_even();

    }

  });

}



		console.log("addLists.size():",${addLists.size()});
		
		if(${addLists.size()>6}){
				/*容器2参数*/
		
		      var obj_2={
		
		        obj_box:'.page_2',//翻页容器
		
		        total_item:${addLists.size()},//条目总数
		
		        per_num:6,//每页条目数
		
		        //current_page:8//当前页
		
		      };
				
		      /*调用分页方法,初始化数据*/
				
				console.log("addLists[0]:",${addLists[0].empNo},${addLists[0].cpyId});
		      page_ctrl(obj_2);
		}
		
    </script>
    <!--插件使用-->
<footer>
	<div class="contact">电话：020-86020034 / Fax: 020-36004211 招生就业办公室电话:86020463 / 36004159<br>
地址：广州市白云区石井街庆隆中路100号 邮政编码：510430<br>
Copyright@ 广州铁路职业技术学院 粤ICP备07015423号 粤公网安备 44011102002593号
</div>
</footer>
</body>
</html>
