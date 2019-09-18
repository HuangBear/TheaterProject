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
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.tomcat.util.security.Escape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.BulletinBean;
import com.web.service.impl.BulletinServiceImpl;

import data.util.SystemUtils2018;

@Controller
public class BulletinController {

	@Autowired
	BulletinServiceImpl service;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/allBulletin/{bulletin_no}", method = RequestMethod.GET)
	public String edit_allBulletin2newBulletin(@PathVariable("bulletin_no") Integer no, Model model,
			HttpSession httSsession) {
		BulletinBean bb = service.getBulletinBeanById(no);
		httSsession.setAttribute("oldBulletinBean", bb);
		model.addAttribute("bulletinBean", bb);
		return "newBulletin";
	}

	// 找圖片
	@RequestMapping(value = "/getBulletinPicture/{bulletin_no}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest resp,
			@PathVariable Integer bulletin_no) {

		HttpHeaders headers = new HttpHeaders();
		BulletinBean bb = service.getBulletinBeanById(bulletin_no);
		String fileName = bb.getFileName();
		Blob blob = bb.getCoverImage();
		byte[] media = null;
		try {
			int len = (int) blob.length();
			media = blob.getBytes(1, len);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("資料庫讀取圖片出錯" + e.getMessage());
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType=" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	// other2allBulletin
	@RequestMapping(value = "/allBulletin", method = RequestMethod.GET)
	public String other2allBulletin(Model model) {
		List<BulletinBean> list = service.getStatusBulletin();
		model.addAttribute("statusBulletin", list);
		return "allBulletin";
	}

	// other2newBulletin
	@RequestMapping(value = "/newBulletin", method = RequestMethod.GET)
	public String other2newBulletin(Model model) {
		BulletinBean bb = new BulletinBean();
		model.addAttribute("bulletinBean", bb);
		return "newBulletin";
	}

	// post_newBulletin2allBulletin
	@RequestMapping(value = "/newBulletin", method = RequestMethod.POST)
	public String post_newBulletin2allBulletin(@ModelAttribute("bulletinBean") BulletinBean bb,
			BindingResult result, HttpServletRequest request) throws IOException, SQLException {

		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 標題
		testTitle(bb, errorMessage);
		// 內容
		testContext(bb, errorMessage);
		// 日期
		testDate(bb, errorMessage);
		// 折扣
		testDiscount(bb, errorMessage);

		// 圖片存資料庫
		MultipartFile bulletinImage = bb.getBulletinImage();
		String originalFilename = bulletinImage.getOriginalFilename();
		String url = "/WEB-INF/resources/images/bulletin/defaultBulletin.jpg";
		String imgFilename = url.substring(url.lastIndexOf("/") + 1);
		url = context.getRealPath(url);
		byte[] b = bulletinImage.getBytes();
		if (bulletinImage != null && !bulletinImage.isEmpty()) {
			bb.setFileName(originalFilename);
			try {
				b = bulletinImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		} else {
			bb.setFileName(imgFilename);
			System.out.println("imgFilename=" + imgFilename);
			Blob blob = SystemUtils2018.fileToBlob(url);
			bb.setCoverImage(blob);
			System.out.println("insertBlob=" + blob);
		}

		System.out.println("ErrMsg=" + request.getAttribute("ErrMsg"));

		if (!errorMessage.isEmpty()) {
			return "newBulletin";
		} else {
			Date now = new Date();
			bb.setBortingId(bb.getEmployeeId() + now.toString());
			bb.setPostTime(now);
			service.insertNewBulletin(bb);
			return "redirect:/allBulletin";
		}
	}

	// edit_newBulletin2allBulletin
	@RequestMapping(value = "/allBulletin/{bulletin_no}", method = RequestMethod.POST)
	public String edit_newBulletin2allBulletin(@ModelAttribute("bulletinBean") BulletinBean bb,
			BindingResult result, HttpServletRequest request, HttpSession httSsession)
			throws IOException, SQLException {

		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 標題
		testTitle(bb, errorMessage);
		// 內容
		testContext(bb, errorMessage);
		// 日期
		testDate(bb, errorMessage);
		// 折扣
		testDiscount(bb, errorMessage);

		// 圖片存資料庫
		MultipartFile bulletinImage = bb.getBulletinImage();
		String originalFilename = bulletinImage.getOriginalFilename();
		byte[] b = bulletinImage.getBytes();
		if (bulletinImage != null && !bulletinImage.isEmpty()) {
			bb.setFileName(originalFilename);
			try {
				b = bulletinImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
				System.out.println("editBlob=" + blob);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		System.out.println("ErrMsg=" + request.getAttribute("ErrMsg"));

		if (!errorMessage.isEmpty()) {
			System.out.println("資料輸入有錯誤，網頁跳回");
			return "newBulletin";
		} else {
			BulletinBean obb = (BulletinBean) httSsession.getAttribute("oldBulletinBean");
			if (bb.equals(obb)) {
				httSsession.removeAttribute("oldBulletinBean");
				httSsession.setAttribute("change", "未修改任何資料，如不修改請點選'取消編輯'");
				System.out.println("資料未修改，網頁跳回");
				return "newBulletin";
			} else {
				bb.setBortingId(obb.getBortingId());
				bb.setPostTime(new Date());
				service.insertNewBulletin(bb);
				httSsession.removeAttribute("oldBulletinBean");
				httSsession.setAttribute("change", "修改成功");
				System.out.println("資料已修改");
				return "redirect:/allBulletin";
			}
		}
	}

//準備方法

	// 標題
	public void testTitle(BulletinBean bb, HashMap<String, String> errorMessage) {

		if (bb.getTitle() == null || bb.getTitle().trim().length() == 0) {
			errorMessage.put("titleNull", "請輸入標題");
		} else if (bb.getTitle().length() > 50) {
			errorMessage.put("titleOver", "字數超過50字");
		}
		System.out.println("title=" + bb.getTitle());
		System.out.println("title.length=" + bb.getTitle().length());
	}

	// 內容
	public void testContext(BulletinBean bb, HashMap<String, String> errorMessage) {
		if (bb.getContext() == null || bb.getContext().trim().length() == 0) {
			errorMessage.put("contextNull", "請輸入內容");
		} else if (bb.getContext().length() > 300) {
			errorMessage.put("contextOver", "字數大於300...你是有多少話要講?");
		}
		System.out.println("context=" + bb.getContext());
		System.out.println("context.length=" + bb.getContext().trim().length());
	}

	// 日期
	public void testDate(BulletinBean bb, HashMap<String, String> errorMessage) {
		if (bb.getStartDate().length() == 0 || bb.getEndDate().length() == 0) {
			errorMessage.put("dateChoice", "選擇開始與結束日期");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
			Date today = new Date();
			try {
				if (sdf.parse(bb.getStartDate()).before(today)) {
					errorMessage.put("datePassOver", "這位施主!你的開始日已經過去了!!");
					System.out.println(sdf.parse(bb.getStartDate()).before(today));
				} else if (sdf.parse(bb.getEndDate()).before(today)) {
					errorMessage.put("datePassOver", "這位大大!你的結束日經過去了!!");
					System.out.println(sdf.parse(bb.getEndDate()).before(today));
				} else if (sdf.parse(bb.getStartDate()).after(sdf.parse(bb.getEndDate()))) {
					errorMessage.put("datePassOver", "結束時間錯誤");
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		System.out.println("getStartDate=" + bb.getStartDate());
		System.out.println("getEndDate=" + bb.getEndDate());
		System.out.println("bb.getDiscount()=" + bb.getDiscount());
	}

	// 折扣
	public void testDiscount(BulletinBean bb, HashMap<String, String> errorMessage) {
		if (bb.getDiscount() != null) {
			Integer pb = bb.getDiscountPriceBuy();
			Integer pf = bb.getDiscountPriceFree();
			System.out.println("pf=" + pf);
			System.out.println("pb=" + pb);
			if (bb.getDiscount() == 1) {
				if (pb == null || pf == null) {
					errorMessage.put("discountP", "請輸入阿拉伯數字");
				} else if (pf > pb) {
					errorMessage.put("discountP", "折扣比消費金額高?你確定?");
				}
				bb.setDiscountTickBuy(null);
				bb.setDiscountTickFree(null);
			} else if (bb.getDiscount() == 2) {
				Integer tb = bb.getDiscountTickBuy();
				Integer tf = bb.getDiscountTickFree();
				if (tb == 0 || tf == 0) {
					errorMessage.put("discountT", "請選擇");
				} else if (tf > tb) {
					errorMessage.put("discountT", "送的票比買的票多?你確定?");
				}
				bb.setDiscountPriceBuy(null);
				bb.setDiscountPriceFree(null);
			} else {
				bb.setDiscountPriceBuy(null);
				bb.setDiscountPriceFree(null);
				bb.setDiscountTickBuy(null);
				bb.setDiscountTickFree(null);
			}
		} else {
			errorMessage.put("radio", "三選一很難嗎?");
		}
		System.out.println("bb.getDiscountPriceBuy()" + bb.getDiscountPriceBuy());
		System.out.println("bb.getDiscountPriceFree()" + bb.getDiscountPriceFree());
		System.out.println("bb.getDiscountTickBuy()" + bb.getDiscountTickBuy());
		System.out.println("bb.getDiscountTickFree()" + bb.getDiscountTickFree());
	}

	// testBortingId
	public void testBortingId(BulletinBean bb, HashMap<String, String> errorMessage,
			HttpSession httpSession) {
		if (httpSession.getAttribute("oldBulletinBean") != null) {

		}
	}

}
