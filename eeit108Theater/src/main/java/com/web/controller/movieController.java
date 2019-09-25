package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.TimeTableBean;
import com.web.service.MovieService;
import com.web.service.TimeTableService;

import data.util.SystemUtils2018;

@Controller
public class movieController {
	@Autowired
	MovieService service;
	@Autowired
	TimeTableService time_service;
	@Autowired
	ServletContext context;
	
	@RequestMapping("/films")
	public String films(Model model) {
		List<MovieBean> comingMovie = service.getComingMovies();
		List<MovieBean> releasedMovie = service.getReleasedMovies();
		model.addAttribute("comingMovies", comingMovie);
		model.addAttribute("releasedMovies", releasedMovie);
		return "films";
	}
	
	@RequestMapping("/MoviesForum")
	public String MoviesForumList(Model model) {
		List<MovieBean> moviesForumList = service.getAllMovies();
		List<MovieBean> ReleasedMoviesList = service.getReleasedMovies();
		List<MovieBean> ComingMoviesList = service.getComingMovies();
		model.addAttribute("title", "討論版");
		model.addAttribute("Movies", moviesForumList);
		model.addAttribute("ReleasedMovies", ReleasedMoviesList);
		model.addAttribute("ComingMovies", ComingMoviesList);
		return "MoviesForum";
	}
	
	@RequestMapping("/detail_{no}")
	public String movieTimes(Model model, @PathVariable Integer no) {
		MovieBean movieDetails = service.getMovieById(no);
		String[] string = movieDetails.getTrailerLink();
		model.addAttribute("movie", movieDetails);
		model.addAttribute("link", string[0]);
		return "detail";
	}

//	@RequestMapping("/movieTimes_{no}")
//	public String movieTimes(Model model, @PathVariable Integer no) {
//		MovieBean movie = service.getMovieById(no);
//		String[] string = movie.getTrailerLink();
//		List<TimeTableBean> times = time_service.getStartTimeByMovie(movie.getMovieName());
//		List<TimeTableBean> theatersB = time_service.getTheaterByMovieName(movie.getMovieName());
//		List<TimeTableBean> theatersA = new ArrayList<>();
//		for (int i = 0; i <= theatersB.size(); i++) {
//
//			if (theatersB.get(0).getTheater().equals("A廳")) {
//				theatersA.add(theatersB.get(0));
//				theatersB.remove(0);
//			}
//		}
//		model.addAttribute("link", string[0]);
//		model.addAttribute("movie", movie);
//		model.addAttribute("times", times);
//		model.addAttribute("theatersA", theatersA);
//		model.addAttribute("theatersB", theatersB);
//
//		System.out.println(theatersA);
//		List<TimeTableBean> times = time_service.getStartTimeByMovie(movie.getMovieName());
//		List<TimeTableBean> theaters = time_service.getTimeTablesByMovie(movie.getMovieName());
//		String[] movieTheater = {"A廳", "B廳", "C廳", "D廳", "E廳", "F廳", "G廳", "H廳", "I廳", "J廳"};
//		List<TimeTableBean> startTime = new ArrayList<>();
//		for (int i = 0; i < movieTheater.length; i++) {
//			startTime = time_service.getStartTimeByMovieAndTheater(movie.getMovieName(), movieTheater[i]);
//			if (startTime.isEmpty()) {
//				continue;
//			} else {
//				model.addAttribute("startTime[" + i + "]", startTime);
//				model.addAttribute("theater" + i, movieTheater[i]);
//				System.out.println(startTime);
//			}
//		}
//		model.addAttribute("link", string[0]);
//		model.addAttribute("movie", movie);
//		return "movieTimes";
//	}
	@RequestMapping("/ticketing")
	public String movieTicketingIndex(Model model) {
		List<MovieBean> releasedMovies = service.getReleasedMovies();
		model.addAttribute("releasedMovies", releasedMovies);
		return "ticketing";
	}
	@RequestMapping("/ticketing_{no}")
	public String movieTicketing(Model model, @PathVariable Integer no) {
//		Date date = new Date();
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		String today = df.format(date);
//		model.addAttribute("today", today);
//		for (int i = 1; i < 3; i++) {
//			date = tomorrow(date);
//			String tomorrow = df.format(date);
//			model.addAttribute("tomorrow" + i, tomorrow);
//		}
//		MovieBean movie = service.getMovieById(no);
//		model.addAttribute("movie", movie);
//		String[] movieTheater = {"A廳", "B廳", "C廳", "D廳", "E廳", "F廳", "G廳", "H廳", "I廳", "J廳"};
//		String[] movieVersion = {"2D", "3D", "IMAX"};
//		List<TimeTableBean> startTime = new ArrayList<>();
//		for (int i = 0; i < movieTheater.length; i++) {
//			for (int j = 0; j < movieVersion.length; j++) {
//				startTime = time_service.getStartTimeByMovieAndTheater(movie.getMovieName(), movieTheater[i], movieVersion[j]);
//				if (startTime.isEmpty()) {
//					continue;
//				} else {
//					model.addAttribute("startTime" + i, startTime);
//					model.addAttribute("theater" + i, movieTheater[i]);
//					model.addAttribute("version" + i, movieVersion[j]);
//					System.out.println(startTime);
//				}
//			}
//		}
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("today", sdf.format(date));
		model.addAttribute("tomorrow", sdf.format(tomorrow(date)));
		model.addAttribute("tdat", sdf.format(tomorrow(tomorrow(date))));
		MovieBean movie = service.getMovieById(no);
		model.addAttribute("movie", movie);
		String[] version = {"2D", "3D", "IMAX"};
		List<TimeTableBean> todayStartTimes_2D = new ArrayList<>();
		List<TimeTableBean> todayStartTimes_3D = new ArrayList<>();
		List<TimeTableBean> todayStartTimes_IMAX = new ArrayList<>();
		List<TimeTableBean> tomorrowStartTimes_2D = new ArrayList<>();
		List<TimeTableBean> tomorrowStartTimes_3D = new ArrayList<>();
		List<TimeTableBean> tomorrowStartTimes_IMAX = new ArrayList<>();
		List<TimeTableBean> tdatStartTimes_2D = new ArrayList<>();
		List<TimeTableBean> tdatStartTimes_3D = new ArrayList<>();
		List<TimeTableBean> tdatStartTimes_IMAX = new ArrayList<>();
		todayStartTimes_2D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[0], movie.getMovieName());
		todayStartTimes_3D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[1], movie.getMovieName());
		todayStartTimes_IMAX = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[2], movie.getMovieName());
		tomorrowStartTimes_2D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(date)), version[0], movie.getMovieName());
		tomorrowStartTimes_3D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(date)), version[1], movie.getMovieName());
		tomorrowStartTimes_IMAX = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(date)), version[2], movie.getMovieName());
		tdatStartTimes_2D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(tomorrow(date))), version[0], movie.getMovieName());
		tdatStartTimes_3D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(tomorrow(date))), version[1], movie.getMovieName());
		tdatStartTimes_IMAX = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(tomorrow(tomorrow(date))), version[2], movie.getMovieName());
		model.addAttribute("todayStartTimes_2D", todayStartTimes_2D);
		model.addAttribute("todayStartTimes_3D", todayStartTimes_3D);
		model.addAttribute("todayStartTimes_IMAX", todayStartTimes_IMAX);
		model.addAttribute("tomorrowStartTimes_2D", tomorrowStartTimes_2D);
		model.addAttribute("tomorrowStartTimes_3D", tomorrowStartTimes_3D);
		model.addAttribute("tomorrowStartTimes_IMAX", tomorrowStartTimes_IMAX);
		model.addAttribute("tdatStartTimes_2D", tdatStartTimes_2D);
		model.addAttribute("tdatStartTimes_3D", tdatStartTimes_3D);
		model.addAttribute("tdatStartTimes_IMAX", tdatStartTimes_IMAX);
		return "ticketing";
	}
	
	@RequestMapping(value = "/getPicture/{no}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer no) throws SQLException {
		String filePath = "data/movie/images/404.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MovieBean movie = service.getMovieById(no);
		if (movie != null) {
			Blob blob = movie.getMovieImage();
			filename = "1.jpeg";
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

//	@RequestMapping("/admin/updatePage")
//	public String updatePage(Model model, HttpServletRequest req, HttpSession session) {
//		String url = req.getParameter("url");
//		MovieBean mb = new MovieBean();
//		List<MovieBean> list = service.getAllMovies();
//		model.addAttribute("movies", list);
//		model.addAttribute("movieBean", mb);
//		return "forward:/admin/"+url;
//	}
	
	@RequestMapping(value = "/admin/movie_add", method = RequestMethod.GET)
	public String getAddNewMovie(Model model) {
		MovieBean mb = new MovieBean();
		model.addAttribute("movie", mb);
		return "admin/movie_add";
	}
	@RequestMapping(value = "/admin/movie_add", method = RequestMethod.POST)
	public String processAddNewMovieForm(@ModelAttribute("movie") MovieBean mb, HttpServletRequest request) {
		System.out.println("hello");
		MultipartFile uploadImage = mb.getUploadImage();
		String originalFilename = uploadImage.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (uploadImage != null && !uploadImage.isEmpty()) {
			try {
				byte[] b = uploadImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setMovieImage(blob);
				System.out.println("hello");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		service.saveMovie(mb);
		String picPath = "C:\\Users\\User\\git\\TheaterProject\\eeit108Theater\\data\\movie\\images";
		
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		//  將上傳的檔案移到指定的資料夾
		try {
			File file = new File(picPath, mb.getNo().toString() + ".jpeg");
			uploadImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "/admin/empIndexA";
	}
	@RequestMapping(value = "/admin/movie_edit", method = RequestMethod.GET)
	public String editMovieGet(@RequestParam(value = "no", required = false) Integer no, Model model) {
		MovieBean formerMovieBean = service.getMovieById(no);
		model.addAttribute("former", formerMovieBean);
		return "admin/movie_edit";
	}
	@RequestMapping(value = "/admin/movie_edit", method = RequestMethod.POST)
	public String editMoviePost(@ModelAttribute("former") MovieBean formerMovieBean, Model model, Integer no) throws IOException, SerialException, SQLException {
		MultipartFile uploadImage = formerMovieBean.getUploadImage();
		System.out.println(formerMovieBean.getNo());
		String picPath = "C:\\Users\\User\\git\\TheaterProject\\eeit108Theater\\data\\movie\\images\\";
		formerMovieBean.setNo(no);
		if (uploadImage != null && !uploadImage.isEmpty()) {
			byte[] b = uploadImage.getBytes();
			Blob blob = new SerialBlob(b);
			formerMovieBean.setMovieImage(blob);
			try {
				File file = new File(picPath, formerMovieBean.getNo().toString() + ".jpeg");
				uploadImage.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		} else {
			Blob blob = SystemUtils2018.fileToBlob(picPath + formerMovieBean.getNo().toString() + ".jpeg");
			formerMovieBean.setMovieImage(blob);
		}
		service.updateMovie(formerMovieBean);
		return "admin/empIndexA";
	}
	@RequestMapping("/admin/Table2")
	public String EmpTable1(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		return "admin/Table2";
	}
	
	public Date tomorrow(Date today) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
        return calendar.getTime();
    }

}

