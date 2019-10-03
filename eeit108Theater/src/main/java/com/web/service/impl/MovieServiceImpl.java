package com.web.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MovieDao;
import com.web.entity.MovieBean;
import com.web.service.MovieService;
@Transactional
@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDao dao;

	@Override
	public int saveMovie(MovieBean movie) {
		int count = 0;
		dao.saveMovie(movie);
		count++;
		return count;
	}

	@Override
	public int deleteMovie(String movieId) {
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
		return dao.updateMovie(movieBean);
		
	}

	@Override
	public MovieBean getMovieById(Integer no) {
		return dao.getMovieByNo(no);
	}

	@Override
	public List<MovieBean> getMoviesByColumn(String columnValue, String columnName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieBean> getReleasedMovies() {
		return dao.getReleasedMovies();
	}

	@Override
	public List<MovieBean> getComingMovies() {
		return dao.getComingMovies();
	}

	@Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}

	@Override
	public List<MovieBean> getOffMovies() {
		return dao.getOffMovies();
	}

	@Override
	public MovieBean getMovieByName(String name) {
		return dao.getMovieByName(name);
	}
	
}
