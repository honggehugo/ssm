package com.bky.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bky.model.Add;
import com.bky.model.QyCompany;
import com.bky.model.QyJob;
import com.bky.model.QyPerson;
import com.bky.model.UstEmp;
import com.bky.service.BaseService;
import com.bky.util.QSUtil;

@Controller
public class BaseController {
	
	private BaseService baseService;	
	public BaseService getBaseService() {
		return baseService;
	}
	@Autowired
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	
	//添加企业
	@SuppressWarnings("finally")
	@RequestMapping("addQyInfo")
	public String addQyInfo(QyCompany qyc,HttpServletRequest request){
		//String schoolId = request.getParameter("schoolId")==null?"":request.getParameter("schoolId").toString().trim();
		String schoolId = qyc.getSchoolId()==null?"":qyc.getSchoolId().toString().trim();
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			qyc.setEmpNo(ustEmpNo); //设置字段的值
			System.out.println(qyc.getEmpNo());
			String str = baseService.addQyInfo(qyc);
			System.out.println(str);
			//addQyInfo
			request.setAttribute("empNo", qyc.getEmpNo());
			request.setAttribute("cpyName", qyc.getCpyName());
			request.setAttribute("cpyDesc", qyc.getCpyDesc());		
			request.setAttribute("cpyState", qyc.getCpyState());	
			request.setAttribute("schoolId", qyc.getSchoolId());			
			request.setAttribute("InfoMessage", str);
			if("0001".equals(schoolId)||"0000".equals(schoolId)){
				return this.getCompanyInfoAll(request);
			}else{
				QyCompany qc = new QyCompany();
				qc.setSchoolId(schoolId);
				List<QyCompany> list = baseService.queryQy(qc);

				List<QyCompany> listn = new ArrayList<QyCompany>(); 
				for(int i=0;i<list.size();i++){
					String sName = "";
					String cName = "";
					QyCompany qy = (QyCompany)list.get(i);
					//list.remove(i);
					String sid = qy.getSchoolId()==null?"1":qy.getSchoolId().toString().trim();
					String cte = qy.getCpyState()==null?"0":qy.getCpyState().toString().trim();
					sName = transtXy(sid);
					cName = transtZt(cte);
					qy.setOther3(sName);
					qy.setOther2(cName);
					listn.add(qy);
				}

				//System.out.println(list);
				request.setAttribute("dptno", schoolId);
				request.setAttribute("addLists", listn);
				return "companyList";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ErrMessage", "添加信息失败！");
			return "companyList";
		}
	}
	
	
	//返回首页
	@RequestMapping("getAllCompany")
	public String getCompanyInfoAll(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			QyCompany qyc = new QyCompany();
			List<QyCompany> lst = getTotalInfo(request);
			List<QyCompany> list = baseService.getAllCompany();
			List<QyCompany> list_sid = baseService.getCompanySid(qyc);
			
			System.out.println(list);
			request.setAttribute("addLists", list);
			request.setAttribute("showLists", lst);
			request.setAttribute("sidLists", list_sid);
			
			return "listCompany";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败,请重试！");
			return "listCompany";
		}
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping("addQyEmp")
	public String addQyEmp(QyPerson qpn,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			System.out.println(qpn.getPsnName());
			String str = baseService.addQyEmp(qpn);
			System.out.println(str);
			request.setAttribute("InfoMessage", str);
			return str;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
			return "";
		} 
	}

	//获取企业总数，返回四个状态企业列表
	public List<QyCompany> getTotalInfo(HttpServletRequest request){
		List<QyCompany> lst = baseService.getTotal();

		//cpyState other1
		int totalCpy=0;
		for(int i=0;i<lst.size();i++){
			QyCompany qy = lst.get(i);		//企业状态类
			System.out.println(qy.getCpyState() +"          "+qy.getOther1());//该状态企业的个数
			if(qy.getCpyState().toString().trim().equals("0")){
				qy.setOther2("成长期企业");
			}else if(qy.getCpyState().toString().trim().equals("1")){
				qy.setOther2("成熟期企业");
			}else if(qy.getCpyState().toString().trim().equals("2")){
				qy.setOther2("结果期企业");
			}else if(qy.getCpyState().toString().trim().equals("3")){
				qy.setOther2("创新转型期企业");
			}
			totalCpy = totalCpy + Integer.parseInt(qy.getOther1());//计算企业总数
		}
		System.out.println("企业总数totalCpy="+totalCpy);
		request.setAttribute("totalCpy", totalCpy);
		return lst;
	}
	
	
	//企业信息
	@RequestMapping("queryQy")
	public String queryQy(@ModelAttribute QyCompany qyc,HttpServletRequest request){
		try {
			//用户编号
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			List<QyCompany> lst = getTotalInfo(request);//四个企业状态
			List<QyCompany> list = baseService.queryQy(qyc);//所有企业信息
			List<UstEmp> elist = baseService.getAllEmp();//所有管理员的信息
			
			List<QyCompany> list_sid = baseService.getCompanySid(qyc);//有企业加入的学院id和企业个数
			String cpyName = qyc.getCpyName();
			String cpyState = qyc.getCpyState();
			request.setAttribute("cpyState", cpyState);
			request.setAttribute("cpyName", cpyName);
			request.setAttribute("sidLists", list_sid);
			request.setAttribute("empList", elist);
			request.setAttribute("addLists", list);
			request.setAttribute("showLists", lst);
			return "listCompany";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败！具体异常信息：" + e.getMessage());
			return "listCompany";
		}
	}
	
	@RequestMapping("queryQyList")
	public String queryQyList(@ModelAttribute QyCompany qyc,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String dptno = request.getParameter("dptno")==null?"":request.getParameter("dptno").toString().trim();
			if(dptno != "" &&  !"0001".equals(dptno) && !"0000".equals(dptno)){
				qyc.setSchoolId(dptno);
			}
			if(dptno != ""){
				request.setAttribute("dptno", dptno);
			}else{
				request.setAttribute("dptno", "0001");
			}
			//List<QyCompany> lst = getTotalInfo(request);
			request.setAttribute("cName", qyc.getCpyName());
			request.setAttribute("cState", qyc.getCpyState()==null?"":qyc.getCpyState());
			List<QyCompany> list = baseService.queryQy(qyc);
			System.out.println(list);
			//QyCompany qcy = list.get(0);
			List<QyCompany> listn = new ArrayList<QyCompany>(); 
			//request.setAttribute("showLists", lst);
			//request.setAttribute("qcy", qcy);
			for(int i=0;i<list.size();i++){
				String sName = "";
				String cName = "";
				QyCompany qy = (QyCompany)list.get(i);
				//list.remove(i);
				String sid = qy.getSchoolId()==null?"1":qy.getSchoolId().toString().trim();
				String cte = qy.getCpyState()==null?"0":qy.getCpyState().toString().trim();
				sName = transtXy(sid);
				cName = transtZt(cte);
				qy.setOther3(sName);
				qy.setOther2(cName);
				listn.add(qy);
			}	
			//request.setAttribute("dptno", "0001");
			request.setAttribute("addLists", listn);
			return "companyList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败，请重试！");
			request.setAttribute("dptno", "0001");
			return "companyList";
		}
	}
	
	@RequestMapping("QyListQry")
	public String QyListQry(@ModelAttribute QyCompany qyc,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			//List<QyCompany> lst = getTotalInfo(request);
			QyCompany qcy = new QyCompany();
			String cpyState = request.getParameter("cpyState")==null?"":request.getParameter("cpyState").toString().trim();
			String schoolId = request.getParameter("schoolId")==null?"0001":request.getParameter("schoolId").toString().trim();
			String cpyName = request.getParameter("cpyName")==null?"":request.getParameter("cpyName").toString().trim();
			request.setAttribute("cpyName", cpyName);
			request.setAttribute("dptno", schoolId);
			//String cpyName = new String(request.getParameter("cpyName").getBytes("iso-8859-1"), "utf-8")==null?"":new String(request.getParameter("cpyName").getBytes("iso-8859-1"), "utf-8").toString().trim();
			String cpyId="";
			System.out.println("cpyState=="+cpyState+"schoolId=="+schoolId+"cpyName=="+cpyName);
			qcy.setSchoolId(schoolId);
			qcy.setCpyState(cpyState);
			qcy.setCpyName(cpyName);
			qcy.setCpyId(cpyId);
			System.out.println("qcy.getCpyName=================================="+qcy.getCpyName());
			List<QyCompany> list = baseService.queryQy(qyc);
			
			List<QyCompany> listn = new ArrayList<QyCompany>(); 
			for(int i=0;i<list.size();i++){
				String sName = "";
				String cName = "";
				QyCompany qy = (QyCompany)list.get(i);
				//list.remove(i);
				String sid = qy.getSchoolId()==null?"1":qy.getSchoolId().toString().trim();
				String cte = qy.getCpyState()==null?"0":qy.getCpyState().toString().trim();
				sName = transtXy(sid);
				cName = transtZt(cte);
				qy.setOther3(sName);
				qy.setOther2(cName);
				listn.add(qy);
			}
			
			//System.out.println(list);
			request.setAttribute("addLists", listn);
			return "companyList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败，请重试！");
			return "companyList";
		}
	}	
	
	//获取企业详细信息
	@RequestMapping("queryQyById")
	public String queryQyById(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";	
			}
			//List<QyCompany> lst = getTotalInfo(request);
			QyCompany qyc = new QyCompany();
			String cpyId = request.getParameter("cpyId")==null?"":request.getParameter("cpyId").toString().trim();//
			if("".equals(cpyId)){
				cpyId = request.getAttribute("cpyId")==null?"":request.getAttribute("cpyId").toString().trim();//
			}
			System.out.println("cpyId===="+cpyId);
			qyc.setCpyId(cpyId);
			
			
			List<QyCompany> list = baseService.queryQy(qyc);			
			if(list.size() > 0){
				QyCompany qcy = list.get(0);
				String decn = qcy.getCpyDecn()==null?"":qcy.getCpyDecn().toString().trim();
				if("".equals(decn)){
					qcy.setCpyDecn("请添加企业决策信息");
				}
				request.setAttribute("qcy", qcy);
				
				String ceoid = qcy.getCeoid()==null?"":qcy.getCeoid().toString().trim();
				String manager1 = qcy.getManager1()==null?"":qcy.getManager1().toString().trim();
				String manager2 = qcy.getManager2()==null?"":qcy.getManager2().toString().trim();
				String manager3 = qcy.getManager3()==null?"":qcy.getManager3().toString().trim();
				String executor1 = qcy.getExecutor1()==null?"":qcy.getExecutor1().toString().trim();
				String executor2 = qcy.getExecutor2()==null?"":qcy.getExecutor2().toString().trim();
				if(!"".equals(ceoid)){
					QyPerson qyn = baseService.qryQyEmp(ceoid);
					request.setAttribute("ceo", qyn);
				}if(!"".equals(manager1)){
					QyPerson qyn = baseService.qryQyEmp(manager1);
					request.setAttribute("manager1", qyn);
				}if(!"".equals(manager2)){
					QyPerson qyn = baseService.qryQyEmp(manager2);
					request.setAttribute("manager2", qyn);
				}if(!"".equals(manager3)){
					QyPerson qyn = baseService.qryQyEmp(manager3);
					request.setAttribute("manager3", qyn);
				}if(!"".equals(executor1)){
					QyPerson qyn = baseService.qryQyEmp(executor1);
					request.setAttribute("executor1", qyn);
				}if(!"".equals(executor2)){
					QyPerson qyn = baseService.qryQyEmp(executor2);
					request.setAttribute("executor2", qyn);
				}
			
				List<QyJob> qjb = baseService.zpQy(cpyId);
				request.setAttribute("qjbList", qjb);
				QyJob stuinfo = qjb.get(qjb.size()-1);
				
				request.setAttribute("stuInfo", stuinfo);
				
				
			}else{
				request.setAttribute("InfoMessage", "查询出错！");
				//return "result";
			}
			return "mdfQy";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "mdfQy";
		}
	}
	
	//登录
	@SuppressWarnings("finally")
	@RequestMapping("loginSys")
	public String loginSys(@ModelAttribute UstEmp up,HttpServletRequest request){
		QyCompany qyc = new QyCompany();
		try {
			String lpd = up.getEmpPasswd()==null?"":up.getEmpPasswd().toString().trim();//获取前端密码数据
			UstEmp utp = baseService.loginSys(up);//获取数据库数据
			if (utp != null){
				String dpd = utp.getEmpPasswd()==null?"":utp.getEmpPasswd().toString().trim();//数据库密码数据
				String dpid = utp.getDptNo()==null?"":utp.getDptNo().toString().trim();//数据库学院id
				if(lpd.equals(dpd)){
					System.out.println("用户密码验证成功！");
					//return "listCompany";
					//qyc = new QyCompany();
					request.setAttribute("empNo", up.getEmpNo());
					request.getSession().setAttribute("empNo", up.getEmpNo());
					request.getSession().setAttribute("empName", utp.getEmpName());
					request.getSession().setAttribute("ustId", utp.getDptNo());
					request.getSession().setAttribute("dptNo", utp.getDptNo());
					//request.getSession().setAttribute("cpyName", qyc.getCpyName());
					
					if("0001".equals(dpid)||"0000".equals(dpid)){
						return this.queryQy(qyc, request);	
					}else{
						qyc.setSchoolId(utp.getDptNo());
						
						List<QyCompany> list = baseService.queryQy(qyc);//获取数据库该学院的各企业信息
						
						List<QyCompany> listn = new ArrayList<QyCompany>(); 
						for(int i=0;i<list.size();i++){
							String sName = "";
							String cName = "";
							QyCompany qy = (QyCompany)list.get(i);
							//list.remove(i);
							String sid = qy.getSchoolId()==null?"1":qy.getSchoolId().toString().trim();
							String cte = qy.getCpyState()==null?"0":qy.getCpyState().toString().trim();
							sName = transtXy(sid);//学院名
							cName = transtZt(cte);//企业状态
							qy.setOther3(sName);
							qy.setOther2(cName);
							request.getSession().setAttribute("loginSchoolName", sName);
							listn.add(qy);
						}
						
						request.setAttribute("addLists", listn);
						System.out.println("loginSys得到该用户的企业信息："+listn.get(0).getCpyName()+listn.get(1).getCpyName());
						request.setAttribute("dptno", utp.getDptNo());
						//request.setAttribute("addLists", list);
						return "companyList";
					}			
					//return this.queryQy(qyc, request);
				}else{
					System.out.println("工号或密码错误,请检查！");
					request.setAttribute("msgInfo", "工号或密码错误,请检查！");
					return "login";
				}
			}else{
				System.out.println("工号未维护,请联系管理员！");
				request.setAttribute("msgInfo", "工号未维护,请联系管理员！");
				return "login";
			}
			//request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msgInfo", "登录失败请重试！");
			return "login";
		} 
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("getTotal")
	public String getTotal(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			List<QyCompany> list = baseService.getTotal();
			return "listCompany";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败，请重试！");
			return "listCompany";
		} 
	}
	
	
	
	//获取企业信息
	@SuppressWarnings("finally")
	@RequestMapping("getEmpQY")
	public String getEmpQY(@ModelAttribute UstEmp up,HttpServletRequest request){
		try {
			QyCompany qyc = new QyCompany();
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			
			qyc.setSchoolId("1");
			List<QyCompany> list = baseService.queryQy(qyc);//获取数据库该学院企业
			
			List<QyCompany> listn = new ArrayList<QyCompany>(); //实例对象
			for(int i=0;i<list.size();i++){
				String sName = "";
				String cName = "";
				QyCompany qy = (QyCompany)list.get(i);
				//list.remove(i);
				String sid = qy.getSchoolId()==null?"1":qy.getSchoolId().toString().trim();
				String cte = qy.getCpyState()==null?"0":qy.getCpyState().toString().trim();
				sName = transtXy(sid);
				cName = transtZt(cte);
				qy.setOther3(sName);
				qy.setOther2(cName);
				request.getSession().setAttribute("loginSchoolName", sName);
				listn.add(qy);
			}
			
			request.setAttribute("addLists", listn);
			System.out.println("loginSys的listn："+listn);
			request.setAttribute("dptno", up.getDptNo());
			//request.setAttribute("addLists", list);
			return "companyList";
			//request.setAttribute("dptno", utp.getDptNo());
			//request.setAttribute("addLists", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败，请重试！");
			return "companyList";
		}
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping("getDetail")
	public String getDetail(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cpyId = request.getParameter("cpyId")==null?"":request.getParameter("cpyId").trim();
			QyCompany qcy = baseService.getDetail(cpyId);
			return "listCompany";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询信息失败！");
			return "listCompany";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("zpQy")
	public String zpQy(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cId = request.getParameter("cid")==null?"":request.getParameter("cid").toString().trim();
			String cName = new String(request.getParameter("cName").getBytes("iso-8859-1"), "utf-8")==null?"":new String(request.getParameter("cName").getBytes("iso-8859-1"), "utf-8").toString().trim();
			request.setAttribute("cId", cId);
			request.setAttribute("cName", cName);
			List<QyJob> qjb = baseService.zpQy(cId);
			request.setAttribute("qjbList", qjb);
			return "mdfQyZp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "查询企业招聘信息失败，请重试！");
			return "mdfQyZp";
		} 
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addZp")
	public String addZp(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cid = request.getParameter("cid")==null?"":request.getParameter("cid").toString().trim();
			String cName = new String(request.getParameter("cName").getBytes("iso-8859-1"), "utf-8")==null?"":new String(request.getParameter("cName").getBytes("iso-8859-1"), "utf-8").toString().trim();
			request.setAttribute("cId", cid);
			request.setAttribute("cName", cName);
			return "mdfQyZp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "出错了，请重试！");
			return "mdfQyZp";
		} 
	}
	
	@RequestMapping("modify")
	public String modify(String tid,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			Add add = baseService.findById(tid);
			request.setAttribute("add", add);
			return "modify";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "修改信息失败！");
			return "modify";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("passwdModify")
	public String passwdModify(@ModelAttribute UstEmp up, Model model,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			//model.addAttribute("up", up);
			String pwd = up.getEmpPasswd()==null?"":up.getEmpPasswd().toString().trim();
			String pwd1 = up.getOther2()==null?"":up.getOther2().toString().trim();
			String pwd2 = up.getOther3()==null?"":up.getOther3().toString().trim();
			//先检查原密码是否正确
			UstEmp utp = baseService.loginSys(up);
			if (utp != null){
				String dpd = utp.getEmpPasswd()==null?"":utp.getEmpPasswd().toString().trim();
				if(pwd.equals(dpd)){
					System.out.println("用户密码验证成功！");
					//检查密码是否一致
					if(pwd1.equals(pwd2)){
						up.setEmpPasswd(pwd1);
						String str = baseService.passwdModify(up);
						request.setAttribute("InfoMessage", "密码已成功修改请重新登录！");
						return this.loginout(request);
						//return "listCompany";
					}else{
						System.out.println("密码二次输入不一致！");
						request.setAttribute("InfoMessage", "密码二次输入不一致！");
						return "mdfUserPass";
					}
					
				}else{
					System.out.println("工号或密码错误！");
					request.setAttribute("InfoMessage", "原密码错误，请检查。");
					return "mdfUserPass";
				}
			}else{
				System.out.println("工号未维护!");
				request.setAttribute("InfoMessage", "工号未维护!");
				return "mdfUserPass";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！请检查原密码是否正确。" );
			return "mdfUserPass";
		}
	}
	
	//修改企业数据
	@SuppressWarnings("finally")
	@RequestMapping("mdfQyDes")
	public String mdfQyDes(@ModelAttribute QyCompany qyc,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cId = qyc.getCpyId()==null?"":qyc.getCpyId().toString().trim();
			request.setAttribute("cpyId", cId);
			//String cdn = qyc.getCpyDecn()==null?"":qyc.getCpyDecn().toString().trim();		
			if (!"".equals(cId)){
				baseService.mdfQyDes(qyc);
				QyCompany qcy = baseService.getDetail(cId);
				request.setAttribute("qcy", qcy);
				request.setAttribute("InfoMessage", "恭喜，操作成功!");
			}else{
				System.out.println("企业id或决策信息为空!");
				request.setAttribute("ErrMessage", "企业id或决策信息为空!");	
			}
			//return "mdfQy";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ErrMessage", "更新信息失败！" );
			//return "mdfQy";
		} finally{
			return this.queryQyById(request);
			
		}
	}
	
	
	//修改企业数据
		@SuppressWarnings("finally")
		@RequestMapping("mdfQyChange")
		public String mdfQyChange(@ModelAttribute QyCompany qyc,HttpServletRequest request){
			try {
				String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
				if("".equals(ustEmpNo)){
					request.setAttribute("msgInfo", "请先登录！");
					return "login";		
				}
				String cId = qyc.getCpyId()==null?"":qyc.getCpyId().toString().trim();
				request.setAttribute("cpyId", cId);
				//String cdn = qyc.getCpyDecn()==null?"":qyc.getCpyDecn().toString().trim();		
				if (!"".equals(cId)){
					baseService.mdfQyDes(qyc);
					QyCompany qcy = baseService.getDetail(cId);
					request.setAttribute("qcyEdit", qcy);
					request.setAttribute("InfoMessage", "恭喜，操作成功!");
				}else{
					System.out.println("企业id或决策信息为空!");
					request.setAttribute("ErrMessage", "企业id或决策信息为空!");	
					
				}
				//return "mdfQy";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("ErrMessage", "更新信息失败！" );
				//return "mdfQy";
			} finally{
				return "editCont";
				
			}
		}

	@SuppressWarnings("finally")
	@RequestMapping("mdfQyEmp")
	public String mdfQyEmp(@ModelAttribute QyPerson qyn,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String pId = qyn.getPsnId()==null?"":qyn.getPsnId().toString().trim();
			String type = request.getParameter("type")==null?"":request.getParameter("type").toString().trim();
			String deal = request.getParameter("deal")==null?"":request.getParameter("deal").toString().trim();
			String cpyId = request.getParameter("cpyId")==null?"":request.getParameter("cpyId").toString().trim();
			qyn.setCpyId(cpyId);
			request.setAttribute("cpyId", cpyId);
			if (!"".equals(pId)&&"mdy".equals(deal)){
				baseService.mdfQyEmp(qyn);
				QyCompany qcy = baseService.getDetail(qyn.getCpyId());
				request.setAttribute("qcy", qcy);
				request.setAttribute("InfoMessage", "恭喜，操作成功!");
				request.setAttribute("cpyId", qyn.getCpyId());
			}else{
				System.out.println("员工id为空,新增");
				qyn.setCpyId(cpyId);
				this.addQyEmp(qyn, request);
				String id = qyn.getId();
				System.out.println("id========"+id);
				QyCompany qyc = baseService.getDetail(qyn.getCpyId());
				if("1".equals(type)){
					qyc.setCeoid(id);
				}if("2".equals(type)){
					qyc.setManager1(id);
				}if("3".equals(type)){
					qyc.setManager2(id);
				}if("4".equals(type)){
					qyc.setManager3(id);
				}if("5".equals(type)){
					qyc.setExecutor1(id);
				}if("6".equals(type)){
					qyc.setExecutor2(id);
				}
				if(qyc.getCpyState().equals("0")){
					qyc.setCpyState("1");
				}
				baseService.mdfQyDes(qyc);
				request.setAttribute("InfoMessage", "企业之树已茁壮成长，企业人员已成功维护！" );
			}
			return this.queryQyById(request);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return this.queryQyById(request);
		} 
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("loginout")
	public String loginout(HttpServletRequest request){
		try {
			request.getSession().removeAttribute("empNo");
			request.getSession().removeAttribute("ustId");
			return "login";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "login";
		} 
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("mdfQyEmpInit")
	public String mdfQyEmpInit(@ModelAttribute QyPerson qyn,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cId = request.getParameter("cpyId")==null?"":request.getParameter("cpyId").toString().trim();
			String type = request.getParameter("type")==null?"":request.getParameter("type").toString().trim();
			request.setAttribute("type", type);
			request.setAttribute("cpyId", cId);
			if (!"".equals(cId)){
				String pid="";
				QyCompany qcy = baseService.getDetail(cId);
				String ceoId = qcy.getCeoid()==null?"":qcy.getCeoid();
				String manager1 = qcy.getManager1()==null?"":qcy.getManager1();
				String manager2 = qcy.getManager2()==null?"":qcy.getManager2();
				String manager3 = qcy.getManager3()==null?"":qcy.getManager3();
				String executor1 = qcy.getExecutor1()==null?"":qcy.getExecutor1();
				String executor2 = qcy.getExecutor2()==null?"":qcy.getExecutor2();
				if("1".equals(type)){ pid = ceoId; }
				if("2".equals(type)){ pid = manager1; }
				if("3".equals(type)){ pid = manager2; }
				if("4".equals(type)){ pid = manager3; }
				if("5".equals(type)){ pid = executor1; }
				if("6".equals(type)){ pid = executor2; }
				if("1".equals(type)&&!"".equals(ceoId)||"2".equals(type)&&!"".equals(manager1)||"3".equals(type)&&!"".equals(manager2)||
						"4".equals(type)&&!"".equals(manager3)||"5".equals(type)&&!"".equals(executor1)||"6".equals(type)&&!"".equals(executor2)){
					qyn = baseService.qryQyEmp(pid);
					request.setAttribute("qyn", qyn);
					request.setAttribute("deal", "mdy");
				}else{
					request.setAttribute("deal", "add");
				}
			}else{
				System.out.println("公司id为空!");
				request.setAttribute("ErrMessage", "公司id为空!");
			}
			return "mdfQyEmp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ErrMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "mdfQyEmp";
		} 
	}
	
	
	/*
	@SuppressWarnings("finally")
	@RequestMapping("mdfQyEmpInit")
	public String mdfQyEmpInit(@ModelAttribute QyPerson qyn,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String cId = request.getParameter("cpyId")==null?"":request.getParameter("cpyId").toString().trim();
			String type = request.getParameter("type")==null?"":request.getParameter("type").toString().trim();
			request.setAttribute("type", type);
			request.setAttribute("cpyId", cId);
			if (!"".equals(cId)){
				String pid="";
				QyCompany qcy = baseService.getDetail(cId);
				String ceoId = qcy.getCeoid()==null?"":qcy.getCeoid();
				String manager1 = qcy.getManager1()==null?"":qcy.getManager1();
				String manager2 = qcy.getManager2()==null?"":qcy.getManager2();
				String manager3 = qcy.getManager3()==null?"":qcy.getManager3();
				String executor1 = qcy.getExecutor1()==null?"":qcy.getExecutor1();
				String executor2 = qcy.getExecutor2()==null?"":qcy.getExecutor2();
				if("1".equals(type)){ pid = ceoId; }
				if("2".equals(type)){ pid = manager1; }
				if("3".equals(type)){ pid = manager2; }
				if("4".equals(type)){ pid = manager3; }
				if("5".equals(type)){ pid = executor1; }
				if("6".equals(type)){ pid = executor2; }
				if("1".equals(type)&&!"".equals(ceoId)||"2".equals(type)&&!"".equals(manager1)||"3".equals(type)&&!"".equals(manager2)||
						"4".equals(type)&&!"".equals(manager3)||"5".equals(type)&&!"".equals(executor1)||"6".equals(type)&&!"".equals(executor2)){
					qyn = baseService.qryQyEmp(pid);
					request.setAttribute("qyn", qyn);
					request.setAttribute("deal", "mdy");
				}else{
					request.setAttribute("deal", "add");
				}
			}else{
				System.out.println("公司id为空!");
				request.setAttribute("ErrMessage", "公司id为空!");
			}
			return "mdfQyEmp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ErrMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "mdfQyEmp";
		} 
	}
	
	*/

	@SuppressWarnings("finally")
	@RequestMapping("mdfQyZp")
	public String mdfQyZp(@ModelAttribute QyJob qjb,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			//2019,2014
			String cId = qjb.getCpyId()==null?"":qjb.getCpyId().toString().trim();	
			String cName = qjb.getOther1()==null?"":qjb.getOther1().toString().trim();	
			String jobYear = qjb.getJobYear()==null?"":qjb.getJobYear().toString().trim();	
			String jobNum = qjb.getJobNum()==null?"":qjb.getJobNum().toString().trim();	
			String gradNum = qjb.getGradNum()==null?"":qjb.getGradNum().toString().trim();	
			String employNum = qjb.getEmployNum()==null?"":qjb.getEmployNum().toString().trim();	
			request.setAttribute("cId", cId);
			request.setAttribute("cName", cName);
			if(",".equals(jobYear)||",".equals(jobNum)||",".equals(gradNum)||",".equals(employNum)||"".equals(jobYear)||"".equals(jobNum)||"".equals(gradNum)||"".equals(employNum)){
				request.setAttribute("InfoMessage", "年份和招聘数量不能为空！" );
				return "mdfQyZp";
			}else{
				if (!"".equals(cId)){
					baseService.deleteZp(cId);
					String[] jobYearSub = jobYear.split(",");
					String[] jobNumSub = jobNum.split(",");
					String[] gradNumSub = gradNum.split(",");
					String[] employNumSub = employNum.split(",");
					if(jobYearSub.length!=jobNumSub.length||jobYearSub.length!=gradNumSub.length||jobYearSub.length!=employNumSub.length||jobYearSub.length==0||jobNumSub.length==0||gradNumSub.length==0||employNumSub.length==0){
						request.setAttribute("InfoMessage", "请输入完整信息！" );
						return "mdfQyZp";
					}
					for(int i=0;i<jobYearSub.length;i++){
						if(!QSUtil.isNumeric(jobYearSub[i])||!QSUtil.isNumeric(jobNumSub[i])||!QSUtil.isNumeric(gradNumSub[i])||!QSUtil.isNumeric(employNumSub[i])||"".equals(jobYearSub[i])||"".equals(jobNumSub[i])||"".equals(gradNumSub[i])||"".equals(employNumSub[i])){
							request.setAttribute("InfoMessage", "年份和招聘数量为数字，请检查！" );
							return "mdfQyZp";
						}
					}
					List<String> list =new ArrayList<String>();
					for(String jys:jobYearSub){
						if(!list.contains(jys)){
							list.add(jys);	
						}					
						else{
							request.setAttribute("InfoMessage", "年份重复，请检查！" );
							return "mdfQyZp";	
						}
					}				
					for(int i=0;i<jobYearSub.length;i++){
						QyJob qb = new QyJob();
						qb.setCpyId(cId);
						qb.setJobYear(jobYearSub[i]==null?"":jobYearSub[i]);
						qb.setJobNum(jobNumSub[i]==null?"":jobNumSub[i]);
						qb.setEmployNum(employNumSub[i]==null?"":employNumSub[i]);
						qb.setGradNum(gradNumSub[i]==null?"":gradNumSub[i]);
						baseService.insertZp(qb);	
					}
					//cId
					QyCompany qy = new QyCompany();
					qy.setCpyId(cId);
					qy.setCpyState("2");
					baseService.mdfQyDes(qy);
					request.setAttribute("InfoMessage", "企业之树已结出丰硕的果实，招聘信息已成功添加！" );
					return this.queryQyById(request);
				}else{
					System.out.println("企业id为空!");
					request.setAttribute("InfoMessage", "企业id或招聘年份为空!" );
					return "mdfQyZp";
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！" );
			return "mdfQyZp";
		} 
	}
	
	public String transtXy(String sid){
		if(sid.equals("1")){
			return "机车车辆学院";
		}
		if(sid.equals("2")){
			return "信息工程学院";
		}
		if(sid.equals("3")){
			return "电气工程学院";
		}
		if(sid.equals("4")){
			return "机电工程学院";
		}
		if(sid.equals("5")){
			return "运输物流学院";
		}
		if(sid.equals("6")){
			return "外语商贸学院";
		}
		if(sid.equals("7")){
			return "创新创业学院";
		}
		if(sid.equals("8")){
			return "国际合作学院";
		}
		if(sid.equals("9")){
			return "马克思主义学院";
		}
		if(sid.equals("10")){
			return "铁道工程学院";
		}
		if(sid.equals("11")){
			return "实训中心";
		}
		if(sid.equals("12")){
			return "继续教育学院";
		}else{
			return "其他";
		}
	}

	public String transtZt(String sid){
		if(sid.equals("0")){
			return "成长期";
		}
		if(sid.equals("1")){
			return "成熟期";
		}
		if(sid.equals("2")){
			return "结果期";
		}
		if(sid.equals("3")){
			return "转型期";
		}else{
			return "其他";
		}
	}
	
	
	
	
	@SuppressWarnings("finally")
	@RequestMapping("addQyZp")
	public String addQyZp(QyJob qjb,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			System.out.println(qjb.getCpyId());
			String str = baseService.addQyZp(qjb);
			System.out.println(str);
			request.setAttribute("InfoMessage", str);
			return "result";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
			return "result";
		} finally {			
			//return "result";
		}
	}
	
	
	@RequestMapping("getAll")
	public String getAddInfoAll(HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			List<Add> list = baseService.getAll();
			System.out.println(list);
			request.setAttribute("addLists", list);
			return "listAll";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	

	@SuppressWarnings("finally")
	@RequestMapping("update")
	public String update(Add add,HttpServletRequest request){
		try {
			String ustEmpNo = request.getSession().getAttribute("empNo")==null?"":request.getSession().getAttribute("empNo").toString().trim();
			if("".equals(ustEmpNo)){
				request.setAttribute("msgInfo", "请先登录！");
				return "login";		
			}
			String str = baseService.update(add);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "result";
		}
	}
	

	@SuppressWarnings("finally")
	@RequestMapping("del")
	public String del(String tid,HttpServletRequest request){
		try {			
			String str = baseService.delete(tid);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "result";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping("addInfo")
	public String add(Add add,HttpServletRequest request){
		try {			
			add.setId(UUID.randomUUID().toString());
			System.out.println(add.getId() + ":::::" + add.getTname() + ":::::" + add.getTpwd());
			String str = baseService.addInfo(add);
			System.out.println(str);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "result";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping("addQyInfoNew")
	public String addQyInfoNew(QyCompany qyc,HttpServletRequest request){
		try {			
			System.out.println(qyc.getCpyName());
			String str = baseService.addQyInfo(qyc);
			System.out.println(str);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "result";
		}
	}
	
	
}
