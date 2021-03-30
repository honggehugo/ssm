package com.bky.dao;

import java.util.List;

import com.bky.model.Add;
import com.bky.model.QyCompany;
import com.bky.model.QyJob;
import com.bky.model.QyPerson;
import com.bky.model.UstEmp;

public interface AddMapper {
    int deleteByPrimaryKey(String id);
    
    int deleteZp(String cpyId);

    int insert(Add record);

    int insertZp(QyJob qjob);
    
    int insertSelective(Add record);

    Add selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Add record);

    int updateByPrimaryKey(Add record);
    
    List<Add> getAll();
    
    List<QyCompany> getAllCompany();
    
    List<QyCompany> getCompanySid(QyCompany qyc);
    
    List<QyCompany> queryQy(QyCompany qcy);
    
    List<QyCompany> getTotal();
    
    List<QyCompany> getEmpQY();	//添加调用函数
    
    QyCompany getDetail(String cpyId);
    
    QyPerson qryQyEmp(String pId);
    
    List<QyJob> zpQy(String cpyId);
    
    UstEmp loginSys(UstEmp up);
    
	int passwdModify(UstEmp ust);
	
	int addQyInfo(QyCompany qyc);
	
	int addQyEmp(QyPerson qpn);
	
	int addQyZp(QyJob qjb);
	
	int mdfQyDes(QyCompany qyc);
	
	int mdfQyEmp(QyPerson qyn);
	
	int mdfQyZp(QyJob qjb);

	List<UstEmp> getAllEmp();
}