package com.web.service;

import java.util.List;

import com.web.entity.EmployeeBean;


public interface EmployeeService {

	 void insertEmp(EmployeeBean empBean);
	 void updateEmp(EmployeeBean empBean);
	 void resignEmp(EmployeeBean empBean);
	 void deleteEmp(Integer no);
	 EmployeeBean findByPrimaryKey(Integer no);
	 EmployeeBean findByEmail(String email);
	 List<EmployeeBean> getAllEmployees();
	 public EmployeeBean addEmp(String name,String email,String password,String phoneNum);
	 public Boolean checkEmpEmail(String email);
	 public Integer save(EmployeeBean empBean);
	 public EmployeeBean checkEmailPassword(String email, String password);
}
