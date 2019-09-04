package com.web.dao;

import java.util.List;

import com.web.entity.OrderItemBean;

public interface OrderItemDao {
	// new
	int saveOrderItem(OrderItemBean orderItem);

	// disable
	int deleteOrderItem(String orderItemId);

	int deleteOrderItemsByOrder(String orderId);

	int deleteAll();

	// update
	int updateOrderItem(OrderItemBean orderItem);

	// query
	OrderItemBean getOrderItem(String orderItemId);

	List<OrderItemBean> getAllOrderItems();

	List<OrderItemBean> getOrderItemsByOrder(String orderId);
}
