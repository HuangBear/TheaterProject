package com.web.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;
import com.web.service.ChartsService;

@Service
public class ChartsServiceImpl implements ChartsService {
	@Autowired
	BulletinDao dao;

	@Override
	@Transactional
	public List<BulletinBean> getBuelltinPreMoon(String date) {
		List<BulletinBean> buelltinPreMoon = dao.getBuelltinPreMoon(date);
		return buelltinPreMoon;
	}

}