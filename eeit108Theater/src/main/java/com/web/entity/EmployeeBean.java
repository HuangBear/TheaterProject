package com.web.entity;

import java.sql.Blob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

@Entity
@Table(
		name = "Employee",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "employeeId" }),
				@UniqueConstraint(columnNames = { "email" })
				}
		)
public class EmployeeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employee_no")
	private Integer no;
	private Boolean available;
	private String name;
	@NotNull
	private String employeeId;
	@NotNull	
	private String email; //as account
	@NotNull	
	private String password;
	private Integer gender;
	private String phoneNum;
	private Date birthday;
	private Blob employeeImage;
	@NotNull
	private Date registerTime;
	private Date resignTime;
	private Integer permission;
	private Integer salary;
	
	@Transient
	private String birthdayString;
	
	public EmployeeBean() {
		
	}
	public EmployeeBean(Integer no, Boolean available, String name, @NotNull String employeeId, @NotNull String email,
			@NotNull String password, Integer gender, String phoneNum, Date birthday, Blob employeeImage,
			@NotNull Date registerTime, Date resignTime, Integer permission, Integer salary,
			Set<BulletinBean> bulletins) {
		super();
		this.no = no;
		this.available = available;
		this.name = name;
		this.employeeId = employeeId;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.phoneNum = phoneNum;
		this.birthday = birthday;
		this.employeeImage = employeeImage;
		this.registerTime = registerTime;
		this.resignTime = resignTime;
		this.permission = permission;
		this.salary = salary;
		this.bulletins = bulletins;
	}
	@OneToMany(mappedBy = "employee")
	private Set<BulletinBean> bulletins=new LinkedHashSet<BulletinBean>();
	
	public EmployeeBean(String name,String email,String password,String phoneNum) {
		this.name=name;
		this.email=email;
		this.password=password;
		this.phoneNum=phoneNum;
	}
	public Set<BulletinBean> getBulletin()
	{
		return bulletins;
	}
	public void setBulletin(Set<BulletinBean> bulletins)
	{
		this.bulletins = bulletins;
	}
	
	
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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Blob getEmployeeImage() {
		return employeeImage;
	}
	public void setEmployeeImage(Blob employeeImage) {
		this.employeeImage = employeeImage;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Date getResignTime() {
		return resignTime;
	}
	public void setResignTime(Date resignTime) {
		this.resignTime = resignTime;
	}
	public Integer getPermission() {
		return permission;
	}
	public void setPermission(Integer permission) {
		this.permission = permission;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
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
	public Set<BulletinBean> getBulletins() {
		return bulletins;
	}
	public void setBulletins(Set<BulletinBean> bulletins) {
		this.bulletins = bulletins;
	}
}
