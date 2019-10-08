package com.web.dao;

import java.util.Date;
import java.util.List;

import com.web.entity.OrderBean;

public interface OrderDao {
	// new
	int saveOrder(OrderBean order);

	// disable
	int deleteOrderByNo(Integer orderNo);

	int deleteAll();

	// update
	int updateOrder(OrderBean order);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	OrderBean getOrderByNo(Integer orderNo);

	OrderBean getOrderById(String orderId);

	List<OrderBean> getOrdersByOwnerId(String memberId);

	List<OrderBean> getGuestOrders(String ownerEmail, String ownerPhone, Boolean checkStatus);

	List<OrderBean> getMemberOrders(String memberId, Boolean checkStatus);

	List<OrderBean> getAllOrders();

	List<OrderBean> getAllAvailable();

	List<Double> getOrderPerMoon(Date firstDate, Date lastDate);
}
