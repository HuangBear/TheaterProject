package com.web.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;

@Repository
public class BulletinDaoImpl implements BulletinDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	public List<BulletinBean> getStatusBulletin() {
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		list = session.createQuery("FROM BulletinBean").getResultList();
		// BulletinBean 要打類別名稱
		return list;
	}

	@Override
	public void insertBulletin(BulletinBean bb) {
		Session session = factory.getCurrentSession();
		EmployeeBean eb = getEmployeeById(bb.getEmployeeId());
		bb.setEmployee(eb);
		session.save(bb);
	}

	public EmployeeBean getEmployeeById(Integer employeeId) {
		EmployeeBean eb = null;
		Session session = factory.getCurrentSession();
		eb = session.get(EmployeeBean.class, employeeId);
		return eb;
	}

	public BulletinBean getBulletinById(Integer bulletin_no) {
		BulletinBean bb = null;
		Session session = factory.getCurrentSession();
		bb = session.get(BulletinBean.class, bulletin_no);
		return bb;
	}

	@Override
	public void updateBulletin(BulletinBean bb) {
		Session session = factory.getCurrentSession();
		session.update(bb);
	}

	@Override
	public void deletecBulletin(Integer bullentin_no) {
		Session session = factory.getCurrentSession();
		session.delete(bullentin_no);
	}


}
