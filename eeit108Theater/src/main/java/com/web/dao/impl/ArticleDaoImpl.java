package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ArticleDao;
import com.web.entity.ArticleBean;
import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
@Repository
public class ArticleDaoImpl implements ArticleDao {
	@Autowired
    SessionFactory factory;
	@Override
	public List<ArticleBean> getAllArticles() {
	    String hql = "FROM ArticleBean";
	    Session session = null;
	    List<ArticleBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@Override
	public List<ArticleBean> getArticlesByMovieNo(int movieNo) {
	    String hql = "FROM ArticleBean bb WHERE bb.movie = :movie";
	    Session session = null;
	    List<ArticleBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@Override
	public List<ReplyBean> getAllReplys() {
	    String hql = "FROM ReplyBean";
	    Session session = null;
	    List<ReplyBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@SuppressWarnings("unused")
	@Override
	public void updateGp(int no, int newQuantity) {
		String hql = "UPDATE ArticleBean b SET b.Gp = :Gp WHERE no = :id";
		Session session = factory.getCurrentSession();
		
		int n = session.createQuery(hql).setParameter("Gp", newQuantity)
	                            .setParameter("id", no)
	                            .executeUpdate();
	}
	
	@SuppressWarnings("unused")
	@Override
	public void updateBp(int no, int newQuantity) {
		String hql = "UPDATE ArticleBean b SET b.Bp = :Bp WHERE no = :id";
		Session session = factory.getCurrentSession();
		
		int n = session.createQuery(hql).setParameter("Bp", newQuantity)
	                            .setParameter("id", no)
	                            .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllTags() {
	    String hql = "SELECT DISTINCT b.tag FROM ArticleBean b";
	    Session session = factory.getCurrentSession();
	    List<String> list = new ArrayList<>();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getArticlesByTag(String tag) {
	    String hql = "FROM ArticleBean bb WHERE bb.tag = :tag";
	    List<ArticleBean> list = new ArrayList<>();
	    Session session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("tag", tag).getResultList();
	    return list;
	}
	
	@Override
	public ReplyBean getReplyById(int no) {
		Session session = factory.getCurrentSession();
		ReplyBean rb = session.get(ReplyBean.class, no);
		return rb;
	}
	
	@Override
	public ArticleBean getArticleById(int no) {
		Session session = factory.getCurrentSession();
		ArticleBean ab = session.get(ArticleBean.class, no);
		return ab;
	}
	
	
	@Override
	public void addArticle(ArticleBean article) {
	    Session session = factory.getCurrentSession();
	    session.save(article);
	}	
	@Override
	public void editArticle(ArticleBean article) {
	    Session session = factory.getCurrentSession();
	    session.update(article);
	}
	@Override
	public MemberBean getMemberById(int memberId) {
		MemberBean mb = null;
	    Session session = factory.getCurrentSession();
	    mb = session.get(MemberBean.class, memberId);
	    return mb;
	}	
	
	@Override
	public MovieBean getMovieByNo(int movieNo) {
		MovieBean mb = null;
	    Session session = factory.getCurrentSession();
	    mb = session.get(MovieBean.class, movieNo);
	    return mb;
	}	
	
	@Override
	public List<MemberBean> getMemberList() {
	    String hql = "FROM MemberBean";
	    Session session = factory.getCurrentSession();
	    List<MemberBean> list = session.createQuery(hql).getResultList();
	    return list;
	}
	
}
