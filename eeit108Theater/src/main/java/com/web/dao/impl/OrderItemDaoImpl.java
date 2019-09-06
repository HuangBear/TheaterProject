package com.web.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.OrderItemDao;
import com.web.entity.OrderItemBean;

@Repository
public class OrderItemDaoImpl implements OrderItemDao {

	@Autowired
	SessionFactory factory;
	
	public boolean isExist(Integer orderItemNo) {
		if (this.getOrderItemByNo(orderItemNo) == null)
			return false;
		return true;
	}
	
	@Override
	public int saveOrderItem(OrderItemBean orderItem) {
		Session session = factory.getCurrentSession();
		if(orderItem.getNo() != null) 
			//To save an entity bean, primary key must be null
			return 0;
		session.save(orderItem);
		return 1;
	}

	@Override
	public int deleteOrderItemByNo(Integer orderItemNo) {
		Session session = factory.getCurrentSession();
		OrderItemBean ob = new OrderItemBean();
		ob.setNo(orderItemNo);
		session.delete(ob);
		return 0;
	}

	@Override
	public int deleteOrderItemsByOrderNo(Integer orderNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrderItem(OrderItemBean orderItem) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int discontinueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int continueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrderItemBean getOrderItemByNo(Integer orderItemNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItemBean> getAllOrderItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItemBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItemBean> getOrderItemsByOrderNo(Integer orderNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
