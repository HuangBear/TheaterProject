package com.web.dao;

import java.util.List;

import com.web.entity.ProductBean;

public interface ProductDao {
	// new
	int saveProduct(ProductBean product);

	// disable
	int deleteProductByNo(Integer productNo);

	int deleteProductByName(String productName);

	int deleteAll();

	// update
	int updateProduct(ProductBean product);
	
	int discontinueAll(); //全部下架
	
	int continueAll(); //全部上架

	// query
	ProductBean getProductByName(String productName);

	ProductBean getProductByNo(Integer productNo);

	List<ProductBean> getAll();
	
	List<ProductBean> getAllAvailableProducts();	

	List<ProductBean> getProductsByType(String type);
}
