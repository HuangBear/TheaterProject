package com.web.dao;

import java.util.List;

import com.web.entity.OrderItemBean;

public interface OrderItemDao {
	// new
	int saveOrderItem(OrderItemBean orderItem);

	// disable
	int deleteOrderItemByNo(Integer orderItemNo);

	int deleteOrderItemsByOrderNo(Integer orderNo);

	int deleteAll();

	// update
	int updateOrderItem(OrderItemBean orderItem);

	int discontinueAll(); // 全部下架

	int continueAll(); // 全部上架

	// query
	OrderItemBean getOrderItemByNo(Integer orderItemNo);

	List<OrderItemBean> getAllOrderItems();

	List<OrderItemBean> getAllAvailable();

	List<OrderItemBean> getOrderItemsByOrderNo(Integer orderNo);
}
