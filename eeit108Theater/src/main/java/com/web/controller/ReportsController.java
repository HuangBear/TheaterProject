package com.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.service.ChartsService;

@Controller
@RequestMapping("/admin")
public class ReportsController {

	@Autowired
	ChartsService service;

	String Root = "admin/";

	@RequestMapping(value = "/ireport", method = RequestMethod.GET)
	public String report(HttpSession session) {
		// 报表数据源
		System.out.println("ireport");
		System.out.println("session" + session);
//		List<Chart2jsp> list = (List<Chart2jsp>) session.getAttribute("chart2jsp");
//		for (Chart2jsp chart2jsp : list) {
//			ChartContainer fir = chart2jsp.getFir();
//			ChartContainer sec = chart2jsp.getSec();
//			ChartContainer thi = chart2jsp.getThi();
//			ChartContainer fou = chart2jsp.getFou();
//			ChartContainer fif = chart2jsp.getFif();
//			ChartContainer six = chart2jsp.getSix();
//			String str1 = chart2jsp.getStr1();
//			String str2 = chart2jsp.getStr2();
//			String str3 = chart2jsp.getStr3();
//
//			List<Integer> listInteger = chart2jsp.getNumberPerMoon();
//			for (Integer li : listInteger) {
//				System.out.println("integer" + li);
//			}
//			List<ChartContainer> increasePerMoon = chart2jsp.getIncreasePerMoon();
//			for (ChartContainer iPM : increasePerMoon) {
//
//			}
//			List<ChartContainer> speciesPerMoon = chart2jsp.getSpeciesPerMoon();
//			for (ChartContainer sPM : speciesPerMoon) {
//				System.out.println("speciesPerMoon" + sPM.getChartKey());
//				System.out.println("speciesPerMoon" + sPM.getChartValue());
//			}
//		}

//		JRDataSource jrDataSource = new JRBeanCollectionDataSource(JavaBeanPerson.getList());

		// 动态指定报表模板url
//		model.addAttribute("url", "/WEB-INF/jasper/MvcIReportExample.jasper");
//		model.addAttribute("format", "pdf"); // 报表格式
//		model.addAttribute("jrMainDataSource", jrDataSource);

		return "iReportView"; // 对应jasper-defs.xml中的bean id
	}

}
