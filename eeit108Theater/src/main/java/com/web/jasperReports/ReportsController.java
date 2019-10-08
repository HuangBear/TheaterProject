package com.web.jasperReports;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.Chart2jsp;
import com.web.entity.ChartContainer;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping("/admin")
public class ReportsController {

	String Root = "admin/";

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ireport", method = RequestMethod.GET, produces = {
			"application/xml" })
	public String report(HttpSession session, Model model) {
		// 报表数据源
		System.out.println("ireport");
		System.out.println("session" + session);
		List<JasperContainer> listBean = new ArrayList<>();
		List<Chart2jsp> list = (List<Chart2jsp>) session.getAttribute("chart2jsp");
		for (Chart2jsp chart2jsp : list) {
			String date;
			Integer count, total;
			List<Integer> listInteger = chart2jsp.getNumberPerMoon();

			List<ChartContainer> increasePerMoon = chart2jsp.getIncreasePerMoon();

			for (int i = 0; i < listInteger.size(); i++) {
				date = increasePerMoon.get(i).getChartKey();
				count = increasePerMoon.get(i).getChartValue();
				total = listInteger.get(i);
				System.out.println("date=" + date + "," + "count=" + count + "," + "species="
						+ "total=" + total);
				listBean.add(new JasperContainer(date, count, total));
//				listBean.add(new JasperContainer(increasePerMoon.get(i).getChartKey(),
//						increasePerMoon.get(i).getChartValue(), listInteger.get(i)));
			}
		}

		JRDataSource jrDataSource = new JRBeanCollectionDataSource(listBean);

		// 动态指定报表模板url
		model.addAttribute("url", "/WEB-INF/jasper/iReportBulletinPdf.jasper");
		System.out.println("1");
		model.addAttribute("format", "pdf"); // 报表格式
		System.out.println("2");
		model.addAttribute("jrMainDataSource", jrDataSource);
		System.out.println("3");
		return "iReportView"; // 对应jasper-defs.xml中的bean id
	}

}
