package com.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.BulletinBean;
import com.web.service.impl.BulletinBoardService;

import data.util.SystemUtils2018;

@Controller
public class bulletinController {

	@Autowired
	BulletinBoardService service;
	@Autowired
	ServletContext context;

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
	{
		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1)
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 標題
		if (bb.getTitle() == null || bb.getTitle().trim().length() == 0)
		{
			errorMessage.put("titleNull", "請輸入標題");
		} else if (bb.getTitle().length() > 30)
		{
			errorMessage.put("titleOver", "字數超過30字");
		}
		System.out.println("title=" + bb.getTitle());
		System.out.println("title.length=" + bb.getTitle().length());

		// 內容
		if (bb.getContext() == null || bb.getContext().trim().length() == 0)
		{
			errorMessage.put("contextNull", "請輸入內容");
		} else if (bb.getContext().length() > 300)
		{
			errorMessage.put("contextOver", "字數大於300...你是有多少話要講?");
		}
		System.out.println("context=" + bb.getContext());
		System.out.println("context.length=" + bb.getContext().trim().length());

		// 日期
		if (bb.getStartDate().length() == 0 || bb.getEndDate().length() == 0)
		{
			errorMessage.put("dateChoice", "選擇開始與結束日期");
		} else
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
			Date today = new Date();
			try
			{
				if (sdf.parse(bb.getStartDate()).before(today))
				{
					errorMessage.put("datePassOver", "這位施主!你的開始日已經過去了!!");
					System.out.println(sdf.parse(bb.getStartDate()).before(today));
				} else if (sdf.parse(bb.getEndDate()).before(today))
				{
					errorMessage.put("datePassOver", "這位大大!你的結束日經過去了!!");
					System.out.println(sdf.parse(bb.getEndDate()).before(today));
				} else if (sdf.parse(bb.getStartDate()).after(sdf.parse(bb.getEndDate())))
				{
					errorMessage.put("datePassOver", "結束時間錯誤");
				}
			} catch (ParseException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("getStartDate=" + bb.getStartDate());
		System.out.println("getEndDate=" + bb.getEndDate());

		System.out.println(bb.getDiscount());

		// 折扣
		if (bb.getDiscount() != null)
		{
			if (bb.getDiscount() == 1)
			{
				Integer pb = bb.getDiscountPriceBuy();
				Integer pf = bb.getDiscountPriceFree();
				if (pb == null || pf == null)
				{
					errorMessage.put("discountP", "請輸入阿拉伯數字");
				} else if (pf > pb)
				{
					errorMessage.put("discountP", "折扣比消費金額高?你確定?");
				}
//				bb.setDiscountTickBuy(0);
//				bb.setDiscountTickFree(0);

				System.out.println(pb + "++" + pf);
			} else if (bb.getDiscount() == 2)
			{
				Integer tb = bb.getDiscountTickBuy();
				Integer tf = bb.getDiscountTickFree();
				if (tb == 0 || tf == 0)
				{
					errorMessage.put("discountT", "請選擇");
				} else if (tf > tb)
				{
					errorMessage.put("discountT", "送的票比買的票多?你確定?");
				}
				bb.setDiscountPriceBuy(0);
				bb.setDiscountPriceFree(0);
			} else
			{
				bb.setDiscountPriceBuy(0);
				bb.setDiscountPriceFree(0);
			}

		} else
		{
			errorMessage.put("radio", "三選一很難嗎?");
		}
		System.out.println("bb.getDiscountPriceBuy()" + bb.getDiscountPriceBuy());
		System.out.println("bb.getDiscountPriceFree()" + bb.getDiscountPriceFree());
		System.out.println("bb.getDiscountTickBuy()" + bb.getDiscountTickBuy());
		System.out.println("bb.getDiscountTickFree()" + bb.getDiscountTickFree());

		// 圖片存資料庫
		MultipartFile bulletinImage = bb.getBulletinImage();
		if (bulletinImage != null && !bulletinImage.isEmpty())
		{
			String originalFilename = bulletinImage.getOriginalFilename();
			bb.setFileName(originalFilename);
			try
			{
				byte[] b = bulletinImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (IOException | SQLException e)
			{
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		} else
		{
			try
			{
				String url = "data/bulletin/images/defaultBulletin.jpg";
				String imgFilename = url.substring(url.lastIndexOf("/") + 1);
				bb.setFileName(imgFilename);
				System.out.println("imgFilename=" + imgFilename);
				Blob defult = SystemUtils2018.fileToBlob(url.trim());
				bb.setCoverImage(defult);
				System.out.println("default=" + defult);
			} catch (IOException | SQLException e)
			{
				e.printStackTrace();
			}
		}
		System.out.println("ErrMsg=" + request.getAttribute("ErrMsg"));
		if (!errorMessage.isEmpty())
		{
			return "newBulletin";
		} else
		{
			service.insertNewBulletin(bb);
			return "redirect:/newBulletin";
		}

	}
}
