package com.bky.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bky.dao.AddMapper;
import com.bky.model.Add;
import com.bky.model.QyCompany;
import com.bky.model.QyJob;
import com.bky.model.QyPerson;
import com.bky.model.UstEmp;
import com.bky.service.BaseService;

@Service("baseService")
public class BaseServiceImpl implements BaseService {
	
	private AddMapper addMapper;

	public AddMapper getAddMapper() {
		return addMapper;
	}
	@Autowired
	public void setAddMapper(AddMapper addMapper) {
		this.addMapper = addMapper;
	}

	@Override
	public String addInfo(Add addInfo) {
		if (addMapper.insertSelective(addInfo) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public String addQyInfo(QyCompany qyc) {
		if (addMapper.addQyInfo(qyc) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public String insertZp(QyJob qjob) {
		if (addMapper.insertZp(qjob) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}
	
	@Override
	public String addQyEmp(QyPerson qpn) {
		if (addMapper.addQyEmp(qpn) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}
	
	@Override
	public String addQyZp(QyJob qjb) {
		if (addMapper.addQyZp(qjb) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}
	
	@Override
	public List<Add> getAll() {
		return addMapper.getAll();
	}
	@Override
	public List<QyCompany> getAllCompany() {
		return addMapper.getAllCompany();
	}
	@Override
	public List<QyCompany> getCompanySid(QyCompany qyc) {
		return addMapper.getCompanySid(qyc);
	}
	
	@Override
	public List<QyCompany> queryQy(QyCompany qcy) {
		return addMapper.queryQy(qcy);
	}
	@Override
	public UstEmp loginSys(UstEmp ust) {
		return addMapper.loginSys(ust);
	}
	
	@Override
	public String deleteZp(String cpyId) {
		if (addMapper.deleteZp(cpyId) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	
	@Override
	public String delete(String id) {
		if (addMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}
	@Override
	public Add findById(String id) {
		return addMapper.selectByPrimaryKey(id);
	}
	@Override
	public String update(Add addInfo) {
		if (addMapper.updateByPrimaryKeySelective(addInfo) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	@Override
	public String passwdModify(UstEmp ust) {
		if (addMapper.passwdModify(ust) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public String mdfQyDes(QyCompany qyc) {
		if (addMapper.mdfQyDes(qyc) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	
	@Override
	public String mdfQyEmp(QyPerson qyn) {
		if (addMapper.mdfQyEmp(qyn) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	
	@Override
	public String mdfQyZp(QyJob qjb) {
		if (addMapper.mdfQyZp(qjb) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	@Override
	public List<QyCompany> getTotal() {
		return addMapper.getTotal();
	}
	@Override
	public List<QyCompany> getEmpQY() {			//添加调用函数
		return addMapper.getEmpQY();
	}
	@Override
	public List<UstEmp> getAllEmp() {			//添加调用函数
		return addMapper.getAllEmp();
	}
	@Override
	public QyCompany getDetail(String cpyId) {
		return addMapper.getDetail(cpyId);
	}
	@Override
	public QyPerson qryQyEmp(String pId) {
		return addMapper.qryQyEmp(pId);
	}
	@Override
	public List<QyJob> zpQy(String cpyId) {
		return addMapper.zpQy(cpyId);
	}
}
