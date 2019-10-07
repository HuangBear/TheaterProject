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
	
	List<ProductBean> getAllUnavailableProducts();
/**
 * 
 * @param type the type of products to query
 * @param available query all of the products, or available products only.
 * @return
 */
	List<ProductBean> getProductsByType(String type, Boolean available);
	
	List<ProductBean> getAllProductsByType(String type);
	
	List<ProductBean> getTicketsByVersion(String version);
}
