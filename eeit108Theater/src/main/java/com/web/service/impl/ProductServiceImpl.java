package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ProductDao;
import com.web.entity.ProductBean;

@Service
public class ProductServiceImpl{
	@Autowired
	ProductDao pdao;

	
	public int saveProduct(ProductBean product) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int deleteProductByNo(Integer productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int deleteProductByName(String productName) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int updateProduct(ProductBean product) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int discontinueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int continueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public ProductBean getProductByName(String productName) {		
		return pdao.getProductByName(productName);
	}

	
	public ProductBean getProductByNo(Integer productNo) {
		return pdao.getProductByNo(productNo);
	}

	
	public List<ProductBean> getAll() {
		return pdao.getAll();
	}

	
	public List<ProductBean> getAllAvailableProducts() {
		return pdao.getAllAvailableProducts();
	}

	
	public List<ProductBean> getProductsByType(String type) {
		return pdao.getProductsByType(type);
	}
}
