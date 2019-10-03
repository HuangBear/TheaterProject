package com.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.ChartContainer;
import com.web.service.ChartsService;

@Controller
//@RequestMapping(value = "/admin")
public class ChartsController {

	@Autowired
	ChartsService chartsService;

	String Root = "admin/";

	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public String intew(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("charts");
		buelltinPreMoon(model);
		buelltinPreYear(model);
		model.addAttribute("updatedTime", new Date());
		return Root + "charts";
	}

	Integer moonStart = 5;
	Integer moonEnd = moonStart + 10;
	Integer yearStart = 2019;

//	buelltinPreMoon
	public void buelltinPreMoon(Model model) {
		// 格式2019-11
		System.out.println("buelltinPreMoon");
		List<ChartContainer> buelltinPreMoon = new ArrayList<>();

		String inputValue = null, inputKey = null;
		for (Integer i = moonStart; i < moonEnd; i++) {
			ChartContainer chartContainer = new ChartContainer();
			if (i < 10) {
				inputValue = yearStart + "-0" + i;
				inputKey = yearStart + "年0" + i + "月";
			} else if (10 <= i && i < 13) {
				inputValue = yearStart + "-" + i;
				inputKey = yearStart + "年" + i + "月";
			} else if (i >= 13) {
				int q = i - 12;
				if (q < 10) {
					inputValue = yearStart + 1 + "-0" + q;
					inputKey = yearStart + 1 + "年0" + q + "月";
				} else {
					inputValue = yearStart + 1 + "-" + q;
					inputKey = yearStart + 1 + "年" + q + "月";
				}
			}
			Integer inputValueCount = chartsService.getBuelltinPreMoon(inputValue);
			chartContainer.setChartMap(inputKey, inputValueCount);
			buelltinPreMoon.add(chartContainer);

			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + inputValueCount);
		}
		model.addAttribute("buelltinPreMoon", buelltinPreMoon);
	}

//	buelltinPreMoon
	public void buelltinPreYear(Model model) {
		// 格式2019-11
		System.out.println("buelltinPreYear");
		List<ChartContainer> buelltinPreMoon = new ArrayList<>();

		String inputValue = null, inputKey = null;
		for (Integer i = moonStart; i < moonEnd; i++) {
			ChartContainer chartContainer = new ChartContainer();
			if (i < 10) {
				inputValue = yearStart + "-0" + i;
				inputKey = yearStart + "年0" + i + "月";
			} else if (10 <= i && i < 13) {
				inputValue = yearStart + "-" + i;
				inputKey = yearStart + "年" + i + "月";
			} else if (i >= 13) {
				int q = i - 12;
				if (q < 10) {
					inputValue = yearStart + 1 + "-0" + q;
					inputKey = yearStart + 1 + "年0" + q + "月";
				} else {
					inputValue = yearStart + 1 + "-" + q;
					inputKey = yearStart + 1 + "年" + q + "月";
				}
			}
			Integer inputValueCount = chartsService.getBuelltinPreMoon(inputValue);
			chartContainer.setChartMap(inputKey, inputValueCount);
			buelltinPreMoon.add(chartContainer);

			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + inputValueCount);
		}
		model.addAttribute("buelltinPreMoon", buelltinPreMoon);
	}

}
