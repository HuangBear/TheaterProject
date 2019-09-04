package com.web.dao;

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

	List<OrderBean> getOrdersByOwner(Integer memberNo);

	List<OrderBean> getAllOrders();

	List<OrderBean> getAllAvailable();
}
