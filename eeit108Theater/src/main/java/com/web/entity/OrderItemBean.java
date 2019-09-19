package com.web.entity;

import java.io.Serializable;

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
public class OrderItemBean implements Serializable{
	private static final long serialVersionUID = 123492023222156442L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderItem_no")
	private Integer no;
	private Boolean available = true;
	@NotNull
	private String itemName;
	@NotNull
	private Double unitPrice = 0.0;
	@NotNull
	private Integer quantity = 0;
	
	private Double sumPrice = 0.0;
	@NotNull
	private String type;//ticket, drink, or food etc.
	
	@Column(name = "fk_order_id")
	private String orderId;//not owner, cannot find Order object directly
	
	@Override
	public String toString() {
		return "name = " + this.getItemName()+ ", quantity = " + this.getQuantity()+ ", sumPrice = " + this.getSumPrice()+"||";
	}
	
	public OrderItemBean() {
		super();
	}
	
	public OrderItemBean(ProductBean p) {
		this.available = true;
		this.itemName = p.getName();
		this.unitPrice = p.getPrice();
		this.type = p.getType();
	}
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Double getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(Double sumPrice) {
		this.sumPrice = sumPrice;
	}
	
	public void calSumPrice() {
		if(this.itemName == null || this.itemName.equals("")) {
			this.sumPrice = 0.0;
			return;
		}
		this.sumPrice = this.unitPrice * this.quantity;
	}
}
