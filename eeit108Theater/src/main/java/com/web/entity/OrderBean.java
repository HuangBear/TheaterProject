package com.web.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
@Table(name = "Orders", uniqueConstraints = { @UniqueConstraint(columnNames = { "orderId" }) })
public class OrderBean implements Serializable {
	private static final long serialVersionUID = -2065809342946682382L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_no")
	private Integer no;
	private Boolean available = true;
	private String orderId;
	private Timestamp orderTime;
	private Double totalPrice = 0.0;

	@Column(name = "fk_owner_id")
	private String ownerId;// not owner, cannot find owner object directly
	private String ownerName;
	private String ownerEmail;
	private String ownerPhone;
	private Boolean checked = false;
	private Boolean paid = false;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id", referencedColumnName = "orderId")
	@OrderBy("type")
	private List<OrderItemBean> orderItems = new ArrayList<OrderItemBean>(); // U, O2M

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_timeTable_id")
	private TimeTableBean timeTable;// U, M2O

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id", referencedColumnName = "orderId")
	@OrderBy("row_X, column_Y")
	private List<SeatBean> seats = new ArrayList<SeatBean>();// U, O2M

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

	public List<SeatBean> getSeats() {
		return seats;
	}

	public void setSeats(List<SeatBean> seats) {
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

	public String getOwnerPhone() {
		return ownerPhone;
	}

	public void setOwnerPhone(String ownerPhone) {
		this.ownerPhone = ownerPhone;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getPaid() {
		return paid;
	}

	public void setPaid(Boolean paid) {
		this.paid = paid;
	}

	public void calTotalPrice() {
		double sum = 0;
		if (this.orderItems == null || this.orderItems.size() == 0) {
			this.totalPrice = 0.0;
			return;
		}
		for (OrderItemBean oib : this.orderItems) {
			sum += oib.getSumPrice();
		}
		this.totalPrice = sum;
	}

	@Override
	public int hashCode() {
		return Objects.hash(available, no, orderId, orderItems, orderTime, ownerEmail, ownerId, ownerName, ownerPhone,
				seats, timeTable, totalPrice);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof OrderBean))
			return false;
		OrderBean other = (OrderBean) obj;
		return Objects.equals(available, other.available) && Objects.equals(no, other.no)
				&& Objects.equals(orderId, other.orderId) && Objects.equals(orderItems, other.orderItems)
				&& Objects.equals(orderTime, other.orderTime) && Objects.equals(ownerEmail, other.ownerEmail)
				&& Objects.equals(ownerId, other.ownerId) && Objects.equals(ownerName, other.ownerName)
				&& Objects.equals(ownerPhone, other.ownerPhone) && Objects.equals(seats, other.seats)
				&& Objects.equals(timeTable, other.timeTable) && Objects.equals(totalPrice, other.totalPrice);
	}

	public String getOrderItemString() {
		int ticketCnt = 0, foodCnt = 0;
		int ticketSum = 0, foodSum = 0;
		for (OrderItemBean oi : this.getOrderItems()) {
			if (oi.getType().equals("ticket")) {
				ticketCnt += oi.getQuantity();
				ticketSum += oi.getSumPrice().intValue();
			} else {
				foodCnt += oi.getQuantity();
				foodSum += oi.getSumPrice().intValue();
			}
		}
		if (foodCnt == 0)
			return "電影票 x " + ticketCnt + " = " + ticketSum + " 元";

		return "電影票 x " + ticketCnt + " = " + ticketSum + " 元#餐點 x " + foodCnt + " = " + foodSum + " 元";
	}

	public void sortOrderItem(String first, String last) {
		List<OrderItemBean> list = this.orderItems;
		int fstIndex = 0;
		int i = 0;
		while (i < list.size()) {
			String type = list.get(i).getType();
			if (type.equals(last)) {
				if (i == list.size() - 1)
					break;
				OrderItemBean temp = list.remove(i);
				list.add(temp);
			} else if (type.equals(first)) {
				OrderItemBean temp = list.get(i);
				list.set(i, list.get(fstIndex));
				list.set(fstIndex, temp);
				fstIndex++;
				i++;
			} else {
				i++;
			}
		}
	}
	
	public List<String> getSeatsList() {
		List<String> seats = new ArrayList<>();
		for(SeatBean sb : this.getSeats()) {
			seats.add(sb.getSeatString());
		}
		return seats;
	}
}
