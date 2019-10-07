package com.web.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.TheaterDao;
import com.web.entity.TheaterBean;

@Repository
public class TheaterDaoImpl implements TheaterDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public int save(TheaterBean tb) {
		factory.getCurrentSession().save(tb);
		return 1;
	}
	
	@Override
	public int update(TheaterBean tb) {
		factory.getCurrentSession().update(tb);
		return 1;
	}
	@Override
	public int delete(TheaterBean tb) {
		factory.getCurrentSession().delete(tb);
		return 1;
	}
	
	@Override
	public TheaterBean getTheater(String theater) {
		String hql = "FROM TheaterBean tb WHERE tb.theater = :theater";
		return (TheaterBean) factory.getCurrentSession().createQuery(hql).setParameter("theater", theater).uniqueResult();
	}
	
	@Override
	public TheaterBean getTheaterByNo(Integer no) {
		String hql = "FROM TheaterBean tb WHERE tb.no = :no";
		return (TheaterBean) factory.getCurrentSession().createQuery(hql).setParameter("no", no).uniqueResult();
	}

}
