package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class _Controller {
	@RequestMapping("/")
	public String index(Model model)
	{
		return "index";
	}
}
