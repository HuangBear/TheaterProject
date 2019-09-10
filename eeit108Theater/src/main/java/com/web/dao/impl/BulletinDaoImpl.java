package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;



@Repository
public class BulletinDaoImpl implements BulletinDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	public List<BulletinBean> getAllBulletin()
	{
		Session session = factory.getCurrentSession();
		List<BulletinBean> list = new ArrayList<>();
		list = session.createQuery("FROM BulletinBean").getResultList();
		//BulletinBean 要打類別名稱
		return list;
	}

	@Override
	public void saveBulletin(BulletinBean bb)
	{
		Session session = factory.getCurrentSession();
		session.save(bb);
	}

	@Override
	public void updateBulletin(BulletinBean bb)
	{
		Session session = factory.getCurrentSession();
		session.update(bb);
	}

	@Override
	public void deletecBulletin(Integer bullentin_no)
	{
		Session session = factory.getCurrentSession();
		session.delete(bullentin_no);
	}





}
