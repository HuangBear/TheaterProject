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
import com.web.entity.Chart2jsp;
import com.web.entity.ChartContainer;
import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.service.ChartsService;

@Controller
//@RequestMapping(value = "/admin")
public class ChartsController {

	@Autowired
	ChartsService service;

	String Root = "admin/";

	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public String intew(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("charts");

		List<Chart2jsp> list = new ArrayList<Chart2jsp>();

		Chart2jsp buelltin = buelltinPerMoon(model);
		list.add(buelltin);

		Chart2jsp member = memberPerMoon(model);
		list.add(member);

		Chart2jsp employee = employeePerMoon(model);
		list.add(employee);

		Chart2jsp movie = moviePerMoon(model);
		list.add(movie);

		model.addAttribute("chart2jsp", list);
		model.addAttribute("updatedTime", new Date());
		return Root + "charts";
	}

	Integer moonStart = 5;
	Integer moonEnd = moonStart + 10;
	Integer yearStart = 2019;

//	buelltinPerMoon
	public Chart2jsp buelltinPerMoon(Model model) {
		// 格式2019-11
		System.out.println("buelltinPerMoon");
		List<ChartContainer> buelltinPerMoon = new ArrayList<>();
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
			List<BulletinBean> bulletinBean = service.getBuelltinPerMoon(inputValue);
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
			buelltinPerMoon.add(bulletinCount);
			totalCount.setCount(b);
			totalCountList.add(totalCount.getCount());
			discount0Count.setCount(discount0);
			discount1Count.setCount(discount1);
			discount2Count.setCount(discount2);
			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + b);
		}
		Chart2jsp chart2jsp = new Chart2jsp();
		chart2jsp.setListChartContainer(buelltinPerMoon);

		chart2jsp.setListInteger(totalCountList);

		ChartContainer Fir = new ChartContainer();
		Fir.setChartMap("純公告", discount0Count.getCount());
		chart2jsp.setFir(Fir);

		ChartContainer Sec = new ChartContainer();
		Sec.setChartMap("純公告", discount1Count.getCount());
		chart2jsp.setSec(Sec);

		ChartContainer Thi = new ChartContainer();
		Thi.setChartMap("純公告", discount2Count.getCount());
		chart2jsp.setThi(Thi);

		chart2jsp.setStr1("公告");

		return chart2jsp;
	}

//	memberPerMoon
	public Chart2jsp memberPerMoon(Model model) {
		// 格式2019-11
		System.out.println("memberPerMoon");
		List<ChartContainer> memberPerMoon = new ArrayList<>();
		String inputValue = null, inputKey = null;

		ChartContainer male = new ChartContainer();
		ChartContainer female = new ChartContainer();

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
			List<MemberBean> memberBean = service.getMemberPerMoon(inputValue);
			// 讀取
			Integer gender1 = 0, gender2 = 0, b = 0;
			for (MemberBean mb : memberBean) {
				Integer gender = mb.getGender();
				switch (gender)
				{
				case 1:
					gender1++;
					break;
				case 2:
					gender2++;
					break;
				}
				b++;
			}
			ChartContainer memberCount = new ChartContainer();
			memberCount.setChartMap(inputKey, b);
			memberPerMoon.add(memberCount);
			totalCount.setCount(b);
			totalCountList.add(totalCount.getCount());
			male.setCount(gender1);
			female.setCount(gender2);

			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + b);
		}
		Chart2jsp chart2jsp = new Chart2jsp();
		chart2jsp.setListChartContainer(memberPerMoon);

		chart2jsp.setListInteger(totalCountList);

		ChartContainer Fir = new ChartContainer();
		Fir.setChartMap("男性", male.getCount());
		chart2jsp.setFir(Fir);

		ChartContainer Sec = new ChartContainer();
		Sec.setChartMap("女性", female.getCount());
		chart2jsp.setSec(Sec);

		chart2jsp.setStr1("會員");

		return chart2jsp;
	}

//	memberPerMoon
	public Chart2jsp employeePerMoon(Model model) {
		// 格式2019-11
		System.out.println("employeePerMoon");
		List<ChartContainer> employeePerMoon = new ArrayList<>();
		String inputValue = null, inputKey = null;

		ChartContainer male = new ChartContainer();
		ChartContainer female = new ChartContainer();

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
			List<EmployeeBean> employeeBean = service.getEmployeePerMoon(inputValue);
			// 讀取
			Integer gender1 = 0, gender2 = 0, b = 0;
			for (EmployeeBean eb : employeeBean) {
				Integer gender = eb.getGender();
				switch (gender)
				{
				case 1:
					gender1++;
					break;
				case 2:
					gender2++;
					break;
				}
				b++;
			}
			ChartContainer memberCount = new ChartContainer();
			memberCount.setChartMap(inputKey, b);
			employeePerMoon.add(memberCount);
			totalCount.setCount(b);
			totalCountList.add(totalCount.getCount());
			male.setCount(gender1);
			female.setCount(gender2);

			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + b);
		}
		Chart2jsp chart2jsp = new Chart2jsp();
		chart2jsp.setListChartContainer(employeePerMoon);

		chart2jsp.setListInteger(totalCountList);

		ChartContainer Fir = new ChartContainer();
		Fir.setChartMap("男性", male.getCount());
		chart2jsp.setFir(Fir);

		ChartContainer Sec = new ChartContainer();
		Sec.setChartMap("女性", female.getCount());
		chart2jsp.setSec(Sec);

		chart2jsp.setStr1("員工");

		return chart2jsp;
	}

//	memberPerMoon
	public Chart2jsp moviePerMoon(Model model) {
		// 格式2019-11
		System.out.println("moviePerMoon");
		List<ChartContainer> moviePerMoon = new ArrayList<>();
		String inputValue = null, inputKey = null;

		ChartContainer r1 = new ChartContainer();
		ChartContainer r2 = new ChartContainer();
		ChartContainer r3 = new ChartContainer();
		ChartContainer r4 = new ChartContainer();

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
			List<MovieBean> movieBean = service.getMoviePerMoon(inputValue);
			// 讀取
			Integer rating1 = 0, rating2 = 0, rating3 = 0, rating4 = 0, b = 0;
			for (MovieBean mb : movieBean) {
				String rating = mb.getRating();
				switch (rating)
				{
				case "普遍級":
					rating1++;
					break;
				case "輔導級":
					rating2++;
					break;
				case "保護級":
					rating3++;
					break;
				case "限制級":
					rating4++;
					break;
				}
				b++;
			}
			ChartContainer memberCount = new ChartContainer();
			memberCount.setChartMap(inputKey, b);
			moviePerMoon.add(memberCount);
			totalCount.setCount(b);
			totalCountList.add(totalCount.getCount());
			r1.setCount(rating1);
			r2.setCount(rating2);
			r3.setCount(rating3);
			r4.setCount(rating4);
			System.out.println("inputKey=" + inputKey);
			System.out.println("次數=" + b);
		}
		Chart2jsp chart2jsp = new Chart2jsp();
		chart2jsp.setListChartContainer(moviePerMoon);

		chart2jsp.setListInteger(totalCountList);

		ChartContainer Fir = new ChartContainer();
		Fir.setChartMap("普遍級", r1.getCount());
		chart2jsp.setFir(Fir);

		ChartContainer Sec = new ChartContainer();
		Sec.setChartMap("輔導級", r2.getCount());
		chart2jsp.setSec(Sec);

		ChartContainer Thi = new ChartContainer();
		Thi.setChartMap("保護級", r3.getCount());
		chart2jsp.setThi(Thi);

		ChartContainer Fou = new ChartContainer();
		Fou.setChartMap("限制級", r4.getCount());
		chart2jsp.setFou(Fou);

		chart2jsp.setStr1("電影");

		return chart2jsp;
	}

}
