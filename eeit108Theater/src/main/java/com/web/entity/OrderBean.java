package com.web.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(
		name = "Orders", 
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "orderId" }) 
				}
		)
public class OrderBean implements Serializable{
	private static final long serialVersionUID = -2065809342946682382L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_no")
	private Integer no;
	private Boolean available;
	private String orderId;
	private Timestamp orderTime;
	private Double totalPrice;

	@Column(name = "fk_owner_id")
	private String ownerId;//not owner, cannot find owner object directly
	private String ownerName;
	private String ownerEmail;
	//private String status; //paid/unpaid, checked/unchecked
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id", referencedColumnName = "orderId")
	@OrderBy("type")
	private List<OrderItemBean> orderItems = new ArrayList<OrderItemBean>(); //U, O2M
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_timeTable_id")
	private TimeTableBean timeTable;//U, M2O
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id", referencedColumnName = "orderId")
	private Set<SeatBean> seats;//U, O2M
	
	public OrderBean() {
		super();
	}
	public OrderBean(Boolean available) {
		this.setAvailable(available);
		this.setOrderItems(new ArrayList<OrderItemBean>());
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public TimeTableBean getTimeTable() {
		return timeTable;
	}
	public void setTimeTable(TimeTableBean timeTable) {
		this.timeTable = timeTable;
	}
	public Set<SeatBean> getSeats() {
		return seats;
	}
	public void setSeats(Set<SeatBean> seats) {
		this.seats = seats;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerEmail() {
		return ownerEmail;
	}
	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public List<OrderItemBean> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItemBean> orderItems) {
		this.orderItems = orderItems;
	}
}
