package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

@Entity
@Table(
		name = "Seat",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "row_X", "column_Y", "fk_timeTable_id" }) 
				}
		)
public class SeatBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "seat_no")
	private Integer no;
	@Column(name = "row_X")
	private String row;
	@Column(name = "column_Y")
	private String column;
	@Column(name = "fk_order_id")
	private String orderId; //not owner, cannot find order object directly
	
	@NotNull
	@Column(name = "fk_timeTable_id")
	private Integer timeTableId; //not owner, cannot find timetable object directly
	
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
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
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

}
