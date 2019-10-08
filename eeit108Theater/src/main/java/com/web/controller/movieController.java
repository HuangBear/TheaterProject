package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		List<MovieBean> OffMoviesList = service.getOffMovies();
		model.addAttribute("title", "討論版");
		model.addAttribute("Movies", moviesForumList);
		model.addAttribute("ReleasedMovies", ReleasedMoviesList);
		model.addAttribute("ComingMovies", ComingMoviesList);
		model.addAttribute("OffMovies", OffMoviesList);
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
	
	@RequestMapping("/detail2_{no}")
	public String movieTimes2(Model model, @PathVariable Integer no) {
		MovieBean movieDetails = service.getMovieById(no);
		String[] string = movieDetails.getTrailerLink();
		model.addAttribute("movie", movieDetails);
		model.addAttribute("link", string[0]);
		return "detail2";
	}

	@RequestMapping("/ticketing")
	public String movieTicketingIndex(Model model) {
		List<MovieBean> releasedMovies = service.getReleasedMovies();
		model.addAttribute("releasedMovies", releasedMovies);
		return "ticketing";
	}
	@RequestMapping("/ticketing_{no}")
	public String movieTicketing(Model model, @PathVariable Integer no) {
		List<MovieBean> releasedMovies = service.getReleasedMovies();
		model.addAttribute("releasedMovies", releasedMovies);
		MovieBean movie = service.getMovieById(no);
		model.addAttribute("movie", movie);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<List<TimeTableBean>> times = new ArrayList<>();
		for (int i = 1; i <= 5; i++) {
			String[] version = {"2D", "3D", "IMAX"};
			model.addAttribute("day" + i, sdf.format(date));			// 日期按鈕
			List<TimeTableBean> StartTimes_2D = new ArrayList<>();
			List<TimeTableBean> StartTimes_3D = new ArrayList<>();
			List<TimeTableBean> StartTimes_IMAX = new ArrayList<>();
			
			StartTimes_2D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[0], movie.getMovieName());
			StartTimes_3D = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[1], movie.getMovieName());
			StartTimes_IMAX = time_service.getStartTimeByDateAndVersionAndMovie(sdf.format(date), version[2], movie.getMovieName());
			
			times.add(StartTimes_2D);
			times.add(StartTimes_3D);
			times.add(StartTimes_IMAX);
			
			
			date = tomorrow(date);
		}
		model.addAttribute("times", times);
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
	
	@RequestMapping(value = "/admin/movie_add", method = RequestMethod.GET)
	public String getAddNewMovie(Model model) {
		MovieBean mb = new MovieBean();
		model.addAttribute("movie", mb);
		return "admin/movie_add";
	}
	@RequestMapping(value = "/admin/movie_add", method = RequestMethod.POST)
	public String processAddNewMovieForm(@ModelAttribute("movie") MovieBean mb, HttpServletRequest request) {
		MultipartFile uploadImage = mb.getUploadImage();
		String originalFilename = uploadImage.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (uploadImage != null && !uploadImage.isEmpty()) {
			try {
				byte[] b = uploadImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setMovieImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		service.saveMovie(mb);
		return "redirect:/admin/empIndexA";
	}
	@RequestMapping(value = "/admin/movie_edit", method = RequestMethod.GET)
	public String editMovieGet(@RequestParam(value = "no", required = false) Integer no, Model model, HttpServletRequest req) throws SQLException {
//		MovieBean formerMovieBean = service.getMovieById(no);
		MovieBean formerMovieBean= service.getMovieById(Integer.parseInt(req.getParameter("no")));
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
		} else {
			MovieBean hello = service.getMovieByName(formerMovieBean.getMovieName());
			formerMovieBean.setMovieImage(hello.getMovieImage());
		}
		service.updateMovie(formerMovieBean);
		return "admin/adminIndex";
	}
	@RequestMapping("/admin/Table2")
	public String EmpTable1(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		return "admin/Table2";
	}
	
	@RequestMapping(value = "/admin/timeTable_add", method = RequestMethod.GET)
	public String addTimeTableGet(Model model) {
		TimeTableBean ttb = new TimeTableBean();
		model.addAttribute("time", ttb);
		List<String> list = new ArrayList<>();
		list = service.getMovieNames();
		String[] movieName = new String[30];
		for (int i = 0; i < list.size(); i++) {
			movieName[i] = list.get(i);
		}
		model.addAttribute("movies", list);
		return "admin/timeTable_add";
	}
	
	@RequestMapping(value = "/admin/timeTable_add", method = RequestMethod.POST)
	public String addTimeTablePost(@ModelAttribute("time") TimeTableBean ttb, Model model) {
		
		String[] splitColon = ttb.getStartTime().split(":");
		int hour = Integer.parseInt(splitColon[0]);
		int minute = Integer.parseInt(splitColon[1]);
		int breakTime = ttb.getBreakTime();
		int duration = ttb.getDuration();
		int sum = hour * 60 + minute;
		MovieBean mb = service.getMovieByName(ttb.getMovieName());
		ttb.setMovie(mb);
		do {
			time_service.saveTimeTable(ttb);
			if (duration % 10 != 0) {
				duration += 10 - (duration % 10);
			}
			sum += duration + breakTime;
			String HH = String.valueOf(sum / 60);
			String mm = String.valueOf(sum % 60);
			if (Integer.parseInt(mm) < 10) {
				mm = "0" + mm;
			}
			ttb.setStartTime(HH + ":" + mm);
		} while (sum < 1440);
		return "redirect:/admin/empIndexA";
	}
	@RequestMapping("/getMovieDetail")
	@ResponseBody
	public List<String> getMovieDetail(Model model, String movieName) {
		MovieBean mb = service.getMovieByName(movieName);
		System.out.println(mb.getMovieName());
		System.out.println(mb.getDuration());
		System.out.println(mb.getNo());
		List<String> list = new ArrayList<>();
		list.add(mb.getMovieName());
		list.add(mb.getDuration().toString());
		list.add(mb.getNo().toString());
		return list;
	}
	
	
	public Date tomorrow(Date today) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
        return calendar.getTime();
    }

}

