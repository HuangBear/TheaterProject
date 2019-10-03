package com.web.service;

import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.ReportBean;

public interface ArticleService {
	List<ArticleBean>  getAllArticles(); 
	List<ReplyBean>  getAllReplys();
	List<ReplyBean>  getReplysByArticle(int article);
	List<String>  getAllTags();
//	List<String> getAllSysTags();

	List<ArticleBean>  getArticlesByTag(String tag);
	
	public ArticleBean getArticleById(int no);
//	public SysArticleBean getSysArticleById(int no);
	public ReplyBean getReplyById(int no);
	public ReplyBean getReplyByArticleId(int no);
	public String getLikeOrDislikeByMemberAndArticle(int memberNo,int article);
	
	void addArticle(ArticleBean article);
	void editArticle(ArticleBean article);
//	void addSysArticle(SysArticleBean ab);
	void addReply(ReplyBean reply);
	void editReply(ReplyBean reply);
	void addReport(ReportBean rb);
	void addGp(LikeOrDislikeBean likeOrDislike);
	void updateGp(LikeOrDislikeBean likeOrDislike);
	MemberBean  getMemberById(int memberId);
	MovieBean  getMovieByNo(int movieNo);
	
	LikeOrDislikeBean getLikeOrDislikeNo(int memberNo, int article);
	List<MemberBean>  getMemberList();
	List<ArticleBean> getArticlesByMovieNo(int movieNo);
	List<MovieBean> getAllMovies();
//	List<SysArticleBean> getSysArticlesByMovieNo(int movieNo);
	List<ArticleBean> getArticlesByMovieNo2(int movieNo);


}
