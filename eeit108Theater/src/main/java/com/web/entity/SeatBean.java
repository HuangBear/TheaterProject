package com.web.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(
		name = "Seat",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "row_X", "column_Y", "fk_timeTable_id" }) 
				}
		)
public class SeatBean implements Serializable{
	private static final long serialVersionUID = 1446341868256342450L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "seat_no")
	private Integer no;
	private Boolean available = true;
	@Column(name = "row_X")
	private String row;
	@Column(name = "column_Y")
	private Integer column;
	@Column(name = "fk_order_id")
	private String orderId; //not owner, cannot find order object directly
	
	@Column(name = "fk_timeTable_id")
	private Integer timeTableId; //not owner, cannot find timetable object directly
	
	public SeatBean() {
		super();
	}
	
	public SeatBean(Integer timeTableId, String row, Integer column) {
		super();
		this.timeTableId = timeTableId;
		this.row = row;
		this.column = column;
	}
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public Integer getColumn() {
		return column;
	}
	public void setColumn(Integer column) {
		this.column = column;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getTimeTableId() {
		return timeTableId;
	}
	public void setTimeTableId(Integer timeTableId) {
		this.timeTableId = timeTableId;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public String getSeatString() {
		return this.row + this.column;
	}
}
