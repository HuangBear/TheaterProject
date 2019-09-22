package com.web.service;

import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;

public interface ArticleService {
	List<ArticleBean>  getAllArticles(); 
	List<ReplyBean>  getAllReplys();
	
	List<String>  getAllTags();

	List<ArticleBean>  getArticlesByTag(String tag);
	
	public ArticleBean getArticleById(int no);
	public ReplyBean getReplyById(int no);
	
	
	void  addArticle(ArticleBean article);
	void  editArticle(ArticleBean article);
	MemberBean  getMemberById(int memberId);
	MovieBean  getMovieByNo(int movieNo);
	List<MemberBean>  getMemberList();
	List<ArticleBean> getArticlesByMovieNo(int movieNo);

}
