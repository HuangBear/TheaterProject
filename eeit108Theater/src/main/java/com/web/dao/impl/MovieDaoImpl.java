package com.web.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.MovieDao;
import com.web.entity.MovieBean;

@Repository
public class MovieDaoImpl implements MovieDao {
	@Autowired
	SessionFactory factory;

	@Override
	public int saveMovie(MovieBean movie) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(movie);
		count++;
		return count;
	}

	@Override
	public int deleteMovieByNo(Integer movieNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MovieBean updateMovie(MovieBean movieBean) {
		Session session = factory.getCurrentSession();
		session.update(movieBean);
		return movieBean;
	}

	@Override
	public MovieBean getMovieByNo(Integer no) {
		Session session = factory.getCurrentSession();
		MovieBean mb = session.get(MovieBean.class, no);
		return mb;

	}

	@Override
	public MovieBean getMovieByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MovieBean m WHERE m.movieName = :name";
		MovieBean mb = (MovieBean) session.createQuery(hql).setParameter("name", name)
				.uniqueResult();
		return mb;
	}

	@Override
	public List<MovieBean> getMoviesByColumn(String columnValue, String columnName) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getOffMovies() {
		String hql = "FROM MovieBean m WHERE m.endingDate < :mdate";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String parameter = sdf.format(date);
		java.sql.Date today = java.sql.Date.valueOf(parameter);
		list = session.createQuery(hql).setParameter("mdate", today).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getReleasedMovies() {
		String hql = "FROM MovieBean m WHERE m.openingDate <= :mopeningDate and m.endingDate >= :mopeningDate ORDER BY m.openingDate DESC";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String parameter = sdf.format(date.getTime());
		java.sql.Date today = java.sql.Date.valueOf(parameter);
		list = session.createQuery(hql).setParameter("mopeningDate", today).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getComingMovies() {
		String hql = "FROM MovieBean m WHERE m.openingDate > :mopeningDate";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String parameter = sdf.format(date.getTime());
		java.sql.Date today = java.sql.Date.valueOf(parameter);
		list = session.createQuery(hql).setParameter("mopeningDate", today).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getAllMovies() {
		String hql = "FROM MovieBean";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
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
	public List<MovieBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

	// chart
	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getMoviePerMoon(Date firstDate, Date lastDate) {
		Session session = factory.getCurrentSession();
		List<MovieBean> list = new ArrayList<>();
		list = session
				.createQuery("FROM MovieBean m WHERE m.openingDate "
						+ "BETWEEN :fristDate and :lastDate)")
				.setParameter("fristDate", firstDate).setParameter("lastDate", lastDate).list();
		System.out.println(list);
		return list;
	}

}
