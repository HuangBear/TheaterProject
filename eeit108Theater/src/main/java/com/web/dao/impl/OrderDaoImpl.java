package com.web.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.OrderDao;
import com.web.entity.OrderBean;

public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	SessionFactory factory;
	
	public Boolean isExist(Integer orderNo) {
		if(factory.getCurrentSession().get(OrderBean.class, orderNo) == null)
			return false;		
		return true;
	}
	
	@Override
	public int saveOrder(OrderBean order) {
		if(order.getNo() != null)
			return 0;
		factory.getCurrentSession().save(order);
		return 1;
	}

	@Override
	public int deleteOrderByNo(Integer orderNo) {
		if(!isExist(orderNo))
			return 0;
		factory.getCurrentSession().delete(orderNo);
		return 1;
	}

	@Override
	public int deleteAll() {
		String hql = "DELETE OrderBean";
		return factory.getCurrentSession().createQuery(hql).executeUpdate();
	}

	@Override
	public int updateOrder(OrderBean order) {
		if(!isExist(order.getNo()))
		return 0;
		factory.getCurrentSession().update(order);
		return 1;
	}

	@Override
	public int discontinueAll() {
		String hql = "UPDATE OrderBean o SET o.available = :false";
		return factory.getCurrentSession().createQuery(hql).setParameter("false", Boolean.FALSE).executeUpdate();
	}

	@Override
	public int continueAll() {
		String hql = "UPDATE OrderBean o SET o.available = :true";
		return factory.getCurrentSession().createQuery(hql).setParameter("true", Boolean.TRUE).executeUpdate();
	}

	@Override
	public OrderBean getOrderByNo(Integer orderNo) {
		return factory.getCurrentSession().get(OrderBean.class, orderNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getOrdersByOwnerId(Integer memberId) {
		String hql = "FROM OrderBean o WHERE o.ownerId = :ownid";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql).setParameter("ownid", memberId).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllOrders() {
		String hql = "FROM OrderBean o";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllAvailable() {
		String hql = "FROM OrderBean o WHERE o.available = :true";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql).setParameter("true", Boolean.TRUE).list();
		return list;
	}

}
