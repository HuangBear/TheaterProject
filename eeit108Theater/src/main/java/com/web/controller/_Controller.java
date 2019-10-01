package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.BulletinBean;
import com.web.entity.MovieBean;
import com.web.service.BulletinService;
import com.web.service.MovieService;

@Controller
public class _Controller {

	@Autowired
	MovieService movieService;

	@Autowired
	BulletinService bulletinService;

	@RequestMapping("/")
	public String index(Model model) {
		List<BulletinBean> bulletin = bulletinService.getExistenceBulletin("startDate");
		model.addAttribute("BulletinBean", bulletin);
		List<MovieBean> releasedMovies = movieService.getReleasedMovies();
		model.addAttribute("releasedMovies", releasedMovies);
		return "index";
	}
}
