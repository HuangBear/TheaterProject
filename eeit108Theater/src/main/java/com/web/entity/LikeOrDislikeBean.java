package com.web.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import com.web.entity.ReplyBean;

@Entity
@Table(name = "LikeOrDislike")
public class LikeOrDislikeBean implements Serializable {	
	private static final long serialVersionUID = -5704948765359503235L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "likeOrDislike_no")
	private Integer no;	
	private Boolean likeOrDislike;
	
	@Column(name = "fk_member_no")
	private Integer member;//not owner
	
	@ManyToOne
	@JoinColumn(name = "fk_article_id")
	private ArticleBean article; //U, M2O
	
	@Transient
	private String articleNoString;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	
	public ArticleBean getArticle() {
		return article;
	}
	public void setArticle(ArticleBean No) {
		this.article = No;
	}
	public Integer getMember() {
		return member;
	}
	public void setMember(Integer No) {
		this.member = No;
	}

	public Boolean getLikeOrDislike() {
		return likeOrDislike;
	}
	public void setLikeOrDislike(Boolean likeOrDislike) {
		this.likeOrDislike = likeOrDislike;
	}
	public String getArticleNoString() {
		return articleNoString;
	}
	public void setArticleNoString(String articleNoString) {
		this.articleNoString = articleNoString;
	}
}
