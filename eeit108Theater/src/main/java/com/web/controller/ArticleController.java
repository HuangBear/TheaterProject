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
import com.web.entity.EmployeeBean;
import com.web.entity.LikeOrDislikeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.ReplyBean;
import com.web.entity.ReportBean;
import com.web.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/MoviesForum/Articles", method = RequestMethod.GET)
	public String list(Model model,@RequestParam("id") Integer no, HttpServletRequest request,HttpSession session) {
			
		List<ArticleBean> list = service.getArticlesByMovieNo(no);
//		List<SysArticleBean> Syslist = service.getSysArticlesByMovieNo(no);
		model.addAttribute("Articles", list);
//		model.addAttribute("SysArticles", Syslist);
		MovieBean mb = service.getMovieByNo(no);
		model.addAttribute("Movie", mb);
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

	@RequestMapping(value = "/Article", method = RequestMethod.GET)
	public String getArticleById(@RequestParam("id") Integer no, Model model,HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		ArticleBean ab = service.getArticleById(no);
		ReplyBean rb = new ReplyBean();
		List<ReplyBean> list = service.getReplysByArticle(no);
		LikeOrDislikeBean lb = new LikeOrDislikeBean();
		String NoS =Integer.toString(ab.getNo());
		lb.setArticleNoString(NoS);
		
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("Reply", rb);
		model.addAttribute("Replys", list);
		model.addAttribute("LikeOrDislikeBean", lb);
		model.addAttribute("Article", service.getArticleById(no));
		
		return "Article";
	}
	
	@RequestMapping(value = "/Article", method = RequestMethod.POST)
	public String processArticleLikeOrDislike(@RequestParam("id") Integer no,@ModelAttribute("LikeOrDislikeBean") LikeOrDislikeBean lb,@ModelAttribute("Reply") ReplyBean rb, Model model,HttpServletRequest request,HttpSession session)throws ParseException {
		String LikeButton = request.getParameter("button");
		String LockButton = request.getParameter("lockbutton");
		if("like".equals(LikeButton)||"dislike".equals(LikeButton)) {
			
		int article = Integer.parseInt(request.getParameter("articleNoString"));
		lb.setArticle(new ArticleBean(article));
		
		int memberNo = Integer.parseInt(request.getParameter("member"));
		lb.setMember(memberNo);
		
		ArticleBean ab = service.getArticleById(no);
		
		if ("like".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="null") {
            lb.setLikeOrDislike(true);
            ab.setLikeCount(ab.getLikeCount()+1);
            if(service.getLikeOrDislikeNo(memberNo,article)==null) {
        		service.addGp(lb);
        	}else {
        		LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
            	lb.setNo(lbno.getNo());
        		service.updateGp(lb);
        	}
            service.editArticle(ab);
        } else if ("dislike".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="null") {
        	lb.setLikeOrDislike(false);
        	ab.setDislikeCount(ab.getDislikeCount()+1);
        	if(service.getLikeOrDislikeNo(memberNo,article)==null) {
        		service.addGp(lb);
        	}else {
        		LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
            	lb.setNo(lbno.getNo());
        		service.updateGp(lb);
        	}
        	
        	service.editArticle(ab);
        } else if ("like".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="true") {
        	LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
        	lb.setNo(lbno.getNo());
            lb.setLikeOrDislike(null);
            ab.setLikeCount(ab.getLikeCount()-1);
            service.updateGp(lb);
            service.editArticle(ab);
        } else if ("dislike".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="false") {
        	LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
        	lb.setNo(lbno.getNo());
        	lb.setLikeOrDislike(null);
        	ab.setDislikeCount(ab.getDislikeCount()-1);
        	service.updateGp(lb);
        	service.editArticle(ab);
        } else if ("like".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="false") {
        	LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
        	lb.setNo(lbno.getNo());
            lb.setLikeOrDislike(true);
            ab.setLikeCount(ab.getLikeCount()+1);
            ab.setDislikeCount(ab.getDislikeCount()-1);
            service.updateGp(lb);
            service.editArticle(ab);
        } else if ("dislike".equals(LikeButton) && service.getLikeOrDislikeByMemberAndArticle(memberNo,article)=="true") {
        	LikeOrDislikeBean lbno = service.getLikeOrDislikeNo(memberNo,article);
        	lb.setNo(lbno.getNo());
        	lb.setLikeOrDislike(false);
        	ab.setDislikeCount(ab.getDislikeCount()+1);
        	ab.setLikeCount(ab.getLikeCount()-1);
        	service.updateGp(lb);
        	service.editArticle(ab);
        }
		}
		if("lock".equals(LockButton)) {
			int article = Integer.parseInt(request.getParameter("articleString"));
			lb.setArticle(new ArticleBean(article));
			int rno = Integer.parseInt(request.getParameter("rnoString"));
			ReplyBean erb = service.getReplyById(rno);
			System.out.println("檢查數值" + erb.getNo());
		if ("lock".equals(LockButton) && erb.getAvailable()==true) {
			erb.setNo(erb.getNo());
            erb.setAvailable(false);
            erb.setContent(erb.getContent());
            erb.setPostTime(erb.getPostTime());
            erb.setArticle(new ArticleBean(article));
            System.out.println("檢查數值" + erb.getNo());
            service.editReply(erb);
        } else if ("lock".equals(LockButton) && erb.getAvailable()==false) {
        	erb.setNo(erb.getNo());
            erb.setAvailable(true);
            erb.setContent(erb.getContent());
            erb.setPostTime(erb.getPostTime());
            erb.setArticle(new ArticleBean(article));
            System.out.println("檢查數值" + erb.getNo());
            service.editReply(erb);
        }
		}
		model.addAttribute("id", no);
		String NoS =Integer.toString(no);
		return "redirect:/Article?id="+NoS;
		}
	
//	@RequestMapping(value = "/SysArticle", method = RequestMethod.GET)
//	public String getSysArticleById(@RequestParam("id") Integer no, Model model,HttpServletRequest request,HttpSession session) {
//		session = request.getSession();
//		
//		model.addAttribute("SysArticle", service.getSysArticleById(no));
//		
//		return "SysArticle";
//	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewArticleForm(@RequestParam("id") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		ArticleBean ab = new ArticleBean();
		MovieBean mb = service.getMovieByNo(no);
		
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("MovieBean", mb);
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
		ab.setReport(false);
		int AuthorS = Integer.parseInt(request.getParameter("author"));
		ab.setAuthor(new MemberBean(AuthorS));
		int MovieS = Integer.parseInt(request.getParameter("movie"));
		ab.setMovie(new MovieBean(MovieS));
		ab.setAvailable(true);
		ab.setPostTime(new Date());
		service.addArticle(ab);
		String MovieNoS =Integer.toString(ab.getMovie().getNo());
		
		if (!errorMessage.isEmpty())
		{
			return "addArticle";
		} else
		{
			return "redirect:/MoviesForum/Articles?id="+MovieNoS;
		}
		
	}
	
//	@RequestMapping(value = "/admin/addSysArticle", method = RequestMethod.GET)
//	public String getAddNewSysArticleForm(Model model,HttpServletRequest request,HttpSession session) {
//		session = request.getSession();
//		SysArticleBean sb = new SysArticleBean();
//		
//		model.addAttribute("SysArticleBean", sb);
//		return "addSysArticle";
//	}
//	
//	@RequestMapping(value = "/admin/addSysArticle", method = RequestMethod.POST)
//	public String processAddNewSysArticleForm(@ModelAttribute("SysArticleBean") SysArticleBean ab, 
//		      BindingResult result, HttpServletRequest request ) throws ParseException {
//		
//		HashMap<String, String> errorMessage = new HashMap<>();
//		request.setAttribute("ErrMsg", errorMessage);
//		try
//		{
//			request.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e1)
//		{
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
//		if (ab.getTitle() == null || ab.getTitle().trim().length() == 0)
//		{
//			errorMessage.put("titleNull", "請輸入標題");
//		} else if (ab.getTitle().length() > 30)
//		{
//			errorMessage.put("titleOver", "字數超過30字");
//		}
//		int AuthorS = Integer.parseInt(request.getParameter("author"));
//		ab.setAuthor(new EmployeeBean(AuthorS));
//		int MovieS = Integer.parseInt(request.getParameter("movie"));
//		ab.setMovie(new MovieBean(MovieS));
//		ab.setAvailable(true);
//		ab.setPostTime(new Date());
//		service.addSysArticle(ab);
//		
//		if (!errorMessage.isEmpty())
//		{
//			return "addSysArticle";
//		} else
//		{
//			return "redirect:/admin/empIndexA";
//		}
//		
//	}


	
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
		ab.setReport(ab.getReport());
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
		String ArticleNoS =Integer.toString(ab.getNo());

		if (!errorMessage.isEmpty())
		{
			return "editArticle";
		} else
		{
			return "redirect:/Article?id="+ArticleNoS;
		}
		
	}
	
	@RequestMapping(value = "/addReply", method = RequestMethod.GET)
	public String getAddReplyForm(@RequestParam("id") Integer no, Model model) {
		ArticleBean ab = service.getArticleById(no);
		ReplyBean rb = new ReplyBean();
		String NoS =Integer.toString(ab.getNo());
		ab.setNoString(NoS);
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("ReplyBean", rb);
		return "addReply";
	}
	
	@RequestMapping(value = "/addReply", method = RequestMethod.POST)
	public String processAddReplyForm(@RequestParam("id") Integer no,@ModelAttribute("ReplyBean") ReplyBean rb, 
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
		ArticleBean ab = service.getArticleById(no);
		System.out.println("==postString==="+request.getParameter("postTimeString"));
		System.out.println("==postString==="+request.getParameter("noString"));
		
		rb.setArticle(ab);
		int AuthorS = Integer.parseInt(request.getParameter("author"));
		rb.setAuthor(new MemberBean(AuthorS));
		rb.setAvailable(true);
		rb.setPostTime(new Date());
		System.out.println("article=" + rb.getArticle());
		System.out.println("content=" + rb.getContent());
		System.out.println("postTime=" + rb.getPostTime());
		
		service.addReply(rb);
		String ArticleNoS =Integer.toString(ab.getNo());

		if (!errorMessage.isEmpty())
		{
			return "addReply";
		} else
		{
			return "redirect:/Article?id="+ArticleNoS;
		}
		
	}
	
	@RequestMapping(value = "/editReply", method = RequestMethod.GET)
	public String getEditReplyForm(@RequestParam("id") Integer no, Model model) {
		ReplyBean rb = service.getReplyById(no);
		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
		rb.setPostTimeString(ssdf.format(rb.getPostTime()));
		String NoS =Integer.toString(rb.getNo());
		rb.setrnoString(NoS);
		String articleNoS =Integer.toString(rb.getArticle().getNo());
		rb.setArticleString(articleNoS);
		model.addAttribute("ReplyBean", rb);
		return "editReply";
	}
	
	@RequestMapping(value = "/editReply", method = RequestMethod.POST)
	public String processEditReplyForm(@ModelAttribute("ReplyBean") ReplyBean rb, 
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
		
		System.out.println("==postString=="+request.getParameter("postTimeString"));
		System.out.println("==postString=="+request.getParameter("rnoString"));
		int NoS = Integer.parseInt(request.getParameter("rnoString"));
		rb.setNo(NoS);
		int AuthorS = Integer.parseInt(request.getParameter("author"));
		rb.setAuthor(new MemberBean(AuthorS));
		int ArticleS = Integer.parseInt(request.getParameter("articleString"));
		rb.setArticle(new ArticleBean(ArticleS));
		rb.setAvailable(true);
		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("postTimeString=" + rb.getPostTimeString());
		rb.setPostTime(ssdf.parse(request.getParameter("postTimeString")));
		
		System.out.println("content=" + rb.getContent());
		System.out.println("postTime=" + rb.getPostTime());
		
		service.editReply(rb);
		String ArticleNoS =request.getParameter("articleString");

		if (!errorMessage.isEmpty())
		{
			return "editReply";
		} else
		{
			return "redirect:/Article?id="+ArticleNoS;
		}
		
	}

	@ModelAttribute("tagList")
	public List<String> getTagList() {
		return service.getAllTags();
	}
	
//	@ModelAttribute("systagList")
//	public List<String> getSysTagList() {
//		return service.getAllSysTags();
//	}
	
	@RequestMapping(value = "/addReport", method = RequestMethod.GET)
	public String getAddReportForm(@RequestParam("id") Integer no, Model model) {
		ArticleBean ab = service.getArticleById(no);
		ReportBean rb = new ReportBean();
		
		String NoS =Integer.toString(ab.getNo());
		ab.setNoString(NoS);
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("ReportBean", rb);
		return "addReport";
	}
	
	@RequestMapping(value = "/addReport", method = RequestMethod.POST)
	public String processAddReportForm(@ModelAttribute("ReportBean") ReportBean rb,@RequestParam("id") Integer no, 
		      BindingResult result, HttpServletRequest request,HttpSession session ) throws ParseException{
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
		System.out.println("==postString=="+request.getParameter("postTimeString"));
		System.out.println("==postString=="+request.getParameter("noString"));
		ArticleBean ab = service.getArticleById(no);
		MemberBean mb=(MemberBean)session.getAttribute("LoginOK");
		int AuthorSS=mb.getNo();
		rb.setArticle(new ArticleBean(no));
//		int AuthorS = Integer.parseInt(request.getParameter("author"));
		rb.setAuthor(new MemberBean(AuthorSS));
//		rb.setAuthor(new MemberBean(rb.));
		rb.setPostTime(new Date());
		ab.setNo(ab.getNo());
		ab.setAvailable(ab.getAvailable());
		ab.setTitle(ab.getTitle());
		ab.setContent(ab.getContent());
		ab.setTag(ab.getTag());
		ab.setPostTime(ab.getPostTime());
		ab.setLikeCount(ab.getLikeCount());
		ab.setDislikeCount(ab.getDislikeCount());
		ab.setAuthor(ab.getAuthor());
		ab.setMovie(ab.getMovie());
		ab.setReport(true);
		System.out.println("article=" + rb.getArticle());
		System.out.println("content=" + rb.getContent());
		System.out.println("postTime=" + rb.getPostTime());
		
		service.addReport(rb);
		service.editArticle(ab);
		String ArticleNoS =Integer.toString(ab.getNo());

		if (!errorMessage.isEmpty())
		{
			return "addReport";
		} else
		{
			return "redirect:/Article?id="+ArticleNoS;
		}
		
	}
	
	@RequestMapping("/admin/emp_Forum")
	public String getEmpForum(Model model,HttpServletRequest request,HttpSession session) {
		
		List<ArticleBean> list = service.getAllArticles();
		List<MovieBean> moviesForumList = service.getAllMovies();
		
		model.addAttribute("Articles", list);
		model.addAttribute("Movies", moviesForumList);
		
		
		return "admin/emp_Forum";
	}
	
	@RequestMapping(value = "/admin/emp_Articles", method = RequestMethod.GET)
	public String getEmpArticle(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		
		List<ArticleBean> list = service.getArticlesByMovieNo2(no);
		List<MovieBean> moviesForumList = service.getAllMovies();
		model.addAttribute("Articles", list);
		model.addAttribute("Movies", moviesForumList);
		
		
		return "admin/emp_Articles";
	}
	
	@RequestMapping(value = "/reArticles", method = RequestMethod.POST)
	public String getReArticle(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		
		List<ArticleBean> list = service.getArticlesByMovieNo2(no);
		List<MovieBean> moviesForumList = service.getAllMovies();
		model.addAttribute("Articles", list);
		model.addAttribute("Movies", moviesForumList);
		
		
		return "admin/emp_Articles";
	}
	
	
	@RequestMapping(value = "/admin/LockArticle", method = RequestMethod.GET)
	public String getLockArticle(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		
		ArticleBean ab = service.getArticleById(no);

		model.addAttribute("Article", ab);
		

		return "admin/LockArticle";
	}
	
	@RequestMapping(value = "/admin/LockArticle", method = RequestMethod.POST)
	public String postLockArticle(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		String LockButton = request.getParameter("lockbutton");
		String cancelButton = request.getParameter("cancelbutton");
		ArticleBean ab = service.getArticleById(no);
			
		if ("lock".equals(LockButton)&&ab.getAvailable()==true) {
			ab.setNo(ab.getNo());
			ab.setTitle(ab.getTitle());
            ab.setAvailable(false);
            ab.setContent(ab.getContent());
            ab.setPostTime(ab.getPostTime());
            ab.setTag(ab.getTag());
            ab.setLikeCount(ab.getLikeCount());
            ab.setDislikeCount(ab.getDislikeCount());
            System.out.println("檢查數值" + ab.getNo());
            service.editArticle(ab);
        } else if ("lock".equals(LockButton)&&ab.getAvailable()==false) {
        	ab.setNo(ab.getNo());
			ab.setTitle(ab.getTitle());
            ab.setAvailable(true);
            ab.setContent(ab.getContent());
            ab.setPostTime(ab.getPostTime());
            ab.setTag(ab.getTag());
            ab.setLikeCount(ab.getLikeCount());
            ab.setDislikeCount(ab.getDislikeCount());
            System.out.println("檢查數值" + ab.getNo());
            service.editArticle(ab);
        }

		return "forward:/reArticles";
	}
	
	@RequestMapping(value = "/admin/ReportArticle", method = RequestMethod.GET)
	public String getReportArticle(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		
		ArticleBean ab = service.getArticleById(no);
		model.addAttribute("Article", ab);

		return "admin/ReportArticle";
	}
	

	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("author"
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
