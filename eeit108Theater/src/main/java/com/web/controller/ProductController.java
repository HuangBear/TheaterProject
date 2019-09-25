package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.ProductBean;
import com.web.service.ProductService;

@Controller
@RequestMapping({ "/admin", "/product" })
public class ProductController {
	final String pac = "product/";

	@Autowired
	ProductService pServ;

	@RequestMapping(value = "/allProducts", method = RequestMethod.GET)
	public String showProducts(Model model) {
		List<ProductBean> list = pServ.getAll();
		model.addAttribute("products", list);
		return pac + "all";
	}
	@RequestMapping(value = "/allProducts", method = RequestMethod.POST)
	public String showNewProducts(Model model) {
		List<ProductBean> list = pServ.getAll();
		model.addAttribute("products", list);
		model.addAttribute("addMsg", "新增商品成功");
		return pac + "all";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String tryAddProduct(Model model) {
		return pac + "add";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(Model model, HttpServletRequest req) {

		Map<String, String> errMsg = new HashMap<>();
		String name = req.getParameter("name");
		Double price = Double.valueOf(req.getParameter("price"));
		String type = req.getParameter("type");
		System.out.println("type = " + type);
		if (name == null || name.trim().equals("")) {
			errMsg.put("name", "請輸入合理的值");
		}
		if (price == null || price == 0.0) {
			errMsg.put("price", "請輸入合理的值");
		}
		if (type == null || type.trim().equals("")
				|| (!type.trim().equals("ticket") && !type.trim().equals("drink") && !type.trim().equals("food"))) {
			errMsg.put("type", "請輸入合理的值");
		}
		if (!errMsg.isEmpty()) {
			model.addAttribute("errMsg", errMsg);
			return pac + "add";
		} else {
			ProductBean pb = new ProductBean(name, price, type);
			pServ.saveProduct(pb);
		}

		return "forward:/" + pac + "allProducts";
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public String tryEditProduct(Model model, HttpServletRequest req) {
		
		return pac + "edit";
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.POST)
	public String editProduct(Model model, HttpServletRequest req) {

		return "forward:/" + pac + "allProducts";
	}

}
