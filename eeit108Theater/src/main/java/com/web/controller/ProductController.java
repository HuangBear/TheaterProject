package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.web.entity.ProductBean;
import com.web.service.ProductService;

@Controller
@RequestMapping({ "/admin", "/product" })
public class ProductController {
	final String pac = "product/";

	@Autowired
	ProductService pServ;

	@RequestMapping(value = "/allProducts", method = RequestMethod.GET)
	public String showProducts(Model model) {
		List<ProductBean> list = pServ.getAllAvailableProducts();
		List<ProductBean> unList = pServ.getAllUnavailableProducts();
		model.addAttribute("products", list);
		model.addAttribute("unproducts", unList);
		return pac + "all";
	}

	@RequestMapping(value = "/allProducts", method = RequestMethod.POST)
	public String showNewProducts(Model model) {
		List<ProductBean> list = pServ.getAllAvailableProducts();
		List<ProductBean> unList = pServ.getAllUnavailableProducts();
		model.addAttribute("products", list);
		model.addAttribute("unproducts", unList);
		return pac + "all";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String tryAddProduct(Model model) {
		return pac + "add";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(Model model, HttpServletRequest req) {

		Map<String, String> errMsg = new HashMap<>();
		String name = req.getParameter("name");
		Double price = Double.valueOf(req.getParameter("price"));
		String type = req.getParameter("type");
		System.out.println("type = " + type);
		if (name == null || name.trim().equals("")) {
			errMsg.put("name", "請輸入符合規範的值");
		}
		if (price == null || price == 0.0) {
			errMsg.put("price", "請輸入符合規範的值");
		}
		if (type == null || type.trim().equals("")
				|| (!type.trim().equals("ticket") && !type.trim().equals("drink") && !type.trim().equals("food"))) {
			errMsg.put("type", "請輸入符合規範的值");
		}
		if (!errMsg.isEmpty()) {
			model.addAttribute("errMsg", errMsg);
			return pac + "add";
		} else {
			ProductBean pb = new ProductBean(name, price, type);
			try {
				pServ.saveProduct(pb);
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("add product error when save");
				errMsg.put("save", "此商品已存在");
				model.addAttribute("errMsg", errMsg);
				return pac + "add";
			}
		}
		model.addAttribute("sysMsg", "新增商品 \"" + name + "\" 成功");
		return "forward:/" + pac + "allProducts";
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public String tryEditProduct(Model model, HttpServletRequest req) {
		String target = req.getParameter("edit");
		if (target != null) {
			target = target.trim().substring(4);
			Integer pno = Integer.valueOf(target);
			ProductBean pb = pServ.getProductByNo(pno);
			model.addAttribute("pno", pno);
			if (pb != null)
				model.addAttribute("product", pb);
		}
		return pac + "edit";
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.POST)
	public String editProduct(Model model, HttpServletRequest req) {
		String name = req.getParameter("editName");
		String priceStr = req.getParameter("editPrice");
		Double price = null;
		Integer pno = Integer.valueOf(req.getParameter("pno"));
		Map<String, String> errMsg = new HashMap<>();
		model.addAttribute("errMsg", errMsg);
		// check input value
		ProductBean pbOrig = pServ.getProductByNo(pno);
		try {
			name = name.trim(); // if name = null -> exception
			if (name.equals(""))// if name = "" -> exception
				throw new NullPointerException("欲修改商品名稱為空");
			try {
				price = Double.valueOf(priceStr.trim());// if priceStr = null || cannot parse priceStr to Double ->
//				if(price == 0)
//					throw new NullPointerException("欲修改價格為0");
				ProductBean pb = pServ.getProductByNo(pno); // exception

				try {
					pb.setName(name); // if "pb" is null -> exception
					pb.setPrice(price);
					try {
						System.out.println("update");
						pServ.updateProduct(pb); // if the value duplicate in database -> exception
					} catch (Exception e) {
						e.printStackTrace();
						System.err.println("edited value duplicate in database");
						errMsg.put("duplicate", name + " 已經存在於商品清單中");
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
					System.err.println("target product not found");
					errMsg.put("notFound", "欲修改的目標不存在");
				}
			} catch (NullPointerException | NumberFormatException e) {
				errMsg.put("price", "請輸入符合規範的值");
				e.printStackTrace();
				System.err.println("try to edit product with illegal \"price\"");
			}
		} catch (NullPointerException | NumberFormatException e) {
			errMsg.put("name", "請輸入符合規範的值");
			e.printStackTrace();
			System.err.println("try to edit product with illegal \"name\"");
		}

		// if any error, return the edit form with error message
		if (!errMsg.isEmpty()) {
			model.addAttribute("product", pbOrig);
			model.addAttribute("pno", pno);
			return pac + "edit";
		}
		model.addAttribute("success", "EDITproductSUCCESS");
		model.addAttribute("sysMsg", "修改商品 #" + pno + " 成功");
		return "forward:/" + pac + "allProducts";
	}

	@RequestMapping(value = "/continueProduct", method = RequestMethod.POST)
	public String continueCtrl(HttpServletRequest req, Model model) {
		Integer pno = null;
		Boolean status = null;
		ProductBean pb = null;
		try {
			pno = Integer.valueOf(req.getParameter("pno"));
			pb = pServ.getProductByNo(pno);
			status = pb.getAvailable();
			try {
				pb.setAvailable(!status);
				pServ.updateProduct(pb);
				if (status)
					model.addAttribute("sysMsg", "下架 #" + pno + " 成功");
				else
					model.addAttribute("sysMsg", "重新上架 #" + pno + " 成功");

			} catch (Exception e) {
				if (status)
					model.addAttribute("errMsg", "下架 #" + pno + " 失敗");
				else
					model.addAttribute("errMsg", "重新上架 #" + pno + " 失敗");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "更新商品失敗");
		}

		return "forward:/" + pac + "allProducts";
	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public String deleteCtrl(HttpServletRequest req, Model model) {
		Integer pno = Integer.valueOf(req.getParameter("pno"));
		try {
			pServ.deleteProductByNo(pno);
			System.out.println("delete " + pno + " success?");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "刪除商品失敗");
		}
		model.addAttribute("sysMsg", "刪除商品 #" + pno + " 成功");
		return "forward:/" + pac + "allProducts";
	}
}
