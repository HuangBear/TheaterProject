package com.web.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String getNewBulletin(Model model)
	{
		BulletinBean bb = new BulletinBean();
		model.addAttribute("getNewBulletin", bb);
		return "newBulletin";
	}

	@RequestMapping(value = "/newBulletin", method = RequestMethod.POST)
	public String postNewBulletin(@ModelAttribute("getNewBulletin") BulletinBean bb,
			BindingResult result, HttpServletRequest request)
			throws UnsupportedEncodingException, ParseException
	{
		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);
		request.setCharacterEncoding("UTF-8");

		if (bb.getTitle() == null || bb.getTitle().trim().length() == 0)
		{
			errorMessage.put("titleNull", "請輸入標題");
		} else if (bb.getTitle().length() > 30)
		{
			errorMessage.put("titleOver", "字數超過30字");
		}
		System.out.println("titleNull=" + bb.getTitle());
		System.out.println("titleOver=" + bb.getTitle().length());

		if (bb.getContext() == null || bb.getContext().trim().length() == 0)
		{
			errorMessage.put("contextNull", "請輸入內容");
		} else if (bb.getContext().length() > 300)
		{
			errorMessage.put("contextOver", "字數大於300...你是有多少話要講?");
		}
		System.out.println("contextNull=" + bb.getContext());
		System.out.println("contextOver=" + bb.getContext().trim().length());

		if (bb.getStartDate().length() == 0 || bb.getEndDate().length() == 0)
		{
			errorMessage.put("dateChoice", "選擇開始與結束日期");
		} else
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
			Date today = new Date();
			if (sdf.parse(bb.getStartDate()).before(today))
			{
				errorMessage.put("datePassOver", "這位施主!你的開始日已經過去了!!");
				System.out.println(sdf.parse(bb.getStartDate()).before(today));
			}
			if (sdf.parse(bb.getEndDate()).before(today))
			{
				errorMessage.put("datePassOver", "這位大大!你的結束日經過去了!!");
				System.out.println(sdf.parse(bb.getEndDate()).before(today));
			}
		}
		System.out.println("getStartDate=" + bb.getStartDate());
		System.out.println("getEndDate=" + bb.getEndDate());

		System.out.println(bb.getDiscount());

		if (bb.getDiscount() != null)
		{
			if (bb.getDiscount() == 1)
			{
				Integer pb = bb.getDiscountPriceBuy();
				Integer pf = bb.getDiscountPriceFree();
				if (pb == null || pf == null)
				{
					errorMessage.put("discountPB", "請輸入阿拉伯數字");
				} else if (pf > pb)
				{
					errorMessage.put("discountPB", "折扣比消費金額高?你確定?");
				}
				System.out.println(pb + "++" + pf);
			}
			if (bb.getDiscount() == 2)
			{
				Integer tb = bb.getDiscountTickBuy();
				Integer tf = bb.getDiscountTickFree();
				if (tb == 0 || tf == 0)
				{
					errorMessage.put("discountPT", "請選擇");
				} else if (tf > tb)
				{
					errorMessage.put("discountPT", "送的比買的多?你確定?");
				}
			}
		}
		errorMessage.put("radio", "三選一很難嗎?");

		System.out.println(request.getAttribute("ErrMsg"));
		return null;
	}
}
