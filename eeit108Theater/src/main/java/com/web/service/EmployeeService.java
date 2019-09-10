package com.web.service;

import java.util.List;

import com.web.entity.EmployeeBean;


public interface EmployeeService {

	 void insertEmp(EmployeeBean empBean);
	 void updateEmp(EmployeeBean empBean);
	 void deleteEmp(Integer no);
	 EmployeeBean findByPrimaryKey(Integer no);
	 List<EmployeeBean> getAllEmployees();
	 
}
