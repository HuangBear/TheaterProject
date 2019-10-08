package com.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.dao.EmployeeDao;
import com.web.dao.MemberDao;
import com.web.dao.MovieDao;
import com.web.dao.OrderDao;
import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;
import com.web.entity.OrderBean;
import com.web.entity.OrderItemBean;
import com.web.entity.SeatBean;
import com.web.service.ChartsService;

@Service
public class ChartsServiceImpl implements ChartsService {
	@Autowired
	BulletinDao bulletinDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	EmployeeDao employeeDao;
	@Autowired
	MovieDao movieDao;
	@Autowired
	OrderDao orderDao;

	@Override
	@Transactional
	public List<BulletinBean> getBuelltinPerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		String firstDate = date + "-01";
		Date max = map.get("max");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String lastDate = sdf.format(max);
		List<BulletinBean> buelltinPerMoon = bulletinDao.getBuelltinPerMoon(firstDate, lastDate);
		return buelltinPerMoon;
	}

	@Override
	@Transactional
	public List<MemberBean> getMemberPerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		Date firstDate = map.get("min");
		Date lastDate = map.get("max");
		List<MemberBean> memberPerMoon = memberDao.getMemberPerMoon(firstDate, lastDate);
		return memberPerMoon;
	}

	@Override
	@Transactional
	public List<EmployeeBean> getEmployeePerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		Date firstDate = map.get("min");
		Date lastDate = map.get("max");
		List<EmployeeBean> employeePerMoon = employeeDao.getMmployeePerMoon(firstDate, lastDate);
		return employeePerMoon;
	}

	@Override
	@Transactional
	public List<MovieBean> getMoviePerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		Date firstDate = map.get("min");
		Date lastDate = map.get("max");
		List<MovieBean> moviePerMoon = movieDao.getMoviePerMoon(firstDate, lastDate);
		return moviePerMoon;
	}

	@Override
	@Transactional
	public List<OrderBean> getOrderPerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		Date firstDate = map.get("min");
		Date lastDate = map.get("max");
		List<OrderBean> moviePerMoon = orderDao.getOrderPerMoon(firstDate, lastDate);
		for (OrderBean ob : moviePerMoon) {
			cancelLazy(ob);
		}
		return moviePerMoon;
	}

	// ActualMaximum Day
	public Map<String, Date> changeDate(String date) {
		System.out.println("changeDate");
		int year = Integer.parseInt(date.split("-")[0]); // 年
		int month = Integer.parseInt(date.split("-")[1]); // 月
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		cal.set(Calendar.DAY_OF_MONTH, lastDay);
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		Date lastDate = cal.getTime();
		Date firstDate = null;
		try {
			firstDate = sdf.parse(date + "-01 00:00:00");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(firstDate);
		System.out.println(lastDate);
		Map<String, Date> map = new HashMap<String, Date>();
		map.put("min", firstDate);
		map.put("max", lastDate);
		return map;
	}

	@SuppressWarnings("unused")
	private void cancelLazy(OrderBean ob) {
		List<OrderItemBean> oiList = ob.getOrderItems();
		if (oiList != null)
			for (OrderItemBean oib : oiList)
				oib.getAvailable();
		List<SeatBean> sList = ob.getSeats();
		if (sList != null)
			for (SeatBean sb : sList)
				sb.getAvailable();
	}

}