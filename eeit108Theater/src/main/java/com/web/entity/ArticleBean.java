package com.web.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

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
import javax.validation.constraints.NotNull;

import com.web.entity.ReplyBean;

@Entity
@Table(name = "Article")
public class ArticleBean implements Serializable {	
	private static final long serialVersionUID = -5704948765359503235L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_no")
	private Integer no;	
	private Boolean available;
	private String title;
	private String content;
	private String tag;
	@NotNull
	private Date postTime;
	private Integer likeCount;
	private Integer dislikeCount;
	
	@OneToMany(mappedBy = "articleBean",fetch = FetchType.EAGER)
	private Set<ReplyBean> replys;
	//private String  	companyName;

	@ManyToOne
	@JoinColumn(name = "fk_author_id")
	private MemberBean author;//B, M2O
	
	@ManyToOne
	@JoinColumn(name = "fk_movie_id")
	private MovieBean movie; //B, M2O
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MovieBean getMovie() {
		return movie;
	}
	public void setMovie(MovieBean movie) {
		this.movie = movie;
	}
	public MemberBean getAuthor() {
		return author;
	}
	public void setAuthor(MemberBean author) {
		this.author = author;
	}
	public Date getPostTime() {
		return postTime;
	}
	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}
	public Integer getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}
	public Integer getDislikeCount() {
		return dislikeCount;
	}
	public void setDislikeCount(Integer dislikeCount) {
		this.dislikeCount = dislikeCount;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	
	public MemberBean getMemberBean() {
		return author;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.author = memberBean;
	}
	
	public Set<ReplyBean> getReplys() {
		return replys;
	}
	public void setReplys(Set<ReplyBean> replys) {
		this.replys = replys;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
