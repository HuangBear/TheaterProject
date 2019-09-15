package com.web.dao;

import java.util.List;

import com.web.entity.EmployeeBean;

public interface EmployeeDao {
	// new
	int saveEmployee(EmployeeBean Employee);

	// disable
	int deleteEmployeeByNo(Integer EmployeeNo);

	int deleteEmployeeById(String EmployeeId);

	int deleteAll();

	// update
	int updateEmployee(EmployeeBean Employee);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	EmployeeBean checkEmpEmail(String email);

	EmployeeBean getEmployeeByNo(Integer EmployeeNo);

	EmployeeBean getEmployeeByEmail(String email);

	EmployeeBean getEmployeeByEmailPassword(String email,String password);
	
	EmployeeBean getEmployeeById(String EmployeeId);

	List<EmployeeBean> getAllEmployees();

	List<EmployeeBean> getAllAvailable();
	
//	List<EmployeeBean> getPermissionByEmpEmail(String email);
	
	Object getPermissionByEmpEmail(String email);
}
