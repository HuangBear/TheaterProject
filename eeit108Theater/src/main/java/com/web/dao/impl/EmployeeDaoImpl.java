package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.EmployeeDao;
import com.web.entity.EmployeeBean;


@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	@Autowired
    SessionFactory factory;
	@Override
	public int saveEmployee(EmployeeBean Employee) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmployeeByNo(Integer EmployeeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmployeeById(String EmployeeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEmployee(EmployeeBean Employee) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int discontinueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int continueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EmployeeBean getEmployeeByNo(Integer EmployeeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeBean getEmployeeByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeBean getEmployeeById(String EmployeeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeBean> getAllEmployees() {
		 String hql = "FROM EmployeeBean";
		    Session session = null;
		    List<EmployeeBean> list = new ArrayList<>();
		    session = factory.getCurrentSession();
		    list = session.createQuery(hql).getResultList();
		    return list;
	}

	@Override
	public List<EmployeeBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

}