package com.web.dao;

import java.util.List;

import com.web.entity.MovieBean;

public interface MovieDao {
	// new
	int saveMovie(MovieBean movie);
	// disable
	int deleteMovieByNo(Integer movieNo);

	int deleteAll();
	// update
	MovieBean updateMovie(MovieBean movie);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	MovieBean getMovieByNo(Integer no);

	MovieBean getMovieByName(String name);

	// by director, by cast, by genre, or by something else
	List<MovieBean> getMoviesByColumn(String columnValue, String columnName);
	List<MovieBean> getReleasedMovies();
	List<MovieBean> getComingMovies();
	List<MovieBean> getAllMovies();
	List<MovieBean> getAllAvailable();
	List<MovieBean> getOffMovies();
}
