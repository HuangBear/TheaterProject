package com.web.service;

import java.util.List;

import com.web.entity.BulletinBean;
import com.web.entity.MemberBean;

public interface ChartsService {
	List<BulletinBean> getBuelltinPerMoon(String date);

	List<MemberBean> getMemberPerMoon(String date);

}