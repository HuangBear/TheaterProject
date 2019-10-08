package com.web.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.OrderDao;
import com.web.entity.OrderBean;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SessionFactory factory;

	public Boolean isExist(Integer orderNo) {
		String hql = "FROM OrderBean o WHERE o.no = :ono";
		if (factory.getCurrentSession().createQuery(hql).setParameter("ono", orderNo)
				.uniqueResult() == null)
			return false;
		return true;
	}

	@Override
	public int saveOrder(OrderBean order) {
		if (order.getNo() != null)
			return 0;
		factory.getCurrentSession().save(order);
		return 1;
	}

	@Override
	public int deleteOrderByNo(Integer orderNo) {
		if (!isExist(orderNo))
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
		factory.getCurrentSession().update(order);
		return 1;
	}

	@Override
	public int discontinueAll() {
		String hql = "UPDATE OrderBean o SET o.available = :false";
		return factory.getCurrentSession().createQuery(hql).setParameter("false", Boolean.FALSE)
				.executeUpdate();
	}

	@Override
	public int continueAll() {
		String hql = "UPDATE OrderBean o SET o.available = :true";
		return factory.getCurrentSession().createQuery(hql).setParameter("true", Boolean.TRUE)
				.executeUpdate();
	}

	@Override
	public OrderBean getOrderByNo(Integer orderNo) {
		return factory.getCurrentSession().get(OrderBean.class, orderNo);
	}

	@Override
	public OrderBean getOrderById(String orderId) {
		String hql = "FROM OrderBean o WHERE o.orderId = :oid";
		return (OrderBean) factory.getCurrentSession().createQuery(hql).setParameter("oid", orderId)
				.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getOrdersByOwnerId(String memberId) {
		String hql = "FROM OrderBean o WHERE o.ownerId = :ownid";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql)
				.setParameter("ownid", memberId).list();
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
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql)
				.setParameter("true", Boolean.TRUE).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getGuestOrders(String ownerEmail, String ownerPhone,
			Boolean checkStatus) {
		String hql = "FROM OrderBean o WHERE o.ownerEmail = :email AND o.ownerPhone = :phone AND o.checked = :check ORDER BY o.orderTime";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql)
				.setParameter("email", ownerEmail).setParameter("phone", ownerPhone)
				.setParameter("check", checkStatus).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberOrders(String memberId, Boolean checkStatus) {
		String hql = "FROM OrderBean o WHERE o.ownerId = :mid AND o.checked = :check ORDER BY o.orderTime";
		List<OrderBean> list = factory.getCurrentSession().createQuery(hql)
				.setParameter("mid", memberId).setParameter("check", checkStatus).list();
		return list;
	}

	// chart
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getOrderPerMoon(Date firstDate, Date lastDate) {

		Session session = factory.getCurrentSession();
		List<OrderBean> list = new ArrayList<>();
		list = session
				.createQuery("FROM OrderBean o WHERE o.orderTime BETWEEN :fristDate and :lastDate")
				.setParameter("fristDate", firstDate).setParameter("lastDate", lastDate).list();
		System.out.println(list);
		return list;
	}

}
