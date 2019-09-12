package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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

	@RequestMapping({"/Forums"})
	public String list(Model model) {
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

//	@RequestMapping(value = "/forums/add", method = RequestMethod.POST)
//	public String processAddNewForumForm(@ModelAttribute("ForumBean") ForumBean bb, 
//		      BindingResult result, HttpServletRequest request ) {
//		String[] suppressedFields = result.getSuppressedFields();
//		if (suppressedFields.length > 0) {
//			throw new RuntimeException("嘗試傳入不允許的欄位: " + 
//		    StringUtils.arrayToCommaDelimitedString(suppressedFields));
//		}
//		if (bb.getgp() == null) {
//			bb.setgp(0);
//		}
//		MultipartFile productImage = bb.getForumImage();
//		String originalFilename = productImage.getOriginalFilename();
//		bb.setFileName(originalFilename);
//		
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
//		//  建立Blob物件，交由 Hibernate 寫入資料庫
//		if (productImage != null && !productImage.isEmpty() ) {
//			try {
//				byte[] b = productImage.getBytes();
//				Blob blob = new SerialBlob(b);
//				bb.setCoverImage(blob);
//			} catch(Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//		service.addForum(bb);
//		//  將上傳的檔案移到指定的資料夾
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();
//			File file = new File(imageFolder, bb.getForumId() + ext);
//			productImage.transferTo(file);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
//		return "redirect:/Forums";
//	}
	
	@RequestMapping(value = "/Articles/edit", method = RequestMethod.GET)
	public String getEditArticleForm(Model model) {
		ArticleBean ab = new ArticleBean();
		model.addAttribute("ArticleBean", ab);
		return "editArticle";
	}
	// return "forward:/anotherFWD": 轉發(forward)給能夠匹配給 /anotherFWD的控制器方法
	// 將與下一棒的程式共用同一個請求物件
	// return "anotherFWD": 也是轉發，但Spring框架會視anotherFWD為視圖的邏輯名稱來尋找
	// 對應的視圖，然後由該視圖來產生回應    
//	@RequestMapping(value = "/forwardDemo")
//	public String forward(Model model, HttpServletRequest request) {
//	    String uri = request.getRequestURI();
//	    model.addAttribute("modelData0", "這是以/forwardDemo送來的請求");
//	    model.addAttribute("uri0", uri);
//	    return "forward:/anotherFWD";
//	}
//	// 被轉發的方法，將與前一個方法共用同一個請求物件
//	@RequestMapping(value = "/anotherFWD")
//	public String forwardA(Model model, HttpServletRequest request) {
//	    String uri = request.getRequestURI();
//	    model.addAttribute("modelData1", "這是以/anotherFWD送來的請求");
//	    model.addAttribute("uri1", uri);
//	    return "forwardedPage";
//	}
	// return "redirect:/redirectAnother": 通知瀏覽器對新網址 /redirectAnother發出請求，即重定向
	// (redirect)。由於是另外一個請求，所以放在原來之請求物件內的資料將不存在。必須將屬性物件儲存
	// 在 RedirectAttributes物件內，另外一個請求才會看的到對應的視圖，然後由該視圖來產生回應。
//	@RequestMapping(value = "/redirectDemo")
//	public String redirect(Model model, RedirectAttributes redirectAttributes, 
//	                    HttpServletRequest request) {
//	    String uri = request.getRequestURI();
//	    model.addAttribute("modelData2", "這是以/redirectDemo送來的請求，即將通知瀏覽器對"
//	                        + "新網址發出請求，但瀏覽器不會顯示這樣的訊息");
//	    model.addAttribute("uri2", uri);
//	    redirectAttributes.addFlashAttribute("modelData3", "這是加在RedirectAttributes"
//	                        + "物件內的屬性物件，瀏覽器會顯示");
//	    redirectAttributes.addFlashAttribute("uri3", uri);
//	    return "redirect:/redirectAnother";
//	}
//	//-------------------------
	// 瀏覽器對新網址重新發出的請求將會由這個請求器方法來處理
//	@RequestMapping(value = "/redirectAnother")
//	public String redirectA(Model model, HttpServletRequest request) {
//	    return "redirectedPage";
//	}
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
