package com.web.service;

import java.util.List;

import com.web.entity.BulletinBean;
import com.web.entity.EmployeeBean;
import com.web.entity.MemberBean;
import com.web.entity.MovieBean;

public interface ChartsService {
	List<BulletinBean> getBuelltinPerMoon(String date);

	List<MemberBean> getMemberPerMoon(String date);

	List<EmployeeBean> getEmployeePerMoon(String date);

	List<MovieBean> getMoviePerMoon(String date);

	List<Double> getOrderPerMoon(String date);

	public Integer getAllFood();

	public Integer getAllDrink();

	public Integer getAllTicket();
}