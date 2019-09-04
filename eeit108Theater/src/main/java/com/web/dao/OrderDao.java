package com.web.dao;

import java.util.List;

import com.web.entity.OrderBean;

public interface OrderDao {
	// new
	int saveOrder(OrderBean order);

	// disable
	int deleteOrder(String orderId);
	
	int deleteAll();

	// update
	int updateOrder(OrderBean order);

	// query
	OrderBean getOrderById(String orderId);

	List<OrderBean> getOrdersByOwner(String memberId);

	List<OrderBean> getAllOrders();
}
