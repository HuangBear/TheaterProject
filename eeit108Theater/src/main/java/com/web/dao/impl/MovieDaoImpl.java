package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.MovieDao;
import com.web.entity.MovieBean;
@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired
	SessionFactory factory;
	@Override
	public int saveMovie(MovieBean movie) {
		// TODO Auto-generated method stub
		return 0;
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
	public int updateMovie(MovieBean movie) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MovieBean getMovieByNo(Integer movieNo) {
		Session session = factory.getCurrentSession();
		MovieBean mb = session.get(MovieBean.class, movieNo);
		return mb;
				
	}

	@Override
	public List<MovieBean> getMoviesByColumn(String columnValue, String columnName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieBean> getReleasedMovies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieBean> getComingMovies() {
		// TODO Auto-generated method stub
		return null;
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

}
