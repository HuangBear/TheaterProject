package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.BullentinBean;
import com.web.service.impl.BulletinBoardService;

@Controller
public class BullentinController {

	@Autowired
	BulletinBoardService service;

	@RequestMapping("/Bullentin")
	public String list(Model model)
	{
		List<BullentinBean> list = service.getAllBullentin();
		model.addAttribute("AllBullentin", list);
		return "Bullentin";
	}
	

}
