package com.web.service;

import java.util.List;

import com.web.entity.BulletinBean;

public interface ChartsService {
	List<BulletinBean> getBuelltinPreMoon(String date);

}