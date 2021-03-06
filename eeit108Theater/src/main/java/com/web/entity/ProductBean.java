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
@Table(name = "Product", uniqueConstraints = { @UniqueConstraint(columnNames = { "name" }) })
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 4418348283179409378L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_no")
	private Integer no;
	private Boolean available = true;
	@NotNull
	private String name;
	@NotNull
	private Double price;
	@NotNull
	private String type; // ticket, drink, or food etc.

	public ProductBean() {
		super();
	}

	public ProductBean(String name, Double price, String type) {
		this.name = name;
		this.price = price;
		this.type = type;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
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
}
