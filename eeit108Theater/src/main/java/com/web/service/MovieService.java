package com.web.service;

import java.util.List;

import com.web.entity.MovieBean;

public interface MovieService {
	int saveMovie(MovieBean movie);
	// disable
	int deleteMovie(String movieId);
	int deleteAll();
	// update
	MovieBean updateMovie(MovieBean movie);
	// query
	MovieBean getMovieById(Integer no);
	MovieBean getMovieByName(String name);
	//by director, by cast, by genre, or by something else
	List<MovieBean> getMoviesByColumn(String columnValue, String columnName);
	List<MovieBean> getReleasedMovies();
	List<MovieBean> getComingMovies();
	List<MovieBean> getAllMovies();
	List<MovieBean> getOffMovies();
	List<String> getMovieNames();
}
