package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.BulletinBean;
import com.web.service.impl.BulletinBoardService;

@Controller
public class BulletinController {

	@Autowired
	BulletinBoardService service;

	@RequestMapping("/Bulletin")
	public String list(Model model)
	{
		List<BulletinBean> list = service.getAllBulletin();
		model.addAttribute("AllBulletin", list);
		return "Bulletin";
	}
	
	@RequestMapping("/")
	public String index(Model model)
	{
		return "index";
	}
}
