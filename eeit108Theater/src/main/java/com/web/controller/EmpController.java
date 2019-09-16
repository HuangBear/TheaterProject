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
import java.security.Principal;
import com.web.entity.EmployeeBean;
import com.web.service.EmployeeService;

@Controller
public class EmpController {

	@Autowired
	ServletContext context;
	@Autowired
	EmployeeService service;
	

	@RequestMapping("/admin/indexAdmin")
	public String backstageindex(Model model, Principal principal) {
		model.addAttribute("empEmail", principal.getName());
		return "admin/indexAdmin";
	}
	
	@RequestMapping("/admin/indexTest")
	public String backstageLogin(Model model, Principal principal) {
		model.addAttribute("message", "登入者Email :" + principal.getName());
		return "admin/indexTest";
	}
	
//	@RequestMapping(value = "/EmpLogin", method = RequestMethod.GET)
//	public String EmpLogin(Model model) {
//		EmployeeBean employeeBean = new EmployeeBean();
//		model.addAttribute("employeeBean", employeeBean);
//		return "EmpLogin";
//	}
//	
//	@RequestMapping(value = "/EmpLogin", method = RequestMethod.POST)
//	public String EmpLoginProcess(@ModelAttribute("employeeBean")EmployeeBean employeeBean , HttpServletRequest request,
//			RedirectAttributes redirectAttributes,Model model, 
//			HttpSession session)  {
//		
//		session = request.getSession();
//
//		EmployeeBean LoginEB=null;
//		LoginEB=service.checkEmailPassword(employeeBean.getEmail(), employeeBean.getPassword());
//		if(LoginEB!=null) {
//			session.setAttribute("memberName", LoginEB.getName());
//			session.setAttribute("memberId", LoginEB.getEmployeeId());
//			session.setAttribute("logout", "登出");
//			return "redirect:/index2";
//		}
//		else
//			redirectAttributes.addFlashAttribute("error", "登錄失敗，帳號或密碼錯誤");
//			return "redirect:/EmpLogin";
//	}
	@RequestMapping("EmpLogout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/EmpLogin";
	}
	@RequestMapping("/admin/empIndex_list")
	public String EmpList(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "admin/empIndex_list";
	}

//	@RequestMapping("/admin/emp_add")
//	public String AddEmpList(Model model) {
//		return "admin/emp_add";
//	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/admin/emp_add")
	public String AddEmpGet(Model model) {
		EmployeeBean employeeBean = new EmployeeBean();
		model.addAttribute("employeeBean", employeeBean);
		return "admin/emp_add";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/admin/emp_add")
	public String AddEmpPost(@ModelAttribute("employeeBean") EmployeeBean employeeBean,
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
			return "redirect:/admin/empIndex_list";
		} else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，該信箱已經有人使用");
			return "redirect:/admin/empIndex_list";
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/admin/emp_update")
	public String editEmpGet(@RequestParam(value = "pk",required = false)Integer pk,Model model) {
		System.out.println(pk);
		
		EmployeeBean eb = service.findByPrimaryKey(pk);
		model.addAttribute("employee", eb);
		model.addAttribute("employeeBean", new EmployeeBean());
		
		model.addAttribute("eName", eb.getName());
		model.addAttribute("eEmail", eb.getEmail());
		model.addAttribute("ePhone", eb.getPhoneNum());
		model.addAttribute("eId", eb.getEmployeeId());
		model.addAttribute("ePwd", eb.getPassword());
		model.addAttribute("eSalary", eb.getSalary());
		model.addAttribute("eResign", eb.getResignTime());
		System.out.println(eb.getName());
		return "admin/emp_update";
	}
	@SuppressWarnings("unused")
	@RequestMapping(method = RequestMethod.POST, value = "/admin/emp_update")
	public String editEmpPost(@RequestParam(value = "pk",required = false)Integer pk,
			@ModelAttribute("employeeBean") EmployeeBean employeeBean, Model model,BindingResult result,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + 
		    StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (true) {
			//employeeBean=service.findByPrimaryKey(pk);
			redirectAttributes.addFlashAttribute("name", employeeBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 更新成功");
			session.setAttribute("AAA", employeeBean.getEmail());
			employeeBean.setNo(pk);
			service.updateEmp(employeeBean);
			return "redirect:/admin/empIndex_list";
		} 
		else {
			redirectAttributes.addFlashAttribute("error", "失敗,資料缺失");
			return "redirect:/admin/empIndex_list";
		}
	}
	@RequestMapping(method = RequestMethod.GET, value = "/admin/EmpResign")
	public String ResignEmp(@RequestParam(value = "pk",required = false)Integer pk,
			Model model,EmployeeBean employeeBean) {
		
		employeeBean= service.findByPrimaryKey(pk);
		service.resignEmp(employeeBean);
		return "redirect:/admin/empIndex_list";
	}

}
