package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.EmployeeBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.MemberBean;

public interface ArticleDao {
	// new
//	int saveArticle(ArticleBean article);
//
//	// disable
//	int deleteArticleByNo(Integer articleNo);
//
//	int deleteAll();
//
//	// update
//	int updateArticle(ArticleBean article);
//
//	int discontinueAll(); // 全部下架
//
//	int continueAll(); // 全部上架

	// query
//	ArticleBean getArticleByNo(Integer articleNo);
	
	MemberBean  getMemberById(int memberId);

//	List<MovieBean> getArticlesByTitle(String title);
//
//	List<MovieBean> getArticlesByKeyword(String keyword);
//
//	List<MovieBean> getArticlesByAuthor(String authorName);
//
//	List<MovieBean> getArticlesByMovie(String movieName);
//
//	List<MovieBean> getArticlesBeforeDate(Date time);
//
//	List<MovieBean> getArticlesAfterDate(Date time);
//
//	List<MovieBean> getAllAvailable();
	
	List<ArticleBean> getAllArticles();
	
	List<ReplyBean>  getAllReplys();
	
	List<MemberBean>  getMemberList();
	
	List<String>  getAllTags();
	List<ArticleBean>  getArticlesByTag(String Tag);
	
	public ArticleBean getArticleById(int no);
	public ReplyBean getReplyById(int no);
	
	void  addArticle(ArticleBean article);
	void editArticle(ArticleBean article);
	void updateGp(int no, int newQuantity);
	void updateBp(int no, int newQuantity);

	MovieBean getMovieByNo(int movieNo);

	List<ArticleBean> getArticlesByMovieNo(int movieNo);
	
}
