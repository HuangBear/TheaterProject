package com.web.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.entity.MemberBean;
import com.web.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	ServletContext context;
	@Autowired
	MemberService service;

	@RequestMapping(method = RequestMethod.GET, value = "memberservice")
	public String AddMemberGet(Model model) {
		MemberBean memberBean = new MemberBean();
		model.addAttribute("memberBean", memberBean);
		return "memberservice";
	}

	@RequestMapping(method = RequestMethod.POST, value = "memberAdd")
	public String AddMemberPost(@ModelAttribute("memberBean") MemberBean memberBean, Model model,
			RedirectAttributes redirectAttributes, BindingResult result, HttpServletRequest request,
			HttpSession session) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (service.checkMemberEmail(memberBean.getEmail()) != true && memberBean.getPassword() != null
				&& memberBean.getPassword().length() != 0 && memberBean.getName() != null
				&& memberBean.getName().length() != 0 && memberBean.getBirthdayString() != null
				&& memberBean.getPhoneNum() != null && memberBean.getPhoneNum().length() != 0
				&& memberBean.getEmail() != null && memberBean.getEmail().length() != 0
				&& memberBean.getMemberId() != null && memberBean.getMemberId().length() != 0) {
			redirectAttributes.addFlashAttribute("name", memberBean.getName());
			redirectAttributes.addFlashAttribute("welcome", "註冊成功");

			// memberBean.setPassword(memberBean.getPassword());

			service.save(memberBean);
			return "redirect:/memberservice";
		} else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，該信箱已經有人使用，或是未輸入必須欄位");
			return "redirect:/memberservice";
		}
	}

	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public String MemberLoginProcess(@ModelAttribute("memberBean") MemberBean memberBean, HttpServletRequest request,
			RedirectAttributes redirectAttributes, Model model, HttpSession session) {

		session = request.getSession();

		MemberBean LoginMB = null;
		LoginMB = service.checkEmailPassword(memberBean.getEmail(), memberBean.getPassword());
		if (LoginMB != null) {
			session.setAttribute("memberName", LoginMB.getName());
			session.setAttribute("memberId", LoginMB.getMemberId());
			session.setAttribute("LoginOK", LoginMB);
			redirectAttributes.addFlashAttribute("name", memberBean.getName());
			redirectAttributes.addFlashAttribute("welcome", "登入成功");
			return "redirect:/";
		} else
			redirectAttributes.addFlashAttribute("error", "登錄失敗，帳號或密碼錯誤");
		return "redirect:/memberservice";
	}

}
