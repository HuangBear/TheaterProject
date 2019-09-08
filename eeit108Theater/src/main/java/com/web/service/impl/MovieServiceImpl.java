package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MovieDao;
import com.web.entity.MovieBean;
import com.web.service.MovieService;
@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDao dao;
	@Transactional
	@Override
	public int saveMovie(MovieBean movie) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Transactional
	@Override
	public int deleteMovie(String movieId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Transactional
	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Transactional
	@Override
	public int updateMovie(MovieBean movie) {
		int count = 0;
		
		return 0;
	}
	@Transactional
	@Override
	public MovieBean getMovieById(Integer no) {
		return dao.getMovieByNo(no);
	}

	@Override
	public List<MovieBean> getMoviesByColumn(String columnValue, String columnName) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@Override
	public List<MovieBean> getReleasedMovies() {
		return dao.getReleasedMovies();
	}
	@Transactional
	@Override
	public List<MovieBean> getComingMovies() {
		return dao.getComingMovies();
	}
	@Transactional
	@Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}
	
}
