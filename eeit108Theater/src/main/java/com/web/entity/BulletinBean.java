package com.web.entity;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name = "Bulletin")
public class BulletinBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bulletin_no")
	private Integer no;
	private Boolean available;//是否過期
	private String tittle;
	private String context;
	private Date startDate;
	private Date endtDate;
	private Date postTime;
	private Boolean discontTick;
	private Boolean discontPrice;
	private Boolean status;//是否刪除

	@ManyToOne
	@JoinColumn(name = "fk_employee_id")
	private EmployeeBean employee;
	
	private Blob bulletinImage;
	
	public Blob getBulletinImage()
	{
		return bulletinImage;
	}

	public void setBulletinImage(Blob bulletinImage)
	{
		this.bulletinImage = bulletinImage;
	}

	public Integer getNo()
	{
		return no;
	}

	public void setNo(Integer no)
	{
		this.no = no;
	}

	public String getTittle()
	{
		return tittle;
	}

	public void setTittle(String tittle)
	{
		this.tittle = tittle;
	}

	public String getContext()
	{
		return context;
	}

	public void setContext(String context)
	{
		this.context = context;
	}

	public Date getStartDate()
	{
		return startDate;
	}

	public void setStartDate(Date startDate)
	{
		this.startDate = startDate;
	}

	public Date getEndtDate()
	{
		return endtDate;
	}

	public void setEndtDate(Date endtDate)
	{
		this.endtDate = endtDate;
	}

	public Date getPostTime()
	{
		return postTime;
	}

	public void setPostTime(Date postTime)
	{
		this.postTime = postTime;
	}

	public Boolean getDiscontTick()
	{
		return discontTick;
	}

	public void setDiscontTick(Boolean discontTick)
	{
		this.discontTick = discontTick;
	}

	public Boolean getDiscontPrice()
	{
		return discontPrice;
	}

	public void setDiscontPrice(Boolean discontPrice)
	{
		this.discontPrice = discontPrice;
	}

	public Boolean getStatus()
	{
		return status;
	}

	public void setStatus(Boolean status)
	{
		this.status = status;
	}

	public EmployeeBean getEmployee()
	{
		return employee;
	}

	public void setEmployee(EmployeeBean employee)
	{
		this.employee = employee;
	}

	public Boolean getAvailable()
	{
		return available;
	}

	public void setAvailable(Boolean available)
	{
		this.available = available;
	}

}