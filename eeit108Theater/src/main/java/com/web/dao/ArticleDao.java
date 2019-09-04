package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.MovieBean;

public interface ArticleDao {
	// new
	int saveArticle(ArticleBean article);

	// disable
	int deleteArticle(String articleId);

	int deleteAll();

	// update
	int updateArticle(ArticleBean article);

	// query
	ArticleBean getArticleById(String articleId);
		
	List<MovieBean> getArticlesByTitle(String title);
	
	List<MovieBean> getArticlesByKeyword(String keyword);
	
	List<MovieBean> getArticlesByAuthor(String authorName);

	List<MovieBean> getArticlesByMovie(String movieName);

	List<MovieBean> getArticlesBeforeDate(Date time);

	List<MovieBean> getArticlesAfterDate(Date time);
	
	List<MovieBean> getAllArticles();
}
