package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BullentinDao;
import com.web.entity.BullentinBean;


@Repository
public class BullentinDaoImpl implements BullentinDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	public List<BullentinBean> getAllBullentin()
	{
		Session session = factory.getCurrentSession();
		List<BullentinBean> list = new ArrayList<>();
		list = session.createQuery("FROM BullentinBean").getResultList();
		//BullentinBean 要打類別名稱
		return list;
	}

	@Override
	public void saveBullentin(BullentinBean bb)
	{
		Session session = factory.getCurrentSession();
		session.save(bb);
	}

	@Override
	public void updateBullentin(BullentinBean bb)
	{
		Session session = factory.getCurrentSession();
		session.update(bb);
	}

	@Override
	public void deletecBullentin(Integer bullentin_no)
	{
		Session session = factory.getCurrentSession();
		session.delete(bullentin_no);
	}

}
