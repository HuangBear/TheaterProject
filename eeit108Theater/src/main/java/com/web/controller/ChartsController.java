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

import com.web.entity.BulletinBean;
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

		ChartContainer discount0Count = new ChartContainer();
		ChartContainer discount1Count = new ChartContainer();
		ChartContainer discount2Count = new ChartContainer();
		List<Integer> totalCountList = new ArrayList<>();
		ChartContainer totalCount = new ChartContainer();

		for (Integer i = moonStart; i < moonEnd; i++) {
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
			// 取回
			System.out.println("inputValue=" + inputValue);
			List<BulletinBean> bulletinBean = chartsService.getBuelltinPreMoon(inputValue);
			// 讀取
			Integer discount0 = 0, discount1 = 0, discount2 = 0, b = 0;
			for (BulletinBean bb : bulletinBean) {
				Integer discount = bb.getDiscount();
				switch (discount)
				{
				case 0:
					discount0++;
					break;
				case 1:
					discount1++;
					break;
				case 2:
					discount2++;
					break;
				}
				b++;
			}
			ChartContainer bulletinCount = new ChartContainer();
			bulletinCount.setChartMap(inputKey, b);
			buelltinPreMoon.add(bulletinCount);
			totalCount.setCount(b);
			totalCountList.add(totalCount.getCount());
			discount0Count.setCount(discount0);
			discount1Count.setCount(discount1);
			discount2Count.setCount(discount2);
			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + bulletinBean);
		}
		model.addAttribute("buelltinPreMoon", buelltinPreMoon);
		model.addAttribute("totalCount", totalCountList);
		model.addAttribute("discount0PreMoon", discount0Count.getCount());
		model.addAttribute("discount1PreMoon", discount1Count.getCount());
		model.addAttribute("discount2PreMoon", discount2Count.getCount());
	}

}
