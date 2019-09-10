package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.TimeTableDao;
import com.web.entity.MovieBean;
import com.web.entity.TimeTableBean;
@Repository
public class TimeTableDaoImpl implements TimeTableDao{

	@Autowired
	SessionFactory factory;
	
	@Override
	public int saveTimeTable(TimeTableBean timeTable) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTimeTableByNo(Integer timeTableNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTimeTable(TimeTableBean timeTable) {
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
	public TimeTableBean getTimeTableByNo(Integer timeTableNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeTablesByMovie(String movieName) {
		String hql = "FROM TimeTableBean";
		Session session = null;
		List<TimeTableBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<TimeTableBean> getAllTimeTables() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TimeTableBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
