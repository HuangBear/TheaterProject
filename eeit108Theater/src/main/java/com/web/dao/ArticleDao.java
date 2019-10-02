package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.ArticleBean;
import com.web.entity.EmployeeBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.ReportBean;
import com.web.entity.MemberBean;

public interface ArticleDao {
	
	MemberBean  getMemberById(int memberId);
	
	List<ArticleBean> getAllArticles();
	
	List<ReplyBean>  getAllReplys();
	List<ReplyBean>  getReplysByArticle(int article);
	
	List<MemberBean>  getMemberList();
	
	List<String>  getAllTags();
//	List<String> getAllSysTags();
	List<ArticleBean>  getArticlesByTag(String Tag);
	
	public ArticleBean getArticleById(int no);
//	public SysArticleBean getSysArticleById(int no);
	public ReplyBean getReplyById(int no);
	public ReplyBean getReplyByArticleId(int article);
	public String getLikeOrDislikeByMemberAndArticle(int memberNo,int article);
	
	void  addArticle(ArticleBean article);
	void editArticle(ArticleBean article);
//	void addSysArticle(SysArticleBean article);
	void addReply(ReplyBean reply);
	void editReply(ReplyBean reply);
	void addReport(ReportBean rb);
	void addGp(LikeOrDislikeBean likeOrDislike);
	void updateGp(LikeOrDislikeBean likeOrDislike);
	
	MovieBean getMovieByNo(int movieNo);
	LikeOrDislikeBean getLikeOrDislikeNo(int memberNo, int article);
	
	
	List<ArticleBean> getArticlesByMovieNo(int movieNo);

	List<MovieBean> getAllMovies();

	List<ArticleBean> getArticlesByMovieNo2(int movieNo);

//	List<SysArticleBean> getSysArticlesByMovieNo(int movieNo);

	


}
