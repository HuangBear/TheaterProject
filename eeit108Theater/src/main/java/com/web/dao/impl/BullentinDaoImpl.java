package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.BullentinDao;
import com.web.entity.BullentinBean;

public class BullentinDaoImpl implements BullentinDao {

	@Autowired
	SessionFactory factory;
	@Autowired
	Session session;

	@SuppressWarnings("unchecked")
	@Override
	public List<BullentinBean> getBullentin()
	{
		List<BullentinBean> list = new ArrayList<>();
		list = session.createQuery("FROM Bullentin").getResultList();
		return list;
	}

	@Test
	@Override
	public void saveBullentin(BullentinBean bb)
	{
		session.save(bb);
	}

	@Override
	public void updateBullentin(BullentinBean bb)
	{
		
bb.getNo();

	}

	@Override
	public void deletecBullentin(Integer bullentin_no)
	{
		session.delete(bullentin_no);
	}

}
