package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class ChartsController {

	String Root = "admin/";

	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String just_try(Model model, HttpServletRequest req) {
		System.out.println("charts");
		return Root + "charts";
	}

}
