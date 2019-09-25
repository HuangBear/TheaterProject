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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.web.entity.BulletinBean;
import com.web.equator.BulletinEquator;
import com.web.service.impl.BulletinServiceImpl;

import data.util.SystemUtils2018;

@Controller
@RequestMapping(value = "/admin")
public class BulletinController {

	@Autowired
	BulletinServiceImpl service;
	@Autowired
	ServletContext context;

	final String Root = "admin/";

	// other2bulletin_all
	@RequestMapping(value = "/bulletin_all", method = RequestMethod.GET)
	public String other2bulletin_all(Model model) {
		List<List<BulletinBean>> list = service.getStatsBulletin();
		model.addAttribute("statusBulletin", list);
		return Root + "bulletin_all";
	}

	// other2bulletin_new
	@RequestMapping(value = "/bulletin_new", method = RequestMethod.GET)
	public String other2bulletin_new(Model model) {
		BulletinBean bb = new BulletinBean();
		model.addAttribute("bulletinBean", bb);
		return Root + "bulletin_new";
	}

	// edit_bulletin_all2bulletin_new
	@RequestMapping(value = "/bulletin_all/edit", method = RequestMethod.GET)
	public String edit_bulletin_all2bulletin_new(Model model, HttpServletRequest req) {
		Integer no = Integer.valueOf(req.getParameter("no"));
		BulletinBean bb = service.getBulletinBeanById(no);
		List<BulletinBean> list = service.getSameBulletinByBortingId(no);
		model.addAttribute("bulletinBean", bb);
		model.addAttribute("sameBulletinBean", list);
		return Root + "bulletin_edit";
	}

	// find picture
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

	// AJAX Find image
	@RequestMapping(value = "/ajaxImg")
	@ResponseBody
	public String ajaxImgFunction(Integer no) throws Exception {
//		System.out.println("ajaxImg");
		Blob blob = service.getBulletinBeanById(no).getCoverImage();
//		System.out.println(blob);
//		System.out.println(blob.toString());
		// 得到图片的二进制数据
		byte[] image = blob.getBytes(1, (int) blob.length());
		System.out.println("JSON.toJSONString(image)=" + JSON.toJSONString(image));
		return JSON.toJSONString(image);
	}

	// AJAX Find context
	@RequestMapping(value = "/ajaxContext", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxContextFunction(Integer no) throws Exception {
		String str = service.getBulletinBeanById(no).getContext();
		System.out.println("str" + str);
		return str;
	}

	// post_bulletin_new2bulletin_all
	@RequestMapping(value = "/bulletin_new", method = RequestMethod.POST)
	public String post_bulletin_new2bulletin_all(@ModelAttribute("bulletinBean") BulletinBean bb,
			BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes)
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
		String url = "/WEB-INF/resources/images/bulletin/defaultBulletin.jpg";
		String imgFilename = url.substring(url.lastIndexOf("/") + 1);
		String photoType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		url = context.getRealPath(url);
		byte[] b = bulletinImage.getBytes();
		if (photoType.equals("jpg") || photoType.equals("jpeg") || photoType.equals("png")) {
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
		} else {
			errorMessage.put("photo", "請上傳jpeg/jpg/png");
		}

		System.out.println("ErrMsg=" + request.getAttribute("ErrMsg"));
		if (!errorMessage.isEmpty()) {
			return Root + "bulletin_new";
		} else {
			Date now = new Date();
			redirectAttributes.addFlashAttribute("changeMsg", "新增成功");
			System.out.println("新增成功");
			bb.setBortingId(bb.getEmployeeId() + "_" + now.toString());
			bb.setPostTime(now);
			service.insertNewBulletin(bb);
			return "redirect:/" + Root + "bulletin_all";
		}
	}

	// edit_bulletin_new2bulletin_all
	@RequestMapping(value = "/bulletin_all/{bulletin_no}", method = RequestMethod.POST)
	public String edit_bulletin_new2bulletin_all(@ModelAttribute("bulletinBean") BulletinBean bb,
			BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws IOException, SQLException, ParseException {
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
//		System.out.println("byte[] b =" + b);
//		System.out.println("getBulletinImage=" + bb.getBulletinImage());
//		System.out.println("originalFilename=" + originalFilename);
//		System.out.println("bb.getNo()=" + bb.getNo());
		BulletinBean obb = service.getBulletinBeanById((bb.getNo()));
		Integer flag = null;
		if (originalFilename != null && !originalFilename.isEmpty()) {
			String photoType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		bb.setPostTime(sdf.parse(sdf.format(new Date())));
		bb.setCountNum(obb.getCountNum() + 1);
		bb.setEmployee(obb.getEmployee());
		// 判断属性是否完全相等
		System.out.println("bb.getCoverImage()=" + bb.getCoverImage());
		System.out.println("obb.getCoverImage()=" + obb.getCoverImage());
		System.out.println("判断属性是否完全相等");
		System.out.println("(obb.getCoverImage() != bb.getCoverImage())="
				+ (obb.getCoverImage() != bb.getCoverImage()));
		BulletinEquator et = new BulletinEquator();
		boolean bet = et.BEquator(bb, obb);
		System.out.println("BEquator(bb, obb)=" + bet);
		System.out.println("ErrMsg=" + request.getAttribute("ErrMsg"));
		// 存入
		if (!errorMessage.isEmpty()) {
			System.out.println("資料輸入有錯誤，網頁跳回");
			return Root + "bulletin_new";
		} else {
			if (bet) {
				errorMessage.put("changeMsg", "未修改任何資料，如不修改請點選'取消編輯'");
				System.out.println("資料未修改，網頁跳回");
				return Root + "bulletin_new";
			} else {
				redirectAttributes.addFlashAttribute("changeMsg", "資料修改成功");
				service.insertNewBulletin(bb);
				System.out.println("資料已修改");
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
		return "redirect:/" + Root + "bulletin_all";

	}

	// restoreSstatus
	@RequestMapping(value = "/bulletin_all/restore")
	public String restoreSstatus(HttpServletRequest req, RedirectAttributes redirectAttributes) {
		Integer no = Integer.valueOf(req.getParameter("no"));
		int deleteReturn = service.updateBulletinBeanById(no, true);
		redirectAttributes.addFlashAttribute("changeMsg", "資料復原");
		System.out.println("資料已復原，總共處理相同bortingId=" + no + " 的 " + deleteReturn + "筆資料");
		return "redirect:/" + Root + "bulletin_all";
	}

//	準備方法
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
		System.out.println("getDiscount()=" + bb.getDiscount());
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
}
