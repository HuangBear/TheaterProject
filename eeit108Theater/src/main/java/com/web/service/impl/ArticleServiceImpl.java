package com.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ArticleDao;
import com.web.entity.ArticleBean;
import com.web.entity.MemberBean;
import com.web.entity.ReplyBean;
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
	public List<ReplyBean> getAllReplys() {
		return dao.getAllReplys();
	}
    
    @Transactional
	@Override
	public List<String> getAllTags() {
		return dao.getAllTags();
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
    
    @Transactional
	@Override
	public ReplyBean getReplyById(int no) {
		return dao.getReplyById(no);
	}
    
    @Transactional
	@Override
	public void addArticle(ArticleBean article) {
		dao.addArticle(article);
	}
    
    @Transactional
	@Override
	public void editArticle(ArticleBean article) {
		dao.editArticle(article);
	}
    
    @Transactional
	@Override
	public MemberBean getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}
    
    @Transactional
	@Override
	public List<MemberBean> getMemberList() {
		return dao.getMemberList();
	}
}