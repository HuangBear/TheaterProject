package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ArticleDao;
import com.web.entity.ATypeBean;
import com.web.entity.ArticleBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.ReportBean;
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getArticlesByMovieNo(int movieNo) {
	    String hql = "FROM ArticleBean bb WHERE bb.movie.no = :movie and bb.type =:type order by no desc";
	    Boolean type = false;
	    Session session = null;
	    List<ArticleBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("movie", movieNo).setParameter("type", type).list();
	    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getTopArticlesByMovieNo(int movieNo) {
	    String hql = "FROM ArticleBean bb WHERE bb.movie.no = :movie and bb.type =:type";
	    Boolean type = true;
	    Session session = null;
	    List<ArticleBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("movie", movieNo).setParameter("type", type).list();
	    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getArticlesByMovieNo2(int movieNo) {
	    String hql = "FROM ArticleBean bb WHERE bb.movie.no = :movie";
	    Session session = null;
	    List<ArticleBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("movie", movieNo).list();
	    return list;
	}
	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<SysArticleBean> getSysArticlesByMovieNo(int movieNo) {
//	    String hql = "FROM SysArticleBean bb WHERE bb.movie.no = :movie";
//	    Session session = null;
//	    List<SysArticleBean> list = new ArrayList<>();
//	    session = factory.getCurrentSession();
//	    list = session.createQuery(hql).setParameter("movie", movieNo).list();
//	    return list;
//	}
	
	@Override
	public List<ReplyBean> getAllReplys() {
	    String hql = "FROM ReplyBean";
	    Session session = null;
	    List<ReplyBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@Override
	public List<ReplyBean> getReplysByArticle(int article) {
	    String hql = "FROM ReplyBean rb WHERE rb.article.no = :article order by no asc";
	    Session session = null;
	    List<ReplyBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("article", article).list();
	    return list;
	}
	
	@SuppressWarnings("unused")
	@Override
	public void addGp(LikeOrDislikeBean likeOrDislike) {
		Session session = factory.getCurrentSession();
		session.save(likeOrDislike);
	}
	
	@SuppressWarnings("unused")
	@Override
	public void updateGp(LikeOrDislikeBean likeOrDislike) {
		Session session = factory.getCurrentSession();
		System.out.println("確認2");
		session.update(likeOrDislike);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllTags() {
	    String hql = "SELECT DISTINCT b.tag FROM TagBean b";
	    Session session = factory.getCurrentSession();
	    List<String> list = new ArrayList<>();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllSysTags() {
	    String hql = "SELECT DISTINCT b.tag FROM SysTagBean b";
	    Session session = factory.getCurrentSession();
	    List<String> list = new ArrayList<>();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getATypeList() {
	    String hql = "SELECT DISTINCT b.typeName FROM ATypeBean b";
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
	public ReplyBean getReplyByArticleId(int article) {
		String hql = "FROM ReplyBean rb WHERE rb.article.no = :article";
		ReplyBean rb = (ReplyBean) factory.getCurrentSession().createQuery(hql).setParameter("article", article).uniqueResult();
		return rb;
	}
	
	@Override
	public ArticleBean getArticleById(int no) {
		Session session = factory.getCurrentSession();
		ArticleBean ab = session.get(ArticleBean.class, no);
		return ab;
	}
	
//	@Override
//	public SysArticleBean getSysArticleById(int no) {
//		Session session = factory.getCurrentSession();
//		SysArticleBean ab = session.get(SysArticleBean.class, no);
//		return ab;
//	}
	
	@Override
	public String getLikeOrDislikeByMemberAndArticle(int memberNo,int article) {
		String hql = "FROM LikeOrDislikeBean lb WHERE lb.member = :member and lb.article.no = :article";
		LikeOrDislikeBean likeOrDislike = (LikeOrDislikeBean) factory.getCurrentSession().createQuery(hql).setParameter("member", memberNo).setParameter("article", article).uniqueResult();
		if(likeOrDislike == null || likeOrDislike.getLikeOrDislike() == null) {
			return "null";
		}
		return String.valueOf(likeOrDislike.getLikeOrDislike());
//		Boolean lod = likeOrDislike.getLikeOrDislike();
//		System.out.println("檢查斷點3");
//		else if(lod == true) {
//			likeOrDislikeString = "true";
//		}
//		else if(lod == false) {
//			likeOrDislikeString = "false";
//		}
//		return likeOrDislikeString;
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
//	@Override
//	public void addSysArticle(SysArticleBean article) {
//	    Session session = factory.getCurrentSession();
//	    session.save(article);
//	}
	@Override
	public void addReply(ReplyBean reply) {
	    Session session = factory.getCurrentSession();
	    session.save(reply);
	}	
	@Override
	public void editReply(ReplyBean reply) {
	    Session session = factory.getCurrentSession();
	    session.update(reply);
	}
	@Override
	public void addReport(ReportBean rb) {
		
	    Session session = factory.getCurrentSession();
	    session.save(rb);
	    
	}
	
	@Override
	public void editMember(MemberBean member) {
	    Session session = factory.getCurrentSession();
	    session.update(member);
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
		Session session = factory.getCurrentSession();
		MovieBean mb = session.get(MovieBean.class, movieNo);
		return mb;
	}	
	@Override
	public LikeOrDislikeBean getLikeOrDislikeNo(int memberNo, int article) {
		String hql = "FROM LikeOrDislikeBean lb WHERE lb.member = :member and lb.article.no = :article";
		LikeOrDislikeBean lb = (LikeOrDislikeBean) factory.getCurrentSession().createQuery(hql).setParameter("member", memberNo).setParameter("article", article).uniqueResult();
		return lb;
	}
	
	@Override
	public List<MemberBean> getMemberList() {
	    String hql = "FROM MemberBean";
	    Session session = factory.getCurrentSession();
	    List<MemberBean> list = session.createQuery(hql).getResultList();
	    return list;
	}
	
	@Override
	public List<MovieBean> getAllMovies() {
		String hql = "FROM MovieBean";
		Session session = factory.getCurrentSession();
		List<MovieBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public ATypeBean getAT(int no) {
		Session session = factory.getCurrentSession();
		ATypeBean atb = session.get(ATypeBean.class, no);
		return atb;
	}
	
}
