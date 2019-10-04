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
import com.web.dao.MemberDao;
import com.web.entity.BulletinBean;
import com.web.entity.MemberBean;
import com.web.service.ChartsService;

@Service
public class ChartsServiceImpl implements ChartsService {
	@Autowired
	BulletinDao bulletinDao;
	@Autowired
	MemberDao memberDao;

	@Override
	@Transactional
	public List<BulletinBean> getBuelltinPerMoon(String date) {
		Map<String, Date> map = changeDate(date);
		Date firstDate = map.get("min");
		Date lastDate = map.get("max");
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

}