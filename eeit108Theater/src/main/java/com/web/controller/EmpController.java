package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.EmployeeBean;
import com.web.service.EmployeeService;

@Controller
public class EmpController {

	@Autowired
	ServletContext context;
	@Autowired
	EmployeeService service;
	
	
	@RequestMapping("/index2")
	public String backstageindex(Model model) {
		
		return "index2";
	}
	@RequestMapping("/empIndex_include2")
	public String list1(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "empIndex_include2";
	}
	
//	@RequestMapping("/backstage/empIndex_include2")
//	public String list(Model model) {
//		List<EmployeeBean> list = service.getAllEmployees();
//		model.addAttribute("employees", list);
//		return "backstage/empIndex_include2";
//	}
}
