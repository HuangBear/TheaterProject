package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MemberDao;
import com.web.dao.ProductDao;
import com.web.dao.TimeTableDao;
import com.web.entity.MemberBean;
import com.web.entity.ProductBean;
import com.web.entity.TimeTableBean;
import com.web.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDao pdao;
	@Autowired
	TimeTableDao tdao;
	@Autowired
	MemberDao mdao;
	
	@Override
	public int saveProduct(ProductBean product) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int deleteProductByNo(Integer productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int deleteProductByName(String productName) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
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
		return pdao.getProductByName(productName);
	}

	
	@Override
	public ProductBean getProductByNo(Integer productNo) {
		return pdao.getProductByNo(productNo);
	}

	
	@Override
	public List<ProductBean> getAll() {
		return pdao.getAll();
	}

	
	@Override
	public List<ProductBean> getAllAvailableProducts() {
		return pdao.getAllAvailableProducts();
	}

	
	@Override
	public List<ProductBean> getProductsByType(String type) {
		return pdao.getProductsByType(type);
	}


	@Override
	public TimeTableBean getTimeTableByNo(Integer no) {
		return tdao.getTimeTableByNo(no);
	}


	@Override
	public MemberBean getMemberByNo(Integer no) {
		return mdao.getMemberByNo(no);
	}
}
