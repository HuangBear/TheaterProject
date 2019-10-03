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
import javax.persistence.Transient;
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
	private Boolean report;
	private String title;
	private String content;
	private String tag;
	private Boolean type;
	private Date postTime;
	private Integer likeCount;
	private Integer dislikeCount;
	
	@Transient
	private String noString;
	@Transient
	private String postTimeString;
	@Transient
	private String likeCountString;
	@Transient
	private String dislikeCountString;
	@Transient
	private String authorString;
	@Transient
	private String movieString;
	@Transient
	private String availableString;
	@Transient
	private String typeString;
	
	@OneToMany(mappedBy = "article",fetch = FetchType.EAGER)
	private Set<ReplyBean> replys;
	
	@OneToMany(mappedBy = "article",fetch = FetchType.EAGER)
	private Set<ReportBean> reports;

	@ManyToOne
	@JoinColumn(name = "fk_author_id")
	private MemberBean author;//B, M2O
	
	@ManyToOne
	@JoinColumn(name = "fk_movie_id")
	private MovieBean movie; //B, M2O
	public ArticleBean() {
		super();
		System.out.println("default constructor");
	}
	public ArticleBean(Integer no) {
		super();
		this.no = no;
	}
	
	public ArticleBean(Integer no, Boolean available, String title, String content, String tag, Boolean type, Date postTime,
			Integer likeCount, Integer dislikeCount, String postTimeString, Set<ReplyBean> replys, MemberBean author,
			MovieBean movie) {
		super();
		this.no = no;
		this.available = available;
		this.title = title;
		this.content = content;
		this.tag = tag;
		this.type = type;
		this.postTime = postTime;
		this.likeCount = likeCount;
		this.dislikeCount = dislikeCount;
		this.postTimeString = postTimeString;
		this.replys = replys;
		this.author = author;
		this.movie = movie;
	}
	
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
		System.out.println("title setter");
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
		System.out.println("getpostTime");
		return postTime;
	}
	public void setPostTime(Date postTime) {
		System.out.println("setpostTime");
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
	
	public Boolean getReport() {
		return report;
	}
	public void setReport(Boolean report) {
		this.report = report;
	}
	
	public Set<ReplyBean> getReplys() {
		return replys;
	}
	public void setReplys(Set<ReplyBean> replys) {
		this.replys = replys;
	}
	
	public Set<ReportBean> getReports() {
		return reports;
	}
	public void setReports(Set<ReportBean> reports) {
		this.reports = reports;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	
	public String getLikeCountString() {
		return likeCountString;
	}
	public void setLikeCountString(String likeCountString) {
		this.likeCountString = likeCountString;
	}
	
	public String getDislikeCountString() {
		return dislikeCountString;
	}
	public void setDislikeCountString(String dislikeCountString) {
		this.dislikeCountString = dislikeCountString;
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
	public String getTypeString() {
		return typeString;
	}
	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}
	public Boolean getType() {
		return type;
	}
	public void setType(Boolean type) {
		this.type = type;
	}
	
}
