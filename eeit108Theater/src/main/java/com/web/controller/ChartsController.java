package com.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class ChartsController {

	String Root = "admin/";

	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String just_try(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("charts");
		model.addAttribute("updatedTime", new Date());
		return Root + "charts";
	}

}
