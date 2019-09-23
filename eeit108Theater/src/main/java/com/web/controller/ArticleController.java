package com.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.ArticleBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService service;
	
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/MoviesForum/Articles", method = RequestMethod.GET)
	public String list(Model model,@RequestParam("id") Integer no, HttpServletRequest request,HttpSession session) {
		model.addAttribute("title", "討論版");
		model.addAttribute("subtitle","test");
			
		List<ArticleBean> list = service.getArticlesByMovieNo(no);
		model.addAttribute("Articles", list);
		session = request.getSession();
		
		session.setAttribute("movie", no);
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
	public String getArticleById(@RequestParam("id") Integer no, Model model) {
		ArticleBean ab = service.getArticleById(no);
		ReplyBean rb = service.getReplyById(no);
		System.out.println(ab);
		System.out.println(rb);
		model.addAttribute("Article", service.getArticleById(no));
		model.addAttribute("Reply", service.getReplyById(no));
		return "Article";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewArticleForm(Model model,HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		ArticleBean ab = new ArticleBean();
		
		model.addAttribute("ArticleBean", ab);
		return "addArticle";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewArticleForm(@ModelAttribute("ArticleBean") ArticleBean ab, 
		      BindingResult result, HttpServletRequest request ) throws ParseException {
		
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
		ab.setLikeCount(0);
		ab.setDislikeCount(0);
		int AuthorS = Integer.parseInt(request.getParameter("author"));
		ab.setAuthor(new MemberBean(AuthorS));
		int MovieS = Integer.parseInt(request.getParameter("movie"));
		ab.setMovie(new MovieBean(MovieS));
		ab.setAvailable(true);
		ab.setPostTime(new Date());
		service.addArticle(ab);

		if (!errorMessage.isEmpty())
		{
			return "addArticle";
		} else
		{
			return "redirect:/MoviesForum";
		}
		
	}


	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditArticleForm(@RequestParam("id") Integer no, Model model) {
		ArticleBean ab = service.getArticleById(no);
		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
		ab.setPostTimeString(ssdf.format(ab.getPostTime()));
		String NoS =Integer.toString(ab.getNo());
		ab.setNoString(NoS);
		String LikeS =Integer.toString(ab.getLikeCount());
		ab.setLikeCountString(LikeS);
		String DislikeS =Integer.toString(ab.getDislikeCount());
		ab.setDislikeCountString(DislikeS);
		String AuthorS =Integer.toString(ab.getAuthor().getNo());
		ab.setAuthorString(AuthorS);
		String MovieS =Integer.toString(ab.getMovie().getNo());
		ab.setMovieString(MovieS);
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("Article", service.getArticleById(no));
		return "editArticle";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String processEditNewArticleForm(@ModelAttribute("ArticleBean") ArticleBean ab, 
		      BindingResult result, HttpServletRequest request ) throws ParseException{
		System.err.println("==============");
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
		System.out.println("==postString==="+request.getParameter("postTimeString"));
		System.out.println("==postString==="+request.getParameter("noString"));
		int NoS = Integer.parseInt(request.getParameter("noString"));
		ab.setNo(NoS);
		int LikeS = Integer.parseInt(request.getParameter("likeCountString"));
		ab.setLikeCount(LikeS);
		int DislikeS = Integer.parseInt(request.getParameter("dislikeCountString"));
		ab.setDislikeCount(DislikeS);
		int AuthorS = Integer.parseInt(request.getParameter("authorString"));
		ab.setAuthor(new MemberBean(AuthorS));
		int MovieS = Integer.parseInt(request.getParameter("movieString"));
		ab.setMovie(new MovieBean(MovieS));
		ab.setAvailable(true);
		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("postTimeString=" + ab.getPostTimeString());
		ab.setPostTime(ssdf.parse(request.getParameter("postTimeString")));
		
		
		System.out.println("title=" + ab.getTitle());
		System.out.println("title.length=" + ab.getTitle().length());
//		if (bb.getgp() == null) {
//			bb.setgp(0);
		System.out.println("no=" + ab.getNo());
		System.out.println("content=" + ab.getContent());
		System.out.println("tag=" + ab.getTag());
		System.out.println("postTime=" + ab.getPostTime());
		System.out.println("postTimeString=" + ab.getPostTimeString());
		
		service.editArticle(ab);

		if (!errorMessage.isEmpty())
		{
			return "editArticle";
		} else
		{
			return "redirect:/MoviesForum";
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
				, "postTime"
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
