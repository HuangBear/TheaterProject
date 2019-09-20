package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.entity.ArticleBean;
import com.web.entity.MemberBean;
import com.web.entity.ReplyBean;
import com.web.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService service;
	
	@Autowired
	ServletContext context;

	@RequestMapping({"/Articles"})
	public String list(Model model) {
		model.addAttribute("title", "討論版");
		model.addAttribute("subtitle", "請遵守版規");
		List<ArticleBean> list = service.getAllArticles();
		model.addAttribute("Articles", list);
		return "Articles";
	}

	@RequestMapping("/queryByTag")
	public String getTagList(Model model) {
		List<String> list = service.getAllTags();
		model.addAttribute("tagList", list);
		return "types/tag";
	}

	@RequestMapping("/Articles/{tag}")
	public String getArticlesByTag(@PathVariable("tag") String tag, Model model) {
		List<ArticleBean> articles = service.getArticlesByTag(tag);
		model.addAttribute("Articles", articles);
		return "Articles";
	}

	@RequestMapping("/Article")
	public String getArticleById(@RequestParam("no") Integer no, Model model) {
		ArticleBean ab = service.getArticleById(no);
		ReplyBean rb = service.getReplyById(no);
		System.out.println(ab);
		System.out.println(rb);
		model.addAttribute("Article", service.getArticleById(no));
		model.addAttribute("Reply", service.getReplyById(no));
		return "Article";
	}

	@RequestMapping(value = "/Articles/add", method = RequestMethod.GET)
	public String getAddNewArticleForm(Model model) {
		ArticleBean ab = new ArticleBean();
		model.addAttribute("ArticleBean", ab);
		return "addArticle";
	}
	
	@RequestMapping(value = "/Articles/add", method = RequestMethod.POST)
	public String processAddNewArticleForm(@ModelAttribute("ArticleBean") ArticleBean ab, 
		      BindingResult result, HttpServletRequest request ) {
		
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
		
		if (ab.getTitle() == null || ab.getTitle().trim().length() == 0)
		{
			errorMessage.put("titleNull", "請輸入標題");
		} else if (ab.getTitle().length() > 30)
		{
			errorMessage.put("titleOver", "字數超過30字");
		}
		System.out.println("title=" + ab.getTitle());
		System.out.println("title.length=" + ab.getTitle().length());
//		if (bb.getgp() == null) {
//			bb.setgp(0);

		if (!errorMessage.isEmpty())
		{
			return "addArticle";
		} else
		{
			service.addArticle(ab);
			return "redirect:/addArticle";
		}
		
	}


	
	@RequestMapping(value = "/Articles/edit", method = RequestMethod.GET)
	public String getEditArticleForm(Model model) {
		ArticleBean ab = new ArticleBean();
		model.addAttribute("ArticleBean", ab);
		return "editArticle";
	}
	
	@RequestMapping(value = "/Articles/edit", method = RequestMethod.POST)
	public String processEditNewArticleForm(@ModelAttribute("ArticleBean") ArticleBean ab, 
		      BindingResult result, HttpServletRequest request ) {
		
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
		
		if (ab.getTitle() == null || ab.getTitle().trim().length() == 0)
		{
			errorMessage.put("titleNull", "請輸入標題");
		} else if (ab.getTitle().length() > 30)
		{
			errorMessage.put("titleOver", "字數超過30字");
		}
		System.out.println("title=" + ab.getTitle());
		System.out.println("title.length=" + ab.getTitle().length());
//		if (bb.getgp() == null) {
//			bb.setgp(0);

		if (!errorMessage.isEmpty())
		{
			return "editArticle";
		} else
		{
			service.addArticle(ab);
			return "redirect:/editArticle";
		}
		
	}
	
	@ModelAttribute("memberList")
	public Map<Integer, String> getMemberList() {
		Map<Integer, String> memberMap = new HashMap<>();
		List<MemberBean> list = service.getMemberList();
		for (MemberBean cb : list) {
			memberMap.put(cb.getNo(), cb.getName());
		}
		return memberMap;
	}

	@ModelAttribute("tagList")
	public List<String> getTagList() {
		return service.getAllTags();
	}

	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("author"
				, "ForumId"
				, "tag"
				, "title"
				, "content"
				, "memberId"
				);
	}
//	@RequestMapping(value = "/getPicture/{bookId}", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer bookId) {
//	    String filePath = "/resources/images/NoImage.jpg";
//	    byte[] media = null;
//	    HttpHeaders headers = new HttpHeaders();
//	    String filename = "";
//	    int len = 0;
//	    ForumBean bean = service.getForumById(ForumId);
//	    if (bean != null) {
//	        Blob blob = bean.getCoverImage();
//	        filename = bean.getFileName();
//	        if (blob != null) {
//	            try {
//	                len = (int) blob.length();
//	                media = blob.getBytes(1, len); //  blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
//	            } catch (SQLException e) {
//	                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
//	            }
//	        } else {
//	            media = toByteArray(filePath);    
//	            filename = filePath;            
//	        }
//	    } else {
//	    	media = toByteArray(filePath);    
//	        filename = filePath;            
//	    }
//	       headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//	       String mimeType = context.getMimeType(filename);
//	    MediaType mediaType = MediaType.valueOf(mimeType);
//	    System.out.println("mediaType =" + mediaType);
//	    headers.setContentType(mediaType);
//	    ResponseEntity<byte[]> responseEntity = 
//	                new ResponseEntity<>(media, headers, HttpStatus.OK);
//	    return responseEntity;
//	}
//	
//	private byte[] toByteArray(String filepath) {
//	    byte[] b = null;
//	    String realPath = context.getRealPath(filepath);
//	    try {
//	          File file = new File(realPath);
//	          long size = file.length();
//	          b = new byte[(int)size];
//	          InputStream fis = context.getResourceAsStream(filepath);
//	          fis.read(b);
//	    } catch (FileNotFoundException e) {
//	          e.printStackTrace();
//	    } catch (IOException e) {
//	          e.printStackTrace();
//	    }
//	    return b;
//	}
	
//	@ExceptionHandler({ProductNotFoundException.class})
//	public ModelAndView handleError(HttpServletRequest request, 
//							ProductNotFoundException exception) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("invalidBookId", exception.getBookId());
//		mv.addObject("exception", exception);
//		mv.addObject("url", request.getRequestURL()+"?" + request.getQueryString());
//		mv.setViewName("productNotFound");
//		return mv;
//	}

}
