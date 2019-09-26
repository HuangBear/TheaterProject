package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.EmployeeBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.MemberBean;

public interface ArticleDao {
	
	MemberBean  getMemberById(int memberId);
	
	List<ArticleBean> getAllArticles();
	
	List<ReplyBean>  getAllReplys();
	
	List<MemberBean>  getMemberList();
	
	List<String>  getAllTags();
	List<ArticleBean>  getArticlesByTag(String Tag);
	
	public ArticleBean getArticleById(int no);
	public ReplyBean getReplyById(int no);
	public String getLikeOrDislikeByMemberAndArticle(int memberNo,int article);
	
	void  addArticle(ArticleBean article);
	void editArticle(ArticleBean article);
	void addReply(ReplyBean reply);
	void editReply(ReplyBean reply);
	void addGp(LikeOrDislikeBean likeOrDislike);
	void updateGp(LikeOrDislikeBean likeOrDislike);
	
	MovieBean getMovieByNo(int movieNo);
	LikeOrDislikeBean getLikeOrDislikeNo(int memberNo, int article);

	List<ArticleBean> getArticlesByMovieNo(int movieNo);
	
}
