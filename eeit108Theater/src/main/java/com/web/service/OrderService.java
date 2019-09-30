package com.web.service;

import java.util.List;

import com.web.entity.OrderBean;

public interface OrderService {

	int saveOrder(OrderBean order);

	int deleteOrderByNo(Integer orderNo);

	int deleteAll();

	int updateOrder(OrderBean order);

	int discontinueAll();

	int continueAll();

	OrderBean getOrderByNo(Integer orderNo);
	
	OrderBean getOrderById(String orderId);

	int setSeatToOrder(OrderBean ob, String[] seats);

	List<OrderBean> getOrdersByOwnerId(String memberId);

	List<OrderBean> getGuestOrders(String ownerEmail,String ownerPhone, Boolean checkStatus);
	
	List<OrderBean> getMemberOrders(String memberId, Boolean checkStatus);
	
	List<OrderBean> getAllOrders();

	List<OrderBean> getAllAvailable();

}