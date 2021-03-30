package com.bky.service;

import java.util.List;

import com.bky.model.Add;
import com.bky.model.QyCompany;
import com.bky.model.QyJob;
import com.bky.model.QyPerson;
import com.bky.model.UstEmp;

public interface BaseService {
	
	String addInfo(Add addInfo);
	
	String deleteZp(String cpyId);

	String insertZp(QyJob qjob);
	
	List<Add> getAll();
	
	List<QyCompany> getAllCompany();
	
	List<QyCompany> getCompanySid(QyCompany qyc);	
	
	String delete(String id);
	
	Add findById(String id);
	
	String update(Add addInfo);
	
	List<QyCompany> queryQy(QyCompany qcy);
	
	List<QyCompany> getTotal();
	
	List<QyCompany> getEmpQY();			//添加调用函数
	   
	QyCompany getDetail(String cpyId);
	
    QyPerson qryQyEmp(String pId);

	List<QyJob>  zpQy(String cpyId);
	
	UstEmp loginSys(UstEmp ust);
	
	String passwdModify(UstEmp ust);
	
	String addQyInfo(QyCompany qyc);
	
	String addQyEmp(QyPerson qpn);
	
	String addQyZp(QyJob qjb);
	
	String mdfQyDes(QyCompany qyc);
	
	String mdfQyEmp(QyPerson qyn);
	
	String mdfQyZp(QyJob qjb);

	List<UstEmp> getAllEmp();

}
