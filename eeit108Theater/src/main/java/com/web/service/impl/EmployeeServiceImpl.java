package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.EmployeeDao;
import com.web.entity.EmployeeBean;
import com.web.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{
@Autowired
	EmployeeDao employeeDao;
	
	@Override
	public void insertEmp(EmployeeBean empBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateEmp(EmployeeBean empBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmp(Integer no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EmployeeBean findByPrimaryKey(Integer no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@Override
	public List<EmployeeBean> getAllEmployees() {
		                     
		return employeeDao.getAllEmployees();
	}

}
