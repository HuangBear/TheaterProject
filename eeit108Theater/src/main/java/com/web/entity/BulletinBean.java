package com.web.entity;

import java.io.Serializable;
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
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Bulletin")
public class BulletinBean implements Serializable {
	private static final long serialVersionUID = 8705745439713457086L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bulletin_no")
	private Integer no;
	private Integer count = 0;//修改次數
	private String bortingId;//文章追蹤id
	private Boolean available = true;// 是否存在 true=存在 false=刪除
	private String title;
	private String context;
	private String startDate;
	private String endDate;
	private Date postTime;
	private Integer discount;
	private Integer discountTickBuy;
	private Integer discountTickFree;
	private Integer discountPriceBuy;
	private Integer discountPriceFree;
	private Boolean status = true;// 是否在期限內 true=在 false=過期
	@Transient
	private String imgUrlString;
	@Transient
	private Integer employeeId;
	private String fileName;
	private Blob coverImage;
	@Transient
	private MultipartFile bulletinImage;
	@Transient
	private String pay;
	@Transient
	private String free;

	@ManyToOne
	@JoinColumn(name = "fk_employee_id")
	private EmployeeBean employee;

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getBortingId() {
		return bortingId;
	}

	public void setBortingId(String bortingId) {
		this.bortingId = bortingId;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getFree() {
		return free;
	}

	public void setFree(String free) {
		this.free = free;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getDiscountTickBuy() {
		return discountTickBuy;
	}

	public void setDiscountTickBuy(Integer discountTickBuy) {
		this.discountTickBuy = discountTickBuy;
	}

	public Integer getDiscountTickFree() {
		return discountTickFree;
	}

	public void setDiscountTickFree(Integer discountTickFree) {
		this.discountTickFree = discountTickFree;
	}

	public Integer getDiscountPriceBuy() {
		return discountPriceBuy;
	}

	public void setDiscountPriceBuy(Integer discountPriceBuy) {
		this.discountPriceBuy = discountPriceBuy;
	}

	public Integer getDiscountPriceFree() {
		return discountPriceFree;
	}

	public void setDiscountPriceFree(Integer discountPriceFree) {
		this.discountPriceFree = discountPriceFree;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getImgUrlString() {
		return imgUrlString;
	}

	public void setImgUrlString(String imgUrlString) {
		this.imgUrlString = imgUrlString;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public MultipartFile getBulletinImage() {
		return bulletinImage;
	}

	public void setBulletinImage(MultipartFile bulletinImage) {
		this.bulletinImage = bulletinImage;
	}

	public EmployeeBean getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeBean employee) {
		this.employee = employee;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((available == null) ? 0 : available.hashCode());
		result = prime * result + ((bortingId == null) ? 0 : bortingId.hashCode());
		result = prime * result + ((context == null) ? 0 : context.hashCode());
		result = prime * result + ((count == null) ? 0 : count.hashCode());
		result = prime * result + ((discount == null) ? 0 : discount.hashCode());
		result = prime * result + ((discountPriceBuy == null) ? 0 : discountPriceBuy.hashCode());
		result = prime * result + ((discountPriceFree == null) ? 0 : discountPriceFree.hashCode());
		result = prime * result + ((discountTickBuy == null) ? 0 : discountTickBuy.hashCode());
		result = prime * result + ((discountTickFree == null) ? 0 : discountTickFree.hashCode());
		result = prime * result + ((employee == null) ? 0 : employee.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((no == null) ? 0 : no.hashCode());
		result = prime * result + ((postTime == null) ? 0 : postTime.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BulletinBean other = (BulletinBean) obj;
		if (available == null) {
			if (other.available != null)
				return false;
		} else if (!available.equals(other.available))
			return false;
		if (bortingId == null) {
			if (other.bortingId != null)
				return false;
		} else if (!bortingId.equals(other.bortingId))
			return false;
		if (context == null) {
			if (other.context != null)
				return false;
		} else if (!context.equals(other.context))
			return false;
		if (count == null) {
			if (other.count != null)
				return false;
		} else if (!count.equals(other.count))
			return false;
		if (discount == null) {
			if (other.discount != null)
				return false;
		} else if (!discount.equals(other.discount))
			return false;
		if (discountPriceBuy == null) {
			if (other.discountPriceBuy != null)
				return false;
		} else if (!discountPriceBuy.equals(other.discountPriceBuy))
			return false;
		if (discountPriceFree == null) {
			if (other.discountPriceFree != null)
				return false;
		} else if (!discountPriceFree.equals(other.discountPriceFree))
			return false;
		if (discountTickBuy == null) {
			if (other.discountTickBuy != null)
				return false;
		} else if (!discountTickBuy.equals(other.discountTickBuy))
			return false;
		if (discountTickFree == null) {
			if (other.discountTickFree != null)
				return false;
		} else if (!discountTickFree.equals(other.discountTickFree))
			return false;
		if (employee == null) {
			if (other.employee != null)
				return false;
		} else if (!employee.equals(other.employee))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (no == null) {
			if (other.no != null)
				return false;
		} else if (!no.equals(other.no))
			return false;
		if (postTime == null) {
			if (other.postTime != null)
				return false;
		} else if (!postTime.equals(other.postTime))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}


	
	

}