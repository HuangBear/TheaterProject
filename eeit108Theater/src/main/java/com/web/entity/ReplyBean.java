package com.web.entity;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
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
// 本類別封裝單筆書籍資料
@Entity
@Table(name="Reply")
public class ReplyBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer 	replyId;
	private Integer 	floor;
	private String  	author;
	private String  	content;
	
	//private String  	companyName;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_MemberBean_no") 
	@JsonIgnoreProperties("Reply")
    private MemberBean memberBean;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_ArticleBean_no") 
    private ArticleBean articleBean;
	
	
	public ArticleBean getArticleBean() {
		return articleBean;
	}
	
	public void setArticleBean(ArticleBean articleBean) {
		this.articleBean = articleBean;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
		
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer ReplyId) {
		this.replyId = ReplyId;
	}

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}

	
}
