package com.web.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ProductDao;
import com.web.entity.ProductBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory factory;
	

	@Override
	public int saveProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		if(product.getNo() != null) 
			//To save an entity bean, primary key must be null
			return 0;
		session.save(product);
		return 1;
	}

	@Override
	public int deleteProductByNo(Integer productNo) {
		Session session = factory.getCurrentSession();
		String hql="DELETE ProductBean p WHERE p.no = :pno";
		int cnt = session.createQuery(hql).setParameter("pno", productNo).executeUpdate();
		return cnt;
	}

	@Override
	public int deleteProductByName(String productName) {
		Session session = factory.getCurrentSession();
		String hql="DELETE ProductBean p WHERE p.name = :pname";
		int cnt = session.createQuery(hql).setParameter("pname", productName).executeUpdate();
		return cnt;
	}

	@Override
	public int deleteAll() {
		Session session = factory.getCurrentSession();
		String hql="DELETE ProductBean";
		int cnt = session.createQuery(hql).executeUpdate();
		return cnt;
	}

	@Override
	public int updateProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		session.update(product);
		return 1;
	}

	@Override
	public int discontinueAll() {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ProductBean p SET p.available = :false";
		int cnt = session.createQuery(hql).setParameter("false", Boolean.FALSE).executeUpdate();
		return cnt;
	}

	@Override
	public int continueAll() {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ProductBean p SET p.available = :true";
		int cnt = session.createQuery(hql).setParameter("true", Boolean.TRUE).executeUpdate();
		return cnt;
	}

	@Override
	public ProductBean getProductByName(String productName) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean p WHERE p.name = :name";
		ProductBean pb = (ProductBean)session.createQuery(hql).setParameter("name", productName).getSingleResult();
		return pb;
	}

	@Override
	public ProductBean getProductByNo(Integer productNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean p WHERE p.no = :no";
		ProductBean pb = (ProductBean)session.createQuery(hql).setParameter("no", productNo).getSingleResult();
		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean";
		List<ProductBean> pb = session.createQuery(hql).getResultList();
		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllAvailableProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean p  WHERE p.available = :true";
		List<ProductBean> pb = session.createQuery(hql).setParameter("true", Boolean.TRUE).getResultList();
		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByType(String type) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean p  WHERE p.type = :type";
		List<ProductBean> pb = session.createQuery(hql).setParameter("type", type).getResultList();
		return pb;
	}

}
