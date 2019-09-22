package com.web.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(
		name = "Member",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "memberId" }),
				@UniqueConstraint(columnNames = { "email" })
				}
		)
public class MemberBean implements Serializable{
	private static final long serialVersionUID = -9005818506738054187L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_no")
	private Integer no;
	private Boolean available;
	private String name;
	@NotNull	
	private String memberId;
	@NotNull
	private String email; //as account
	@NotNull
	private String password;
	private Integer gender;
	private String phoneNum;
	private Date birthday;
	@JsonIgnore
	private Blob memberImage;
	private String imageFileName;
	@JsonIgnore
	private String aboutMe;
	private Boolean commentPermission;
	private Integer banCounter;	
	@NotNull
	private Date registerTime;
	
	@Transient
	private String birthdayString;
	@JsonIgnore
	@Transient
	private MultipartFile uploadImage;
	
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_owner_id", referencedColumnName = "memberId")
	private Set<OrderBean> orders;//U, O2M
	
	@OneToMany(mappedBy = "author")
	private Set<ArticleBean> articles;//B, O2M
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Blob getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(Blob memberImage) {
		this.memberImage = memberImage;
	}
	public Set<OrderBean> getOrders() {
		return orders;
	}
	public void setOrders(Set<OrderBean> orders) {
		this.orders = orders;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Set<ArticleBean> getArticles() {
		return articles;
	}
	public void setArticles(Set<ArticleBean> articles) {
		this.articles = articles;
	}
	public Boolean getCommentPermission() {
		return commentPermission;
	}
	public void setCommentPermission(Boolean commentPermission) {
		this.commentPermission = commentPermission;
	}
	public Integer getBanCounter() {
		return banCounter;
	}
	public void setBanCounter(Integer banCounter) {
		this.banCounter = banCounter;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	public String getBirthdayString() {
		return birthdayString;
	}
	public void setBirthdayString(String birthdayString) {
		this.birthdayString = birthdayString;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	
	
	
}
