package com.web.service;

import java.util.List;

import com.web.entity.MovieBean;

public interface MovieService {
	int saveMovie(MovieBean movie);
	// disable
	int deleteMovie(String movieId);
	int deleteAll();
	// update
	int updateMovie(MovieBean movie);
	// query
	MovieBean getMovieById(String movieId);
	//by director, by cast, by genre, or by something else
	List<MovieBean> getMoviesByColumn(String columnValue, String columnName);
	List<MovieBean> getReleasedMovies();
	List<MovieBean> getComingMovies();
	List<MovieBean> getAllMovies();
}
