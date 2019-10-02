package com.web.dao.impl;

import java.util.Date;
import java.util.List;

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
	
	@SuppressWarnings("unchecked")
	public List<TimeTableBean> getMovieVersion(String movieName) {
		String hql = "SELECT DISTINCT t.version FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getStartTimeByMovie(String movieName) {
		String hql = "SELECT DISTINCT t.startTime FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTheaterByMovieName(String movieName) {
		String hql = "FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<TimeTableBean> getMovieTimeByTheater(String movieName, String theater) {
		String hql = "FROM TimeTableBean t WHERE t.movieName = :mname and t.theater = :mtheater";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).setParameter("mtheater", theater).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeTableBeanByMovieName(String movieName) {
		String hql = "FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).getResultList();
		return list;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<String> getTheatersByMovieName(String movieName){
		String hql = "SELECT DISTINCT t.theater FROM TimeTableBean t WHERE t.movieName = :mname";
		List<String> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).getResultList();
		return list;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<TimeTableBean> getStartTimeByDateAndVersionAndMovie(String startDate, String version, String movieName) {
		String hql = "FROM TimeTableBean t WHERE t.startDate = :mstartDate and t.version = :mversion and t.movieName = :mmovieName";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mstartDate", startDate).setParameter("mversion", version).setParameter("mmovieName", movieName).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getVersionByMovieName(String movieName) {
		String hql = "SELECT DISTINCT t.version FROM TimeTableBean t WHERE t.movieName = :mname";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mname", movieName).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeByDateAndVersionAndMovie(String startDate, String version, String movieName) {
		String hql = "SELECT t.startTime FROM TimeTableBean t WHERE t.startDate = :mstartDate and t.version = :mversion and t.movieName = :mmovieName";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mstartDate", startDate).setParameter("mversion", version).setParameter("mmovieName", movieName).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeTableBean> getTimeNoByDateAndVersionAndMovieAndTime(String startDate, String version,
			String movieName, String startTime) {
		String hql = "SELECT t.no FROM TimeTableBean t WHERE t.startDate = :mstartDate and t.version = :mversion and t.movieName = :mmovieName and t.startTime = :mstartTime";
		List<TimeTableBean> list = factory.getCurrentSession().createQuery(hql).setParameter("mstartDate", startDate).setParameter("mversion", version).setParameter("mmovieName", movieName).setParameter("mstartTime", startTime).getResultList();
		return list;
	}
	
}

