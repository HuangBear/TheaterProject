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
		name = "Order_Item",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "itemName" }) 
				}
		)
public class OrderItemBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderItem_no")
	private Integer no;
	private Boolean available;
	@NotNull
	private String itemName;
	@NotNull
	private Double unitPrice;
	@NotNull
	private Integer quantity;
	@NotNull
	private String type;//ticket, drink, or food etc.
	
	@NotNull
	@Column(name = "fk_order_id")
	private String orderId;//not owner, cannot find Order object directly
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
}
