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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.web.entity.BulletinBean;
import com.web.equator.BulletinEquator;
import com.web.service.BulletinService;

import data.util.SystemUtils2018;

@Controller
@RequestMapping(value = "/admin")
public class BulletinController {

	@Autowired
	BulletinService service;
	@Autowired
	ServletContext context;

	final String Root = "admin/";

	// other2bulletin_all
	@RequestMapping(value = "/bulletin_all", method = RequestMethod.GET)
	public String other2bulletin_all(Model model, HttpServletRequest req) {
		System.out.println("other2bulletin_all");
		List<List<BulletinBean>> list = service.getStatsBulletin();
//		String fn = req.getParameter("fn");
//		String url = "";
//		if(fn!=null) {url="#+fn;}
		model.addAttribute("updatedTime", new Date());
		model.addAttribute("statusBulletin", list);
		return Root + "bulletin_all";
	}

	// other2bulletin_add
	@RequestMapping(value = "/bulletin_add", method = RequestMethod.GET)
	public String other2bulletin_add(Model model) {
		System.out.println("other2bulletin_add");
		BulletinBean bb = new BulletinBean();
		model.addAttribute("updatedTime", new Date());
		model.addAttribute("bulletinBean", bb);
		return Root + "bulletin_add";
	}

	// edit_bulletin_all2bulletin_add
	@RequestMapping(value = "/bulletin_all/edit", method = RequestMethod.GET)
	public String edit_bulletin_all2bulletin_add(Model model, HttpServletRequest req) {
		System.out.println("edit_bulletin_all2bulletin_add");
		Integer no = Integer.valueOf(req.getParameter("no"));
		BulletinBean bb = service.getBulletinBeanById(no);
		List<BulletinBean> list = service.getSameBulletinByBortingId(no);
		model.addAttribute("bulletinBean", bb);
		model.addAttribute("sameBulletinBean", list);
		model.addAttribute("updatedTime", new Date());
		return Root + "bulletin_edit";
	}

	// find picture
	@RequestMapping(value = "/getBulletinPicture/{bulletin_no}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest resp,
			@PathVariable Integer bulletin_no) {
		System.out.println("getPicture");
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

	// AJAX Find image
	@RequestMapping(value = "/ajaxImg")
	@ResponseBody
	public String ajaxImgFunction(Integer no) throws Exception {
		System.out.println("ajaxImgFunction");
//		System.out.println("ajaxImg");
		Blob blob = service.getBulletinBeanById(no).getCoverImage();
//		System.out.println(blob);
//		System.out.println(blob.toString());
		// 得到图片的二进制数据
		byte[] image = blob.getBytes(1, (int) blob.length());
		System.out.println("JSON.toJSONString(image)=" + JSON.toJSONString(image));
		return JSON.toJSONString(image);
	}

	// AJAX Find title
	@RequestMapping(value = "/ajaxTitle", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxTitleFunction(Integer no) throws Exception {
		System.out.println("ajaxTitleFunction");
		String str = service.getBulletinBeanById(no).getTitle();
		System.out.println("str" + str);
		return str;
	}

	// AJAX Find context
	@RequestMapping(value = "/ajaxContext", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxContextFunction(Integer no) throws Exception {
		System.out.println("ajaxContextFunction");
		String str = service.getBulletinBeanById(no).getContext();
		System.out.println("str" + str);
		return str;
	}

	// post_bulletin_add2bulletin_all
	@RequestMapping(value = "/bulletin_add/add", method = RequestMethod.POST)
	public String post_bulletin_add2bulletin_all(Model model, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws IOException, SQLException {
		System.out.println("post_bulletin_add2bulletin_all");
		BulletinBean bb = new BulletinBean();
		HashMap<String, String> errorMessage = new HashMap<>();
		req.setAttribute("ErrMsg", errorMessage);
		System.out.println("hello");
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 標題
		testTitle(bb, req, errorMessage);
		// 內容
		testContext(bb, req, errorMessage);
		// 日期
		testDate(bb, req, errorMessage);
		// 折扣
		testDiscount(bb, req, errorMessage);
		// 圖片存資料庫
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		MultipartFile bulletinImage = multipartRequest.getFile("bulletinImage");
		String originalFilename = bulletinImage.getOriginalFilename();
		System.out.println(originalFilename);
		String url = "/WEB-INF/resources/images/bulletin/defaultBulletin.png";
		String imgFilename = url.substring(url.lastIndexOf("/") + 1);
		String photoType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

		url = context.getRealPath(url);
		byte[] b = bulletinImage.getBytes();
		// 如果沒有default圖片，if要打開
//		if (photoType.equals("jpg") || photoType.equals("jpeg") || photoType.equals("png")) {
		// 如果沒有default圖片，if要打開
		if (bulletinImage != null && !bulletinImage.isEmpty()) {
			bb.setFileName(originalFilename);
			System.out.println("photoType=" + photoType);
			try {
				b = bulletinImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
				System.out.println("insertBlob=" + blob);
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
		// 如果沒有default圖片，else要打開
//		} else {
//			errorMessage.put("photo", "請上傳jpeg/jpg/png");
//		}
		// 如果沒有default圖片，else要打開
		System.out.println("ErrMsg=" + req.getAttribute("ErrMsg"));
		if (!errorMessage.isEmpty()) {
			model.addAttribute("updatedTime", new Date());
			model.addAttribute("bulletinBean", bb);
			return Root + "bulletin_add";
		} else {
			Date now = new Date();
//			redirectAttributes.addAttribute("changeMsg", "新增成功");
			redirectAttributes.addFlashAttribute("changeMsg", "新增成功");
			System.out.println("新增成功");
			Integer employeeId = Integer.valueOf(req.getParameter("employeeId"));
			bb.setEmployeeId(employeeId);
			bb.setBortingId(employeeId + "_" + now.toString());
			bb.setPostTime(now);
			service.insertNewBulletin(bb);
			model.addAttribute("updatedTime", new Date());
			return "redirect:/" + Root + "bulletin_all";
		}
	}

	// edit_bulletin_edit2bulletin_all
	@RequestMapping(value = "/bulletin_edit/edit", method = RequestMethod.POST)
	public String edit_bulletin_edit2bulletin_all(Model model, HttpServletRequest req,
			RedirectAttributes redirectAttributes)
			throws IOException, SQLException, ParseException {
		System.out.println("edit_bulletin_edit2bulletin_all");
		BulletinBean bb = new BulletinBean();
		HashMap<String, String> errorMessage = new HashMap<>();
		req.setAttribute("ErrMsg", errorMessage);
		System.out.println("hello");
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 標題
		testTitle(bb, req, errorMessage);
		// 內容
		testContext(bb, req, errorMessage);
		// 日期
		testDate(bb, req, errorMessage);
		// 折扣
		testDiscount(bb, req, errorMessage);
		// 圖片存資料庫
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		MultipartFile bulletinImage = multipartRequest.getFile("bulletinImage");
		String originalFilename = bulletinImage.getOriginalFilename();
		System.out.println(originalFilename);
		String url = "/WEB-INF/resources/images/bulletin/defaultBulletin.png";
		String imgFilename = url.substring(url.lastIndexOf("/") + 1);
		String photoType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		url = context.getRealPath(url);
		byte[] b = bulletinImage.getBytes();
		Integer no = Integer.valueOf(req.getParameter("no"));
		System.out.println(no);
//		System.out.println("byte[] b =" + b);
//		System.out.println("getBulletinImage=" + bb.getBulletinImage());
//		System.out.println("originalFilename=" + originalFilename);
//		System.out.println("bb.getNo()=" + bb.getNo());
		BulletinBean obb = service.getBulletinBeanById(no);
		Integer flag = null;
		if (originalFilename != null && !originalFilename.isEmpty()) {
			System.out.println(photoType);
			if (photoType.equals("jpg") || photoType.equals("jpeg") || photoType.equals("png")) {
				bb.setFileName(originalFilename);
				b = bulletinImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
				flag = 1;
				System.out.println(flag);
				System.out.println("editBlob=" + blob);
			} else {
				errorMessage.put("photo", "請上傳jpeg/jpg/png");
			}

		} else {
			bb.setCoverImage(obb.getCoverImage());
			bb.setFileName(obb.getFileName());
			System.out.println("Bean加入原始圖片");
		}
		// 補齊資料
		bb.setBortingId(obb.getBortingId());
		bb.setPostTime(obb.getPostTime());
		bb.setCountNum(obb.getCountNum() + 1);
//		Integer.valueOf(req.getAttribute("employeeId"));
		bb.setEmployee(obb.getEmployee());
		bb.setEmployeeId(Integer.valueOf(req.getParameter("employeeId")));
		// 判断属性是否完全相等
		System.out.println("bb.getCoverImage()=" + bb.getCoverImage());
		System.out.println("obb.getCoverImage()=" + obb.getCoverImage());
		System.out.println("判断属性是否完全相等");
		System.out.println("(obb.getCoverImage() == bb.getCoverImage())="
				+ (obb.getCoverImage() == bb.getCoverImage()));
		BulletinEquator et = new BulletinEquator();
		boolean bet = et.BEquator(bb, obb);
		System.out.println("BEquator(bb, obb)=" + bet);
		System.out.println("ErrMsg=" + req.getAttribute("ErrMsg"));

		// 存入
		if (!errorMessage.isEmpty()) {
			System.out.println("資料輸入有錯誤，網頁跳回");
			bb.setNo(no);
			List<BulletinBean> list = service.getSameBulletinByBortingId(no);
			model.addAttribute("bulletinBean", bb);
			model.addAttribute("sameBulletinBean", list);
			model.addAttribute("updatedTime", new Date());
			return Root + "bulletin_edit";
		} else {
			if (bet) {
				errorMessage.put("changeMsg", "未修改任何資料，如不修改請點選'取消編輯'");
				System.out.println("資料未修改，網頁跳回");
				bb = service.getBulletinBeanById(no);
				List<BulletinBean> list = service.getSameBulletinByBortingId(no);
				model.addAttribute("bulletinBean", bb);
				model.addAttribute("sameBulletinBean", list);
				model.addAttribute("updatedTime", new Date());
				return Root + "bulletin_edit";
			} else {
				redirectAttributes.addFlashAttribute("changeMsg", "資料修改成功");
				service.insertNewBulletin(bb);
				System.out.println("資料已修改");
				model.addAttribute("updatedTime", new Date());
				return "redirect:/" + Root + "bulletin_all";
			}
		}
	}

	// deleteSstatus
	@RequestMapping(value = "/bulletin_all/deleteSstatus")
	public String deleteSstatus(HttpServletRequest req, RedirectAttributes redirectAttributes) {
		Integer no = Integer.valueOf(req.getParameter("no"));
		int deleteReturn = service.updateBulletinBeanById(no, false);
		redirectAttributes.addFlashAttribute("changeMsg", "資料刪除");
		System.out.println("資料已刪除，總共處理相同bortingId=" + no + " 的 " + deleteReturn + "筆資料");
		req.setAttribute("updatedTime", new Date());
		return "forward:/" + Root + "bulletin_all";

	}

	// restoreSstatus
	@RequestMapping(value = "/bulletin_all/restore")
	public String restoreSstatus(HttpServletRequest req, RedirectAttributes redirectAttributes) {
		Integer no = Integer.valueOf(req.getParameter("no"));
		int deleteReturn = service.updateBulletinBeanById(no, true);
		redirectAttributes.addFlashAttribute("changeMsg", "資料復原");
		System.out.println("資料已復原，總共處理相同bortingId=" + no + " 的 " + deleteReturn + "筆資料");
		req.setAttribute("updatedTime", new Date());
		return "forward:/" + Root + "bulletin_all";
	}

//	準備方法
	// 標題
	public void testTitle(BulletinBean bb, HttpServletRequest req,
			HashMap<String, String> errorMessage) {
		String title = req.getParameter("title");

		if (title == null || title.trim().length() == 0) {
			errorMessage.put("titleNull", "請輸入標題");
		}
		bb.setTitle(title);
		System.out.println("title=" + title);
		System.out.println("title.length=" + title.trim().length());
	}

	// 內容
	public void testContext(BulletinBean bb, HttpServletRequest req,
			HashMap<String, String> errorMessage) {
		String context = req.getParameter("context");

		if (context == null || context.trim().length() == 0) {
			errorMessage.put("contextNull", "請輸入內容");
		}
		bb.setContext(context);
		System.out.println("context=" + context);
		System.out.println("context.length=" + context.trim().length());
	}

	// 日期
	public void testDate(BulletinBean bb, HttpServletRequest req,
			HashMap<String, String> errorMessage) {
		String from = req.getParameter("from");
		String to = req.getParameter("to");

		if (from.length() == 0 || to.length() == 0) {
			errorMessage.put("dateChoice", "選擇開始與結束日期");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			try {
				if (sdf.parse(from).before(today)) {
					errorMessage.put("datePassOver", "這位施主!你的開始日已經過去了!!");
					System.out.println(sdf.parse(from).before(today));
				} else if (sdf.parse(to).before(today)) {
					errorMessage.put("datePassOver", "這位大大!你的結束日經過去了!!");
					System.out.println(sdf.parse(to).before(today));
				} else if (sdf.parse(from).after(sdf.parse(to))) {
					errorMessage.put("datePassOver", "結束時間錯誤");
				} else {
					bb.setStartDate(from);
					bb.setEndDate(to);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		System.out.println("getStartDate=" + from);
		System.out.println("getEndDate=" + to);
	}

	// 折扣
	public void testDiscount(BulletinBean bb, HttpServletRequest req,
			HashMap<String, String> errorMessage) {
		Integer discount, discountPriceBuy, discountPriceFree, discountTickBuy, discountTickFree;
		discount = Integer.valueOf(req.getParameter("discount"));
		System.out.println(req.getParameter("discount"));
		System.out.println(req.getParameter("discountPriceBuy"));
		System.out.println(req.getParameter("discountPriceFree"));
		System.out.println(req.getParameter("discountTickBuy"));
		System.out.println(req.getParameter("discountTickFree"));

		switch (discount)
		{
		case 1:
			discountPriceBuy = Integer.valueOf(req.getParameter("discountPriceBuy"));
			discountPriceFree = Integer.valueOf(req.getParameter("discountPriceFree"));
			discountTickBuy = null;
			discountTickFree = null;
			break;
		case 2:
			discountPriceBuy = null;
			discountPriceFree = null;
			discountTickBuy = Integer.valueOf(req.getParameter("discountTickBuy"));
			discountTickFree = Integer.valueOf(req.getParameter("discountTickFree"));
			break;
		default:
			discountPriceBuy = null;
			discountPriceFree = null;
			discountTickBuy = null;
			discountTickFree = null;
			break;
		}

		Integer pb = discountPriceBuy;
		Integer pf = discountPriceFree;
		Integer tb = discountTickBuy;
		Integer tf = discountTickFree;
		bb.setDiscount(discount);
		if (discount != null) {
			System.out.println("discount=" + discount);

			if (discount == 1) {
				if (pb == null || pf == null) {
					errorMessage.put("discountP", "請輸入阿拉伯數字");
				} else if (pf > pb) {
					errorMessage.put("discountP", "折扣比消費金額高?你確定?");
				}
				bb.setDiscountPriceBuy(pb);
				bb.setDiscountPriceFree(pf);
				bb.setDiscountTickBuy(null);
				bb.setDiscountTickFree(null);

			} else if (discount == 2) {
				if (tb == 0 || tf == 0) {
					errorMessage.put("discountT", "請選擇");
				} else if (tf > tb) {
					errorMessage.put("discountT", "送的票比買的票多?你確定?");
				}
				bb.setDiscountPriceBuy(null);
				bb.setDiscountPriceFree(null);
				bb.setDiscountTickBuy(tb);
				bb.setDiscountTickFree(tf);
			} else {
				bb.setDiscountPriceBuy(null);
				bb.setDiscountPriceFree(null);
				bb.setDiscountTickBuy(null);
				bb.setDiscountTickFree(null);
			}
		}
		System.out.println("bb.getDiscountPriceBuy()=" + bb.getDiscountPriceBuy());
		System.out.println("bb.getDiscountPriceFree()=" + bb.getDiscountPriceFree());
		System.out.println("bb.getDiscountTickBuy()=" + bb.getDiscountTickBuy());
		System.out.println("bb.getDiscountTickFree()=" + bb.getDiscountTickFree());
	}
}
