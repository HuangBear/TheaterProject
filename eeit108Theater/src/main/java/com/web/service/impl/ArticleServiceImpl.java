package com.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ArticleDao;
import com.web.entity.ATypeBean;
import com.web.entity.ArticleBean;
import com.web.entity.EmployeeBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.ReportBean;
import com.web.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao dao;
    
    @Transactional
	@Override
	public List<ArticleBean> getAllArticles() {
		return dao.getAllArticles();
	}
    
    @Transactional
	@Override
	public List<ArticleBean> getArticlesByMovieNo(int movieNo) {
		return dao.getArticlesByMovieNo(movieNo);
	}
    
    @Transactional
	@Override
	public List<ArticleBean> getTopArticlesByMovieNo(int movieNo) {
		return dao.getTopArticlesByMovieNo(movieNo);
	}
    
    @Transactional
	@Override
	public List<ArticleBean> getArticlesByMovieNo2(int movieNo) {
		return dao.getArticlesByMovieNo2(movieNo);
	}
    
//    @Transactional
//	@Override
//	public List<SysArticleBean> getSysArticlesByMovieNo(int movieNo) {
//		return dao.getSysArticlesByMovieNo(movieNo);
//	}
    
    @Transactional
	@Override
	public List<ReplyBean> getAllReplys() {
		return dao.getAllReplys();
	}
    
    @Transactional
	@Override
    public List<ReplyBean> getReplysByArticle(int article) {
		return dao.getReplysByArticle(article);
	}
    
    @Transactional
	@Override
	public List<String> getAllTags() {
		return dao.getAllTags();
	}
    
    @Transactional
	@Override
	public List<String> getAllSysTags() {
		return dao.getAllSysTags();
	}
    
    @Transactional
	@Override
	public List<String> getATypeList() {
		return dao.getATypeList();
	}
    
    @Transactional
	@Override
	public List<ArticleBean> getArticlesByTag(String tag) {
		return dao.getArticlesByTag(tag);
	}
    
    @Transactional
	@Override
	public ArticleBean getArticleById(int no) {
		return dao.getArticleById(no);
	}
    
//    @Transactional
//	@Override
//	public SysArticleBean getSysArticleById(int no) {
//		return dao.getSysArticleById(no);
//	}
    
    @Transactional
	@Override
	public ReplyBean getReplyById(int no) {
		return dao.getReplyById(no);
	}
    
    @Transactional
	@Override
    public ReplyBean getReplyByArticleId(int no){
		return dao.getReplyByArticleId(no);
	}
    
    @Transactional
	@Override
	public String getLikeOrDislikeByMemberAndArticle(int memberNo,int article) {
		return dao.getLikeOrDislikeByMemberAndArticle(memberNo,article);
	}
    
    @Transactional
	@Override
	public void addArticle(ArticleBean article) {
		dao.addArticle(article);
	}
    
    @Transactional
	@Override
	public void editArticle(ArticleBean article) {
    	if( article !=null) {
			dao.editArticle(article);
			
		}else {
			System.out.println("insert null");
		}
		
	}
    
//    @Transactional
//	@Override
//	public void addSysArticle(SysArticleBean article) {
//		dao.addSysArticle(article);
//	}
    
    @Transactional
	@Override
	public void addReply(ReplyBean reply) {
		dao.addReply(reply);
	}
    
    @Transactional
	@Override
	public void editReply(ReplyBean reply) {
    	if( reply !=null) {
			System.out.println("emp insert not null");
			dao.editReply(reply);
			
		}else {
			System.out.println("insert null");
		}
		
	}
    
    @Transactional
	@Override
	public void addReport(ReportBean rb) {
		dao.addReport(rb);
	}
    
    @Transactional
	@Override
	public void addGp(LikeOrDislikeBean likeOrDislike) {
		dao.addGp(likeOrDislike);
	}
    
    @Transactional
	@Override
	public void updateGp(LikeOrDislikeBean likeOrDislike) {
    	System.out.println("確認");
		dao.updateGp(likeOrDislike);
	}
    
    @Transactional
	@Override
	public void editMember(MemberBean member) {
    	if( member !=null) {
			dao.editMember(member);
			
		}else {
			System.out.println("insert null");
		}
		
	}
    
    @Transactional
	@Override
	public LikeOrDislikeBean getLikeOrDislikeNo(int memberNo,int article) {
		return dao.getLikeOrDislikeNo(memberNo,article);
	}
    
    @Transactional
	@Override
	public MemberBean getMemberById(int memberId) {	
		return dao.getMemberById(memberId);
	}
    
    @Transactional
	@Override
	public MovieBean  getMovieByNo(int movieNo) {	
		return dao.getMovieByNo(movieNo);
	}
    
    @Transactional
	@Override
	public List<MemberBean> getMemberList() {
		return dao.getMemberList();
	}
    
    @Transactional
    @Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}
    
    @Transactional
	@Override
    public ATypeBean getAT(int no){
		return dao.getAT(no);
	}
    
    
}