package com.web.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.BullentinDao;
import com.web.entity.BullentinBean;

public class BullentinDaoImpl implements BullentinDao {

	@Autowired
	SessionFactory factory;

	@Override
	public List<Date> getStartDate()
	{
		Session session = null;
		List<Date> starList = new ArrayList<>();

		session = factory.getCurrentSession();
		List ST = session.createQuery("SELECT startDate FROM Bullentin").getResultList();

		for (Object s : ST)
		{

		}
		return starList;
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Date> getRangeDate()
//	{
//		Session session = null;
//		List<BullentinBean> listBean = new ArrayList<>();
//		List<Date> starDate = new ArrayList<>();
//		List<Date> endDate = new ArrayList<>();
//
//		session = factory.getCurrentSession();
//		listBean = session.createQuery("FROM Bullentin").getResultList();
//		for (int i = 0; i < listBean.size(); i++)
//		{
//			starDate.add(listBean.get(i).getStartDate());
//			endDate.add(listBean.get(i).getEndtDate());
//		}
//		return listDate;
//	}

	@Override
	public Integer[] getDiscont()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BullentinBean> saveBullentin()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BullentinBean> updateBullentin()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Date> getRangeDate()
	{
		// TODO Auto-generated method stub
		return null;
	}

}
