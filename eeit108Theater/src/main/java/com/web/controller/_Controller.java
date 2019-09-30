package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.MovieBean;
import com.web.service.MovieService;

@Controller
public class _Controller {
	
	@Autowired
	MovieService service;
	
	@RequestMapping("/")
	public String index(Model model)
	{
		List<MovieBean> releasedMovies = service.getReleasedMovies();
		model.addAttribute("releasedMovies", releasedMovies);
		return "index";
	}
}
