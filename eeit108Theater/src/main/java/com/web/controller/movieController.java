package com.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
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
		MovieBean movie = service.getMovieById(no);
		model.addAttribute("movie", movie);
		List<TimeTableBean> times = time_service.getStartTimeByMovie(movie.getMovieName());
		List<TimeTableBean> theaters = time_service.getTimeTablesByMovie(movie.getMovieName());
		model.addAttribute("times", times);
		model.addAttribute("theaters", theaters);
		String[] movieTheater = {"A廳", "B廳", "C廳", "D廳", "E廳", "F廳", "G廳", "H廳", "I廳", "J廳"};
		List<TimeTableBean> startTime = new ArrayList<>();
		for (int i = 0; i < movieTheater.length; i++) {
			startTime = time_service.getStartTimeByMovieAndTheater(movie.getMovieName(), movieTheater[i]);
			if (startTime.isEmpty()) {
				continue;
			} else {
				model.addAttribute("startTime[" + i + "]", startTime);
				model.addAttribute("theater" + i, movieTheater[i]);
				System.out.println(startTime);
			}
		}
		
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
	@RequestMapping(value = "/addMovie", method = RequestMethod.GET)
	public String getAddNewMovie(Model model) {
		MovieBean mb = new MovieBean();
		model.addAttribute("movieBean", mb);
		return "addMovie";
	}
	@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
	public String processAddNewMovieForm(@ModelAttribute("movieBean") MovieBean mb, HttpServletRequest request) {
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
			File file = new File(picPath, mb.getNo().toString() + ext);
			uploadImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/movie";
	}
	@RequestMapping(value = "/editMovie", method = RequestMethod.GET)
	public String editMovieGet(@RequestParam(value = "no", required = false) Integer no, Model model) {
		MovieBean formerMovieBean = service.getMovieById(no);
		model.addAttribute("former", formerMovieBean);
		return "editMovie";
	}
	@RequestMapping(value = "/editMovie", method = RequestMethod.POST)
	public String editMoviePost(@ModelAttribute("former") MovieBean formerMovieBean, Model model, Integer no) throws IOException, SerialException, SQLException {
		MultipartFile uploadImage = formerMovieBean.getUploadImage();
		String originalFilename = uploadImage.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String picPath = "C:\\Users\\User\\git\\TheaterProject\\eeit108Theater\\data\\movie\\images";
		if (uploadImage != null && !uploadImage.isEmpty()) {
			byte[] b = uploadImage.getBytes();
			Blob blob = new SerialBlob(b);
			formerMovieBean.setMovieImage(blob);
			try {
				File file = new File(picPath, formerMovieBean.getNo().toString() + ext);
				uploadImage.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		} else {
			Blob blob = SystemUtils2018.fileToBlob(picPath + formerMovieBean.getNo() + ".jpg");
			formerMovieBean.setMovieImage(blob);
		}
		service.updateMovie(formerMovieBean);
		return "redirect:/movie";
	}
	@RequestMapping("/movieList")
	public String movieList(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movie", list);
		return "movieList";
	}
}

