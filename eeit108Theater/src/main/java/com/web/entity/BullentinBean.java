package com.web.entity;

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
@Table(name = "Bullentin")
public class BullentinBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bullentin_no")
	private Integer no;
	private String tittle;
	private String context;
	private Date startDate;
	private Date endtDate;
	private Date postTime;
	private Integer[] discontTick;
	private Integer[] discontPrice;
	private Boolean status;
		
	@NotNull
	@ManyToOne
	@JoinColumn(name = "fk_employee_id")
	private EmployeeBean employee;

	
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
	public Integer[] getDiscontTick()
	{
		return discontTick;
	}
	public void setDiscontTick(Integer[] discontTick)
	{
		this.discontTick = discontTick;
	}
	public Integer[] getDiscontPrice()
	{
		return discontPrice;
	}
	public void setDiscontPrice(Integer[] discontPrice)
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

}