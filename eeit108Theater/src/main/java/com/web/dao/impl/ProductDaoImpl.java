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
	public ProductBean getProductByName(String productName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductBean getProductByNo(Integer productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductBean> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductBean> getAllAvailableProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductBean> getProductsByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

}
