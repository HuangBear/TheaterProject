package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.BulletinBean;
import com.web.service.impl.BulletinBoardService;

@Controller
public class bulletinController {

	@Autowired
	BulletinBoardService service;

	@RequestMapping(value = "/allBulletin", method = RequestMethod.GET)
	public String allBulletinList(Model model)
	{
		List<BulletinBean> list = service.getAllBulletin();
		model.addAttribute("allBulletin", list);
		return "allBulletin";
	}

	@RequestMapping(value = "/newBulletin", method = RequestMethod.GET)
	public String newBulletinList(Model model)
	{
		BulletinBean bb = new BulletinBean();
		model.addAttribute("newBulletin", bb);
		return "newBulletin";
	}

}
