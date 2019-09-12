package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.entity.EmployeeBean;
import com.web.service.EmployeeService;

@Controller
public class EmpController {

	@Autowired
	ServletContext context;
	@Autowired
	EmployeeService service;

	@RequestMapping("/index2")
	public String backstageindex(Model model) {

		return "index2";
	}

	@RequestMapping("/empIndex_include2")
	public String list1(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "empIndex_include2";
	}

	@RequestMapping("/empInsert_include")
	public String list(Model model) {
		return "empInsert_include";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/empInsert_include")
	public String method0(Model model) {
		EmployeeBean employeeBean = new EmployeeBean();
		model.addAttribute("employeeBean", employeeBean);
		return "/empInsert_include";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/empInsert_include")
	public String method1(@ModelAttribute("employeeBean") EmployeeBean employeeBean,
			Model model,RedirectAttributes redirectAttributes,BindingResult result, 
			HttpServletRequest request, HttpSession session) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + 
		    StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (service.checkEmpEmail(employeeBean.getEmail()) != true && employeeBean.getPassword() != null
				&& employeeBean.getPassword().length() != 0 && employeeBean.getName() != null
				&& employeeBean.getName().length() != 0 && employeeBean.getBirthdayString() != null
				&& employeeBean.getPhoneNum() != null && employeeBean.getPhoneNum().length() != 0
				&& employeeBean.getEmail() != null && employeeBean.getEmail().length() != 0
				&& employeeBean.getEmployeeId()!= null && employeeBean.getEmployeeId().length() != 0
				) {
			redirectAttributes.addFlashAttribute("name", employeeBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 註冊成功");
			session.setAttribute("AAA", employeeBean.getEmail());
			service.save(employeeBean);
			return "redirect:/empIndex_include2";
		} else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，該信箱已經有人使用");
			return "redirect:/empIndex_include2";
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/EmpUpdate")
	public String method2(@RequestParam(value = "pk",required = false)Integer pk,Model model) {
		System.out.println(pk);
		
		EmployeeBean eb = service.findByPrimaryKey(pk);
		model.addAttribute("employee", eb);
		model.addAttribute("employeeBean", new EmployeeBean());
		
		model.addAttribute("eName", eb.getName());
		model.addAttribute("eEmail", eb.getEmail());
		model.addAttribute("ePhone", eb.getPhoneNum());
		model.addAttribute("eId", eb.getEmployeeId());
		model.addAttribute("ePwd", eb.getPassword());
		System.out.println(eb.getName());
		return "EmpUpdate";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/EmpUpdate")
	public String method3(@RequestParam(value = "pk",required = false)Integer pk,
			@ModelAttribute("employeeBean") EmployeeBean employeeBean, Model model,BindingResult result,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + 
		    StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (true) {
			employeeBean=service.findByPrimaryKey(pk);
			redirectAttributes.addFlashAttribute("name", employeeBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 更新成功");
			session.setAttribute("AAA", employeeBean.getEmail());
			service.updateEmp(employeeBean);
			return "redirect:/empIndex_include2";
		} 
		else {
			redirectAttributes.addFlashAttribute("error", "失敗,資料缺失");
			return "redirect:/empIndex_include2";
		}
	}
	

}
