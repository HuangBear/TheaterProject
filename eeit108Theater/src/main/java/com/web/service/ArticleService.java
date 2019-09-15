package com.web.service;

import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.MemberBean;
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
	List<MemberBean>  getMemberList();

}
