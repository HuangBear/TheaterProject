package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
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

import com.web.entity.EmployeeBean;
import com.web.service.EmployeeService;

@Controller
public class EmpController {

	@Autowired
	ServletContext context;
	@Autowired
	EmployeeService service;
	@Autowired
    private PasswordEncoder passwordEncoder;

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

	@RequestMapping("/admin/EmpLogout")
	public String logout(HttpServletRequest request,RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		session.invalidate();
		redirectAttributes.addFlashAttribute("logout", " 登出成功");
		
		return "EmpLogin";
	}
	@RequestMapping("EmpLogin")
	public String EmpLogin() {
		
		return "EmpLogin";
	}
	
	@RequestMapping("/admin/empIndex_list")
	public String EmpList(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "admin/empIndex_list";
	}
	@RequestMapping("/admin/Table")
	public String EmpTable1(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "admin/Table";
	}
	@RequestMapping("admin/empIndexA")
	public String EmpListA(Model model, Principal principal,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String empEmail=principal.getName();
		List<EmployeeBean> list = service.getAllEmployees();
		session.setAttribute("employees", list);
		model.addAttribute("empEmail", empEmail);
		EmployeeBean eb1 = service.findByEmail(empEmail);

		session.setAttribute("employeeBean1",eb1);
		session.setAttribute("empName", eb1.getName());
		return "admin/empIndexA";
	}
	@RequestMapping("admin/empTable")
	public String EmpTable(Model model) {
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		return "admin/empTable";
	}
	@RequestMapping("admin/emp_profile")
	public String EmpProfile(Model model) {
		
		return "admin/emp_profile";
	}

	
	@RequestMapping("/admin/updatePage")
	public String updatePage(Model model, HttpServletRequest req, HttpSession session) {
		String url = req.getParameter("url");
		EmployeeBean employeeBean = new EmployeeBean();
		List<EmployeeBean> list = service.getAllEmployees();
		model.addAttribute("employees", list);
		model.addAttribute("employeeBean", employeeBean);
		return "admin/"+url;
	}
	
	
//	@RequestMapping(method = RequestMethod.GET, value = "/admin/emp_add")
//	public String AddEmpGet(Model model) {
//		EmployeeBean employeeBean = new EmployeeBean();
//		model.addAttribute("employeeBean", employeeBean);
//		return "admin/emp_add";
//	}

	@RequestMapping(method = RequestMethod.POST, value = "/admin/emp_add")
	public String AddEmpPost(@ModelAttribute("employeeBean")EmployeeBean employeeBean,
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
			//session.setAttribute("AAA", employeeBean.getEmail());
//			
//			String passwordx=passwordEncoder.encode(employeeBean.getPassword());
//			System.out.println(passwordx);
//			employeeBean.setPassword(passwordx);
			
			employeeBean.setPassword(employeeBean.getPassword());
			
			service.save(employeeBean);
			return "admin/empIndexA";
		} else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，該信箱已經有人使用");
			return "admin/empIndexA";
		}
	}
	@RequestMapping("/admin/updateEMP")
	public String updateEMP(Model model, HttpServletRequest req) {
		Integer pk = Integer.parseInt(req.getParameter("pk"));
		HttpSession session=req.getSession();
		EmployeeBean eb = service.findByPrimaryKey(pk);
		session.setAttribute("eb", eb);
		model.addAttribute("employee", eb);
		model.addAttribute("employeeBean", new EmployeeBean());
		return "admin/emp_update";
	}                            
	
//	@RequestMapping(method = RequestMethod.GET, value = "/admin/emp_update")
//	public String editEmpGet(@RequestParam(value = "pk",required = false)Integer pk,Model model,HttpServletRequest request) {
//		System.out.println(pk);
//		HttpSession session=request.getSession();
//		EmployeeBean eb = service.findByPrimaryKey(pk);
//		session.setAttribute("eb", eb);
//		model.addAttribute("employee", eb);
//		model.addAttribute("employeeBean", new EmployeeBean());
//		
//		
//		System.out.println(eb.getName());
//		return "/admin/emp_update2";
//	}
	
	@SuppressWarnings("unused")
	@RequestMapping(method = RequestMethod.POST, value = "/admin/emp_update")
	public String editEmpPost(@RequestParam(value = "pk",required = false)Integer pk,
			@ModelAttribute("employeeBean") EmployeeBean employeeBean, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session) {
		
		MultipartFile empImage=employeeBean.getUploadImage();
		String originFileName=empImage.getOriginalFilename();
		employeeBean.setImageFileName(originFileName);
		
		
		if (empImage != null && !empImage.isEmpty() ) {
			try {
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String rootDirectory = context.getRealPath("/");
				byte[] b = empImage.getBytes();
				Blob blob = new SerialBlob(b);
				employeeBean.setEmployeeImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		if (true) {
			//employeeBean=service.findByPrimaryKey(pk);
			redirectAttributes.addFlashAttribute("name", employeeBean.getName());
			redirectAttributes.addFlashAttribute("welcome", " 更新成功");
			session.setAttribute("AAA", employeeBean.getEmail());
			//employeeBean.setNo(pk);
			service.updateEmp(employeeBean);
			return "redirect:/admin/empIndexA";
		} 
		else {
			redirectAttributes.addFlashAttribute("error", "失敗,資料缺失");
			return "redirect:/admin/empIndexA";
		}
	}
	@RequestMapping(method = RequestMethod.GET, value = "/admin/EmpResign")
	public String ResignEmp(@RequestParam(value = "pk",required = false)Integer pk,
			Model model,EmployeeBean employeeBean) {
		
		employeeBean= service.findByPrimaryKey(pk);
		service.resignEmp(employeeBean);
		return "redirect:/admin/empTable";
	}

	@RequestMapping(value = "/getEmpPicture/{pk}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getEmpPicture(HttpServletResponse resp, @PathVariable Integer pk) {
	    String filePath = "/resources/images/NoImage.jpg";
	    byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    String filename = "";
	    int len = 0;
	    EmployeeBean bean = service.findByPrimaryKey(pk);
	    if (bean != null) {
	        Blob blob = bean.getEmployeeImage();
	        filename = bean.getImageFileName();
	        if (blob != null) {
	            try {
	                len = (int) blob.length();
	                media = blob.getBytes(1, len); //  blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
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
	    ResponseEntity<byte[]> responseEntity = 
	                new ResponseEntity<>(media, headers, HttpStatus.OK);
	    return responseEntity;
	}
	private byte[] toByteArray(String filepath) {
	    byte[] b = null;
	    String realPath = context.getRealPath(filepath);
	    try {
	          File file = new File(realPath);
	          long size = file.length();
	          b = new byte[(int)size];
	          InputStream fis = context.getResourceAsStream(filepath);
	          fis.read(b);
	    } catch (FileNotFoundException e) {
	          e.printStackTrace();
	    } catch (IOException e) {
	          e.printStackTrace();
	    }
	    return b;
	}
}
