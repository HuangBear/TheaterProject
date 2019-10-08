package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.entity.TheaterBean;
import com.web.service.TheaterService;

@Controller
public class TheaterController {

	final static String pac = "theater/";

	@Autowired
	TheaterService tServ;

	@RequestMapping("/admin/theaterManagement")
	public String allTheater(Model model) {
		List<TheaterBean> list = tServ.getAllTheaters();
		for (TheaterBean tb : list) {
			System.out.println(tb.toString());
		}
		model.addAttribute("theaters", list);
		return pac + "allTheater";
	}

	@RequestMapping(value = "/theater/modify", method = RequestMethod.GET)
	public String modifyTheater(Model model, @RequestParam("theaterNo") Integer theaterNo) {
		TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		model.addAttribute("theaterNo", theaterNo);
		return pac + "modifyTheater";
	}

	@RequestMapping(value = "/theater/modify", method = RequestMethod.POST)
	public String modifyTheaterConfirm(Model model, @RequestParam("theaterNo") Integer theaterNo,
			@RequestParam(value = "seat", required = false) String[] seat) {
		TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		if (seat == null) {
			tb.setPreserveSeat(new String[] {});
		} else {
			tb.setPreserveSeat(seat);
		}
		tServ.update(tb);
		System.out.println(Arrays.toString(seat));
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		model.addAttribute("theaterNo", theaterNo);
		return pac + "modifyTheater";
	}

	@RequestMapping(value = "/theater/redesign", method = RequestMethod.GET)
	public String redesignTheater(Model model, @RequestParam("theaterNo") Integer theaterNo) {
		TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		model.addAttribute("theaterNo", theaterNo);
		return pac + "redesignTheater";
	}

	@RequestMapping(value = "/theater/redesign", method = RequestMethod.POST)
	public String redesignTheaterConfirm(Model model, @RequestParam("theaterNo") Integer theaterNo,
			@RequestParam(value = "seat", required = false) String[] seat) {
		TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		if (seat == null) {
			tb.setNullSeat(new String[] {});
		} else {
			tb.setNullSeat(seat);
		}
		tServ.update(tb);
		System.out.println("design seat = " + Arrays.toString(seat));
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		model.addAttribute("theaterNo", theaterNo);
		return pac + "redesignTheater";
	}

	@RequestMapping(value = "/theater/new", method = RequestMethod.GET)
	public String newTheater(Model model, HttpSession session) {
		session.removeAttribute("newTheater");
		TheaterBean tb = new TheaterBean();
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		session.setAttribute("newTheater", tb);
		return pac + "newTheater";
	}

	@RequestMapping(value = "/theater/new", method = RequestMethod.POST)
	public String newTheaterConfirm(Model model, HttpSession session, @SessionAttribute("newTheater") TheaterBean tb,
			HttpServletRequest req) {
		tb.setTheater(req.getParameter("theater"));
		tb.setZone(Integer.valueOf(req.getParameter("zone")));
		tb.setRowCnt(Integer.valueOf(req.getParameter("rowCnt")));
		tb.setMiddle(Integer.valueOf(req.getParameter("middle")));
		tb.setSide(Integer.valueOf(req.getParameter("side")));
		tb.setSubside(Integer.valueOf(req.getParameter("subside")));
		String[] seat = req.getParameterValues("seat");
		if (seat == null) {
			tb.setNullSeat(new String[] {});
		} else {
			tb.setNullSeat(req.getParameterValues("seat"));
		}
		tServ.save(tb);
		session.removeAttribute("newTheater");
		// String status = tServ.getTheaterStatus(tb);
		// model.addAttribute("seatTable", status);
		// model.addAttribute("minWidth", tb.getTheaterWidth());
		return "redirect:/admin/theaterManagement";
	}

	@RequestMapping("/theater/refresh")
	public String newTheaterRefresh(Model model, HttpServletRequest req,
			@SessionAttribute("newTheater") TheaterBean tb) {
		tb.setTheater(req.getParameter("theater"));
		tb.setZone(Integer.valueOf(req.getParameter("zone")));
		tb.setRowCnt(Integer.valueOf(req.getParameter("rowCnt")));
		tb.setMiddle(Integer.valueOf(req.getParameter("middle")));
		tb.setSide(Integer.valueOf(req.getParameter("side")));
		tb.setSubside(Integer.valueOf(req.getParameter("subside")));
		String[] seat = req.getParameterValues("seat");
		if (seat == null) {
			tb.setNullSeat(new String[] {});
		} else {
			tb.setNullSeat(req.getParameterValues("seat"));
		}
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		return pac + "newTheater";
	}

	@RequestMapping("/theater/detail")
	public String detailTheater(Model model, @RequestParam("theaterNo") Integer theaterNo) {
		TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		return pac + "detailTheater";
	}
	@RequestMapping("/theater/preview")
	public String previewTheater(Model model, @SessionAttribute("newTheater") TheaterBean tb,HttpServletRequest req) {
		//TheaterBean tb = tServ.getTheaterByNo(theaterNo);
		tb.setTheater(req.getParameter("theater"));
		tb.setZone(Integer.valueOf(req.getParameter("zone")));
		tb.setRowCnt(Integer.valueOf(req.getParameter("rowCnt")));
		tb.setMiddle(Integer.valueOf(req.getParameter("middle")));
		tb.setSide(Integer.valueOf(req.getParameter("side")));
		tb.setSubside(Integer.valueOf(req.getParameter("subside")));
		String[] seat = req.getParameterValues("seat");
		if (seat == null) {
			tb.setNullSeat(new String[] {});
		} else {
			tb.setNullSeat(req.getParameterValues("seat"));
		}
		String status = tServ.getTheaterStatus(tb);
		model.addAttribute("seatTable", status);
		model.addAttribute("minWidth", tb.getTheaterWidth());
		model.addAttribute("theater", tb.getTheater());
		return pac + "previewTheater";
	}

}
