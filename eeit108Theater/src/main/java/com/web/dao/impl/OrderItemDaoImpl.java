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
		if (orderItem.getNo() != null)
			// To save an entity bean, primary key must be null
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
	public int deleteOrderItemsByOrderId(String orderId) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE OrderItemBean oi WHERE oi.orderId = :oid";
		Integer cnt = session.createQuery(hql).setParameter("oid", orderId).executeUpdate();
		return cnt;
	}

	@Override
	public int deleteAll() {
		Session session = factory.getCurrentSession();
		String hql = "DELETE OrderItemBean";
		Integer cnt = session.createQuery(hql).executeUpdate();

		return cnt;
	}

	@Override
	public int updateOrderItem(OrderItemBean orderItem) {
		Session session = factory.getCurrentSession();
		if (isExist(orderItem.getNo())) {
			session.update(orderItem);
			return 1;
		}
		// 沒得更新，回傳0
		return 0;
	}

	@Override
	public int discontinueAll() {
		String hql = "UPDATE OrderItem oi SET oi.available = :false";
		Session session = factory.getCurrentSession();
		Integer cnt = session.createQuery(hql).setParameter("false", Boolean.FALSE).executeUpdate();
		return cnt;
	}

	@Override
	public int continueAll() {
		String hql = "UPDATE OrderItem oi SET oi.available = :true";
		Session session = factory.getCurrentSession();
		Integer cnt = session.createQuery(hql).setParameter("true", Boolean.TRUE).executeUpdate();
		return cnt;
	}

	@Override
	public OrderItemBean getOrderItemByNo(Integer orderItemNo) {
		String hql = "FROM OrderItem oi WHERE oi.no = :oino";
		Session session = factory.getCurrentSession();
		OrderItemBean oi = (OrderItemBean) session.createQuery(hql)
				.setParameter("oino", orderItemNo).uniqueResult();
		return oi;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getAllOrderItems() {
		String hql = "FROM OrderItemBean";
		List<OrderItemBean> list = factory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getAllAvailable() {
		String hql = "FROM OrderItemBean oi WHERE oi.available = TRUE";
		List<OrderItemBean> list = factory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getOrderItemsByOrderId(String orderId) {
		String hql = "FROM OrderItemBean oi WHERE oi.orderId = :oid";
		List<OrderItemBean> list = factory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	// chart
	@Override
	public Integer getAllTicket() {
		Session session = factory.getCurrentSession();
		Integer ticket = Integer.valueOf(String.valueOf((Long) session
				.createQuery("SELECT count(*) FROM OrderItemBean oi WHERE oi.type ='ticket' ")
				.uniqueResult()));
		System.out.println("ticket=" + ticket);
		return ticket;
	}

	@Override
	public Integer getAllFood() {
		Session session = factory.getCurrentSession();
		Integer food = Integer.valueOf(String.valueOf((Long) session
				.createQuery("SELECT count(*) FROM OrderItemBean oi WHERE oi.type ='food' ")
				.uniqueResult()));
		System.out.println("food" + food);
		return food;
	}

	@Override
	public Integer getAllDrink() {
		Session session = factory.getCurrentSession();
		Integer drink = Integer.valueOf(String.valueOf((Long) session
				.createQuery("SELECT count(*) FROM OrderItemBean oi WHERE oi.type ='drink' ")
				.uniqueResult()));
		System.out.println("drink" + drink);
		return drink;
	}

}
