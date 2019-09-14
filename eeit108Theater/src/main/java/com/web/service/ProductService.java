package com.web.service;

import java.util.List;

import com.web.entity.MemberBean;
import com.web.entity.ProductBean;
import com.web.entity.SeatBean;
import com.web.entity.TimeTableBean;

public interface ProductService {

	int saveProduct(ProductBean product);

	int deleteProductByNo(Integer productNo);

	int deleteProductByName(String productName);

	int deleteAll();

	int updateProduct(ProductBean product);

	int discontinueAll();

	int continueAll();

	TimeTableBean getTimeTableByNo(Integer no);
	
	MemberBean getMemberByNo(Integer no);
	
	ProductBean getProductByName(String productName);

	ProductBean getProductByNo(Integer productNo);

	List<ProductBean> getAll();

	List<ProductBean> getAllAvailableProducts();

	List<ProductBean> getProductsByType(String type);
	List<SeatBean> getSeatsByTimeTable(Integer timeTableNo);

}