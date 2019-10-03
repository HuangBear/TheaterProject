package com.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.BulletinBean;
import com.web.entity.MovieBean;
import com.web.entity.TimeTableBean;
import com.web.service.BulletinService;
import com.web.service.MovieService;
import com.web.service.TimeTableService;

@Controller
public class _Controller {

	@Autowired
	MovieService movieService;

	@Autowired
	BulletinService bulletinService;

	@Autowired
	TimeTableService time_service;

	@RequestMapping(value = { "/", "/index" })
	public String index(Model model) {
		List<MovieBean> hello = new ArrayList<>();
		hello = movieService.getReleasedMovies();
		model.addAttribute("releasedMovies", hello);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 1; i <= 5; i++) {
			model.addAttribute("day" + i, sdf.format(date));
			date = tomorrow(date);
		}
		List<BulletinBean> bulletin = bulletinService.getExistenceBulletin("startDate", "ASC");
		System.out.println(bulletin);
		model.addAttribute("BulletinBean", bulletin);
		return "index";
	}

	@RequestMapping("/getVersion")
	@ResponseBody
	public List<TimeTableBean> index1(Model model, String movieName) {
		List<TimeTableBean> list = time_service.getVersionByMovieName(movieName);
		System.out.println(list);
		return list;
	}

	@RequestMapping("/getStartTimes")
	@ResponseBody
	public List<TimeTableBean> index2(Model model, String movieName, String Date, String version) {
		List<TimeTableBean> list = time_service.getTimeByDateAndVersionAndMovie(Date, version,
				movieName);
		System.out.println(list);
		return list;
	}

	@RequestMapping("/getTimeNo")
	@ResponseBody
	public List<TimeTableBean> index3(String movieName, String Date, String version, String Time,
			HttpServletRequest request) {
		List<TimeTableBean> list = time_service.getTimeNoByDateAndVersionAndMovieAndTime(Date,
				version, movieName, Time);
		System.out.println(list);
		return list;
	}

	public Date tomorrow(Date today) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
		return calendar.getTime();
	}
}
