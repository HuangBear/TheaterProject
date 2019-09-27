package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.MovieBean;

@Controller
public class AllController {
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/left-sidebar")
	public String leftSidebar()
	{
		return "left-sidebar";
	}
	
	@RequestMapping("/no-sidebar")
	public String noSidebar()
	{
		return "no-sidebar";
	}
	
	@RequestMapping("/right-sidebar")
	public String rightSidebar()
	{
		return "right-sidebar";
	}
	
//	@RequestMapping("/films")
//	public String films()
//	{
//		return "films";
//	}
	
	@RequestMapping("/forums")
	public String forums()
	{
		return "forums";
	}
	
	@RequestMapping("/essay")
	public String essay()
	{
		return "essay";
	}
	
	@RequestMapping("/post")
	public String post()
	{
		return "post";
	}
	
	@RequestMapping("/detail")
	public String detail()
	{
		return "detail";
	}
	
	@RequestMapping("/theater")
	public String theater()
	{
		return "theater";
	}
	
//	@RequestMapping("/ticketing")
//	public String ticketing()
//	{
//		return "ticketing";
//	}
	
	@RequestMapping("/showtimes")
	public String showtimes()
	{
		return "showtimes";
	}
	
	@RequestMapping("/seat")
	public String seat()
	{
		return "seat";
	}
	
	@RequestMapping("/orderconfirm")
	public String orderconfirm()
	{
		return "orderconfirm";
	}
	
	@RequestMapping("/price")
	public String price()
	{
		return "price";
	}
	
	@RequestMapping("/news")
	public String news()
	{
		return "news";
	}
	
	@RequestMapping("/biz")
	public String biz()
	{
		return "biz";
	}
	
	@RequestMapping("/memberservice")
	public String memberservice()
	{
		return "memberservice";
	}
	
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	
	@RequestMapping("/signin")
	public String signin()
	{
		return "signin";
	}
	
	@RequestMapping("/showticket")
	public String showticket()
	{
		return "showticket";
	}
	
	@RequestMapping("/visitorticket")
	public String visitorticket()
	{
		return "visitorticket";
	}
	
	@RequestMapping("/memberinfo")
	public String memberinfo()
	{
		return "memberinfo";
	}
	
	@RequestMapping("/qaservice")
	public String qaservice()
	{
		return "qaservice";
	}
	
	@RequestMapping("/index")
	public String index1()
	{
		return "index";
	}
	
	@RequestMapping("/indexThanos")
	public String indexThanos()
	{
		return "indexThanos";
	}
	
}
