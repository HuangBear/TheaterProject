package com.web.dao;

import java.util.List;

import com.web.entity.ProductBean;

public interface ProductDao {
	// new
	int saveProduct(ProductBean product);

	// disable
	int deleteProduct(Integer productId);

	int deleteProduct(String productName);

	int deleteAll();

	// update
	int updateProduct(ProductBean product);

	// query
	ProductBean getProduct(String productName);

	ProductBean getProduct(Integer productId);

	List<ProductBean> getAllProducts();

	List<ProductBean> getProductsByType(String type);
}
