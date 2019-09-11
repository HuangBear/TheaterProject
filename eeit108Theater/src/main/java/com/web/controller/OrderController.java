package com.web.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.MemberBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.TimeTableBean;
import com.web.service.MovieService;
import com.web.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ProductService pServ;
	@Autowired
	MovieService mServ;

	String pac = "order/";

	@RequestMapping("/allProducts")
	public String showAllProduct(Model model) {
		model.addAttribute("products", pServ.getAll());
		return pac + "allProducts";
	}

	@RequestMapping({"","/"})
	public String orderBegin(Model model, HttpSession session) {
		
		
	
		System.out.println("====orderBegin Start");
		TimeTableBean tb = pServ.getTimeTableByNo(1);
		System.out.println("====TimeTableBean Got");
		MemberBean mb = pServ.getMemberByNo(1);
		System.out.println("====MemberBean Got");
		
		session.setAttribute("timeTable", tb);
		session.setAttribute("loginMember", mb);
		return pac + "start";
	}

	@RequestMapping("/showProducts")
	public String showProductByType(Model model, HttpSession session) {		
		OrderBean ob = new OrderBean();
		ob.setAvailable(true);
		ob.setTimeTable((TimeTableBean) session.getAttribute("timeTable"));
		MemberBean mb = (MemberBean) session.getAttribute("loginMember");
		if (mb != null) {
			ob.setOwnerEmail(mb.getEmail());
			ob.setOwnerId(mb.getMemberId());
			ob.setOwnerName(mb.getName());
		}
		session.setAttribute("order", ob);
		
		model.addAttribute("foods", pServ.getProductsByType("food"));
		model.addAttribute("drinks", pServ.getProductsByType("drink"));
		model.addAttribute("tickets", pServ.getProductsByType("ticket"));
		return pac + "productsByType";
	}

	@RequestMapping("/makeOrder")
	public String showOrder(Model model, HttpServletRequest req, HttpSession session) {
		
		OrderBean ob = (OrderBean) session.getAttribute("order");
		
		Set<OrderItemBean> set = new HashSet<>();
		ob.setOrderItems(set);
		ob.setTotalPrice(0.0);
		
		
		System.out.println("======showOrder");
		List<OrderItemBean> list = new ArrayList<>();
		Map<String, String[]> readOnly = req.getParameterMap();
		if (readOnly == null)
			System.out.println("=======Map is null");
		else {
			System.out.println("=====beginFor");
			for (String key : req.getParameterMap().keySet()) {
				if (readOnly.get(key)[0] == null || readOnly.get(key)[0].equals("") || readOnly.get(key)[0].equals("0"))
					System.out.println("====key" + key + " is NULL");
				else {
					OrderItemBean oib = new OrderItemBean();
					oib.setAvailable(true);
					oib.setItemName(key);
					Integer unit = Integer.valueOf(readOnly.get(key)[0]);
					oib.setQuantity(unit == null ? 0 : unit);
					oib.setUnitPrice(pServ.getProductByName(key).getPrice());
					oib.setSumPrice(oib.getQuantity() * oib.getUnitPrice());
					ob.setTotalPrice(ob.getTotalPrice() + oib.getSumPrice());
					list.add(oib);
					set.add(oib);
				}
			}
			System.out.println("=====endFor");
		}
		model.addAttribute("orderItems", list);
		//model.addAttribute("order", ob);
		System.out.println("======RETURN showOrder");
		return pac + "orderItems";
	}

}
