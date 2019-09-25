package com.web.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="Reply")
public class ReplyBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reply_no")
	private Integer no;	
	private Boolean available;
	private String content;
	private Date postTime;
	
	@Transient
	private String noString;
	@Transient
	private String postTimeString;
	@Transient
	private String authorString;
	@Transient
	private String movieString;
	@Transient
	private String availableString;
	@Transient
	private String articleString;
	
	@ManyToOne
	@JoinColumn(name = "fk_author_no")
	private MemberBean author;//B, M2O
	
	@ManyToOne
	@JoinColumn(name="FK_ArticleBean_no") 
    private ArticleBean article;
	
	
	public ArticleBean getArticle() {
		return article;
	}
	
	public void setArticle(ArticleBean article) {
		this.article = article;
	}

	public MemberBean getAuthor() {
		return author;
	}
	public void setAuthor(MemberBean author) {
		this.author = author;
	}
		
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostTime() {
		System.out.println("getpostTime");
		return postTime;
	}
	public void setPostTime(Date postTime) {
		System.out.println("setpostTime");
		this.postTime = postTime;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	public String getPostTimeString() {
		System.out.println("posttimestring getter");
		return postTimeString;
	}
	public void setPostTimeString(String postTimeString) {
		System.out.println("posttimestring setter");
		this.postTimeString = postTimeString;
	}
	public String getNoString() {
		return noString;
	}
	public void setNoString(String noString) {
		this.noString = noString;
	}
	
	public String getAuthorString() {
		return authorString;
	}
	public void setAuthorString(String authorString) {
		this.authorString = authorString;
	}
	
	public String getMovieString() {
		return movieString;
	}
	public void setMovieString(String movieString) {
		this.movieString = movieString;
	}
	public String getArticleString() {
		return articleString;
	}
	public void setArticleString(String articleString) {
		this.articleString = articleString;
	}

	
}
