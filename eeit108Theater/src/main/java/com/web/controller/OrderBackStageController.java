package com.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.OrderBean;
import com.web.service.OrderService;

@Controller
public class OrderBackStageController {
	final static String pac = "backStageOrder/";
	@Autowired
	OrderService oServ;

	@RequestMapping(value = "/admin/ticket", method = RequestMethod.GET)
	public String showChoose() {
		return pac + "choose";
	}

	@RequestMapping(value = "/backOrder/queryOrder", method = RequestMethod.GET)
	public String showSearchForm() {
		System.out.println("showSearchForm called");
		return pac + "findOrder";
	}

	@RequestMapping(value = "/backOrder/queryOrder", method = RequestMethod.POST)
	public String searchOrder(@RequestParam("orderId") String orderId, @RequestParam("phone") String phone,
			Model model) {
		System.out.println("searchOrder called");
		System.out.println("orderId = " + orderId);
		System.out.println("phone = " + phone);
		System.out.println(phone.matches("[0-9]{4}"));
		Map<String, String> errMsg = new HashMap<>();
		model.addAttribute("errMsg", errMsg);
		if (orderId == null || phone == null || !phone.matches("[0-9]{4}") || !orderId.matches("[A-Z0-9]{9}")) {
			System.out.println("illegal input");
			errMsg.put("error", "請輸入符合格式之資料");
			return pac + "findOrder";
		}
		OrderBean ob = oServ.getOrderById(orderId);
		if (ob == null) {
			System.out.println("Order: " + orderId + " not found");
			errMsg.put("notFound", "該筆訂單不存在");
			return pac + "findOrder";
		} else {
			System.out.println("Order: " + orderId + " found");
			System.out.println(ob.getOrderItemsDetail());
			String ownerPhone = ob.getOwnerPhone();
			ownerPhone = ownerPhone.substring(ownerPhone.length() - 4);
			if (!ownerPhone.equals(phone)) {
				model.addAttribute("oid", orderId);
				errMsg.put("wrongPhone", "手機末四碼錯誤");
				return pac + "findOrder";
			}
		}
		model.addAttribute("order", ob);
		return pac + "orderDetail";
	}

	@RequestMapping(value = "/backOrder/checkOrder", method = RequestMethod.POST)
	public String checkOrder(@RequestParam("orderId") String orderId, Model model) {
		OrderBean ob = oServ.getOrderById(orderId);
		ob.setChecked(true);
		oServ.updateOrder(ob);
		model.addAttribute("order", ob);
		return pac + "orderDetail";
	}
}
