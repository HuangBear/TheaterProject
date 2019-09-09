package com.web.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.TimeTableDao;
import com.web.entity.TimeTableBean;

public class TimeTableDaoImpl implements TimeTableDao{

	@Autowired
	SessionFactory factory;
	
	public Boolean isExist(Integer timeTableNo) {
		String hql = "FROM TimeTableBean t WHERE t.no = :tno";
		if(factory.getCurrentSession().createQuery(hql).setParameter("tno", timeTableNo).uniqueResult() == null) {
			return false;
		}
		return true;
	}
	
	@Override
	public int saveTimeTable(TimeTableBean timeTable) {
		if(isExist(timeTable.getNo())) {
			return 0;		
		}
		factory.getCurrentSession().save(timeTable);
		return 1;
	}

	@Override
	public int deleteTimeTableByNo(Integer timeTableNo) {
		if(!isExist(timeTableNo))
			return 0;
		TimeTableBean tt = new TimeTableBean();
		tt.setNo(timeTableNo);
		factory.getCurrentSession().delete(tt);
		return 1;
	}

	@Override
	public int deleteAll() {
		String hql = "DELETE TimeTableBean";
		return factory.getCurrentSession().createQuery(hql).executeUpdate();
	}

	@Override
	public int updateTimeTable(TimeTableBean timeTable) {
		if(!isExist(timeTable.getNo()))
			return 0;		
		factory.getCurrentSession().update(timeTable);
		return 1;
	}

	@Override
	public int discontinueAll() {
		String hql = "UPDATE TimeTableBean t SET t.available = :false";
		return factory.getCurrentSession().createQuery(hql).setParameter("false", Boolean.FALSE).executeUpdate();
	}

	@Override
	public int continueAll() {
		String hql = "UPDATE TimeTableBean t SET t.available = :true";
		return factory.getCurrentSession().createQuery(hql).setParameter("true", Boolean.TRUE).executeUpdate();
	
	}

	@Override
	public TimeTableBean getTimeTableByNo(Integer timeTableNo) {
		return factory.getCurrentSession().get(TimeTableBean.class, timeTableNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeTablesByMovie(String movieName) {
		String hql = "FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeTablesByMovieVersion(String movieName, String version) {
		String hql = "FROM TimeTableBean t WHERE t.movieName = :mname and t.version = :mver";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).setParameter("mvr", version).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getAllTimeTables() {
		String hql = "FROM TimeTableBean";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getAllAvailable() {
		String hql = "FROM TimeTableBean t WHERE t.available = :true";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("true", Boolean.TRUE).list();
		return list;
	}

}
