package com.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.OrderItemBean;
import com.web.service.impl.ProductServiceImpl;

@Transactional
@Controller
public class OrderController {
	@Autowired
	ProductServiceImpl service;

	@RequestMapping("/allProducts")
	public String showAllProduct(Model model) {
		model.addAttribute("products", service.getAll());
		return "allProducts";
	}

	@RequestMapping("/showProducts")
	public String showProductByType(Model model) {
		model.addAttribute("foods", service.getProductsByType("food"));
		model.addAttribute("drinks", service.getProductsByType("drink"));
		model.addAttribute("tickets", service.getProductsByType("ticket"));
		return "productsByType";
	}

	@RequestMapping("/order")
	public String showOrder(Model model, HttpServletRequest req) {
		System.out.println("======showOrder");
		List<OrderItemBean> list = new ArrayList<>();
		Map<String, String[]> readOnly = req.getParameterMap();
		System.out.println("=====beginFor");
		for (String key : req.getParameterMap().keySet()) {
			if (readOnly.get(key)[0].equals("") || readOnly.get(key)[0].equals("0"))
				;
			else {
				OrderItemBean ob = new OrderItemBean();
				ob.setAvailable(true);
				ob.setItemName(key);
				Integer unit = Integer.valueOf(readOnly.get(key)[0]);
				ob.setQuantity(unit == null ? 0 : unit);
				ob.setSumPrice(ob.getQuantity() * ob.getUnitPrice());
				list.add(ob);
			}
		}
		System.out.println("=====endFor");
		model.addAttribute("orderItems", list);
		System.out.println("======RETURN showOrder");
		return "orderItems";
	}

}
