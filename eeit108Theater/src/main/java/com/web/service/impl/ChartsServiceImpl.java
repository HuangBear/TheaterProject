package com.web.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.service.ChartsService;

@Service
public class ChartsServiceImpl implements ChartsService {
	@Autowired
	BulletinDao dao;

	@Override
	@Transactional
	public Integer getBuelltinPreMoon(String date) {
		Integer buelltinPreMoon = dao.getBuelltinPreMoon(date);
		return buelltinPreMoon;
	}

}