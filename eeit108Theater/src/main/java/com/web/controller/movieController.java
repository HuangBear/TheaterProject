package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.MovieBean;
import com.web.service.MovieService;

@Controller
public class movieController {
	@Autowired
	MovieService service;
	
	@RequestMapping("/movie")
	public String movieIntroduction(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		return "movie";
	}
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	@RequestMapping("/hi")
	public String hi() {
		return "an";
	}
}
