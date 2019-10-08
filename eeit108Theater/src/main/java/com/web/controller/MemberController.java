package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.entity.MemberBean;
import com.web.service.MemberService;
import com.web.util.RandomStringUtil;
import com.web.util.SecurityCipher;

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

	@RequestMapping(method = RequestMethod.POST, value = "googleMember")
	public String AddGoogleMember(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
			HttpSession session) {
		session = request.getSession();
		String email = request.getParameter("registGoogleEmail");
		String name = request.getParameter("registGoogleName");
		String GoogleImg = request.getParameter("registGoogleImg");
		System.out.println("googlemember info:" + email + " " + name);
		MemberBean GoogleMember = new MemberBean();
		if (service.checkMemberEmail(email)) {
			System.out.println("此Google會員已有資料");
			GoogleMember = service.findMemberByEmail(email);
			session.setAttribute("LoginOK", GoogleMember);
			if (GoogleMember == null) {
				System.out.println("google member is null");
			} else {
				System.out.println(session.getAttribute("LoginOK"));
			}

			return "redirect:/";
		} else {
			System.out.println("此Google會員第一次登入，將創建簡易會員檔");
			GoogleMember.setName(name);
			GoogleMember.setEmail(email);
			GoogleMember.setPassword(email);
			GoogleMember.setMemberId(email);
			GoogleMember.setGoogleUrl(GoogleImg);
			service.save(GoogleMember);
			GoogleMember = service.findMemberByEmail(email);
			session.setAttribute("LoginOK", GoogleMember);

			return "redirect:/";
		}
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

			String emailCode = RandomStringUtil.getRandomString();
			memberBean.setEmailCode(emailCode);
			memberBean.setEmailActiveStatus(false);

			String SecurityPwd = SecurityCipher.encryptString(memberBean.getPassword());
			memberBean.setPassword(SecurityPwd);
			try {
				service.save(memberBean);
				service.emailValidate(memberBean, request);
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "註冊失敗，該身分證已經有人使用");
				return "redirect:/memberservice";

			}
			redirectAttributes.addFlashAttribute("name", memberBean.getName());
			redirectAttributes.addFlashAttribute("welcome", "註冊成功，請至信箱收信認證");
			return "redirect:/memberservice";
		} else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，該信箱已經有人使用");
			return "redirect:/memberservice";
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "memberinfo")
	public String MemberInfoPage(Model model) {
		MemberBean memberBean = new MemberBean();
		model.addAttribute("memberBean", memberBean);
		return "memberinfo";
	}

	@SuppressWarnings("unused")
	@RequestMapping(method = RequestMethod.POST, value = "memberUpdateX")
	public String editMemPost(@ModelAttribute("memberBean") MemberBean memberBean, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session,
			BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("Result Error Occured" + result.getAllErrors());
		}
		Integer pk = memberBean.getNo();
		if (memberBean.getUploadImage() != null) {
			MultipartFile memImage = memberBean.getUploadImage();
			String originFileName = memImage.getOriginalFilename();

			if (memImage != null && !memImage.isEmpty()) {
				try {
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String rootDirectory = context.getRealPath("/");
					byte[] b = memImage.getBytes();
					Blob blob = new SerialBlob(b);
					memberBean.setImageFileName(originFileName);
					memberBean.setMemberImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}

		if (true) {
			// MemberBean=service.findByPrimaryKey(pk);
			redirectAttributes.addFlashAttribute("name", memberBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 更新成功");

			// MemberBean.setNo(pk);
			service.updateMember(memberBean);
			MemberBean MemberBeanNew = service.findMemberByPrimaryKey(pk);
			session.setAttribute("LoginOK", MemberBeanNew);
			return "redirect:/memberinfo";
		} else {
			redirectAttributes.addFlashAttribute("error", "失敗,資料缺失");
			return "redirect:/memberinfo";
		}
	}

//會員登入
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public String MemberLoginProcess(@ModelAttribute("memberBean") MemberBean memberBean, HttpServletRequest request,
			RedirectAttributes redirectAttributes, Model model, HttpSession session, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String errMsg = "";
		String account = memberBean.getEmail();
		String pwd = memberBean.getPassword();
		String flag = request.getParameter("remember");
		session = request.getSession();
		System.out.println("memberLoginController start");
		if (account == null || account.trim().length() == 0) {
			errMsg += "1.*帳號必須輸入;";
		} else {
			request.setAttribute("setacc", account);
		}

		if (pwd == null || pwd.trim().length() == 0) {
			errMsg += "2.*密碼必須輸入;";
		} else {
			request.setAttribute("setpwd", pwd);
		}
		if (errMsg.length() != 0) {
			redirectAttributes.addFlashAttribute("errMsg", errMsg);
			return "redirect:/memberservice";
		}

		if ("on".equals(flag)) {
			System.out.println("有勾RememberMe");
			// account = java.net.URLEncoder.encode(account, "UTF-8");
			Cookie accountCookie = new Cookie("account", account);
			Cookie pwdCookie = new Cookie("pwd", pwd);
			Cookie flagCookie = new Cookie("flag", "checked");

			// cookie存活時間
			accountCookie.setMaxAge(5 * 60);
			pwdCookie.setMaxAge(5 * 60);
			flagCookie.setMaxAge(5 * 60);
			// cookie儲存的位置
			accountCookie.setPath(request.getContextPath());
			pwdCookie.setPath(request.getContextPath());
			flagCookie.setPath(request.getContextPath());
			// 儲存cookie
			response.addCookie(accountCookie);
			response.addCookie(pwdCookie);
			response.addCookie(flagCookie);
		} else {
			System.out.println("沒勾RememberMe");
			account = java.net.URLEncoder.encode(account, "UTF-8");
			Cookie accountCookie = new Cookie("account", account);
			Cookie pwdCookie = new Cookie("pwd", pwd);
			Cookie flagCookie = new Cookie("flag", "checked");

			// cookie存活時間
			accountCookie.setMaxAge(0);
			pwdCookie.setMaxAge(0);
			flagCookie.setMaxAge(0);
			// cookie儲存的位置
			accountCookie.setPath(request.getContextPath());
			pwdCookie.setPath(request.getContextPath());
			flagCookie.setPath(request.getContextPath());
			// 儲存cookie
			response.addCookie(accountCookie);
			response.addCookie(pwdCookie);
			response.addCookie(flagCookie);
		}

		MemberBean LoginMB = null;
		MemberBean memberEmailExist = service.findMemberByEmail(memberBean.getEmail());
		if(memberEmailExist ==null) {
			redirectAttributes.addFlashAttribute("error", "登錄失敗，帳號不存在");
			return "redirect:/memberservice";
		}else if (memberEmailExist !=null&&memberEmailExist.getGoogleUrl() != null) {
			redirectAttributes.addFlashAttribute("error", "此帳號已使用Google登入認證，請按Google登入");
			return "redirect:/memberservice";
		} else {
			System.out.println("memberLoginController checking member  ");
			LoginMB = service.checkEmailPassword(memberBean.getEmail(), memberBean.getPassword());
			if (LoginMB != null && LoginMB.getEmailActiveStatus() == true) {
				
				session.setAttribute("memberName", LoginMB.getName());
				session.setAttribute("memberId", LoginMB.getMemberId());
				session.setAttribute("LoginOK", LoginMB);
				System.out.println("memberLoginController check member ok ");
				redirectAttributes.addFlashAttribute("name", memberBean.getName());
				redirectAttributes.addFlashAttribute("welcome", "登入成功");
				return "redirect:/";
			} else if (LoginMB != null && LoginMB.getEmailActiveStatus() == false) {
				redirectAttributes.addFlashAttribute("error", LoginMB.getName() + "您好，請至信箱收信驗證後才可登入");
				return "redirect:/memberservice";
			} else
				redirectAttributes.addFlashAttribute("error", "登錄失敗，密碼錯誤");
			return "redirect:/memberservice";
		}
	}

//	@RequestMapping(value = "memberLoginModal", method = RequestMethod.POST)
//	public String ModalMemberLoginProcess(HttpServletRequest request, RedirectAttributes redirectAttributes,
//			Model model, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {
//		System.out.println("Modal login begin");
//		Map<String, String> errMsg = new HashMap<>();
//		String account = request.getParameter("account");
//		String pwd = request.getParameter("password");
//		session = request.getSession();
//
//		if (account == null || account.trim().length() == 0) {
//			errMsg.put("account", "*帳號必須輸入;");
//		}
//		if (pwd == null || pwd.trim().length() == 0) {
//			errMsg.put("password", "*密碼必須輸入;");
//		}
//		if (errMsg.isEmpty()) {
//			MemberBean LoginMB = null;
//			LoginMB = service.checkEmailPassword(account, pwd);
//			if (LoginMB != null && LoginMB.getEmailActiveStatus() == true) {
//				session.setAttribute("memberName", LoginMB.getName());
//				session.setAttribute("memberId", LoginMB.getMemberId());
//				session.setAttribute("LoginOK", LoginMB);
//				System.out.println("login success");
////				redirectAttributes.addFlashAttribute("name", LoginMB.getName());
////				redirectAttributes.addFlashAttribute("welcome", "登入成功");
////				return "redirect:/";
//			} else if (LoginMB != null && LoginMB.getEmailActiveStatus() == false) {
//				redirectAttributes.addFlashAttribute("error", LoginMB.getName() + "您好，請至信箱收信驗證後才可登入");
//				errMsg.put("error", "此帳號尚未經過驗證，請至信箱收信驗證");
//				System.out.println("login fail, due to unactive account");
//			} else {
//				errMsg.put("error", "登入失敗，帳號或密碼錯誤");
//				System.out.println("login fail, due to wrong account or password");
//			}
//		}
//		System.out.println("Modal login end");
//		if (errMsg.isEmpty()) {
//			response.setStatus(Response.SC_RESET_CONTENT);
//			
//			return "order/start";
//		} else {
//			model.addAttribute("errMsg", errMsg);
//			
//			return "order/loginModalForm";
//		}
//	}

	// 會員登出
	@RequestMapping("memberLogout")
	public String memLogout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		session.invalidate();
		redirectAttributes.addFlashAttribute("logout", " 登出成功");

		return "redirect:/memberservice";
	}

	// 取得會員照片
	@RequestMapping(value = "/getMemberPicture/{pk}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberPicture(HttpServletResponse resp, @PathVariable Integer pk) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = service.findMemberByPrimaryKey(pk);
		if (bean != null) {
			Blob blob = bean.getMemberImage();
			filename = bean.getImageFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	@RequestMapping("/admin/updateMem")
	public String updateMem(Model model, HttpServletRequest req) {
		Integer pk = Integer.parseInt(req.getParameter("pk"));
		HttpSession session = req.getSession();
		MemberBean mem = service.findMemberByPrimaryKey(pk);
		session.setAttribute("mem", mem);
		model.addAttribute("memberBean", new MemberBean());
		return "admin/UpdateMember";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/admin/updateMem")
	public String editMemStatus(@ModelAttribute("memberBean") MemberBean memberBean, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session) {

		if (memberBean != null) {

			redirectAttributes.addFlashAttribute("name", memberBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 更新成功");

			service.updateMemberStatus(memberBean);
			List<MemberBean> listMem = service.getAllMembers();
			model.addAttribute("members", listMem);

			return "redirect:/admin/empIndexA#Mem_list";
		} else {
			redirectAttributes.addFlashAttribute("error", "失敗,資料缺失");
			return "redirect:/admin/empIndexA#Mem_list";
		}
	}

	@RequestMapping(value = "/registerEmail", method = RequestMethod.GET)
	public String registerEmail(@RequestParam("code") String code, RedirectAttributes redirectAttributes, MemberBean mb,
			HttpServletRequest request, HttpSession session) {

		mb = service.findMemberByCode(code);
		System.out.println(mb.getEmail());
		service.activeUser(mb.getEmailCode());
		redirectAttributes.addFlashAttribute("name", "會員 " + mb.getName() + " ");
		redirectAttributes.addFlashAttribute("welcome", "驗證成功，歡迎登入");
		return "redirect:/memberservice";
	}
}
