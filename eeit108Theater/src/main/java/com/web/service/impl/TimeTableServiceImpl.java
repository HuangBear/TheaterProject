package com.web.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MovieDao;
import com.web.dao.TimeTableDao;
import com.web.entity.TimeTableBean;
import com.web.service.TimeTableService;
@Transactional
@Service
public class TimeTableServiceImpl implements TimeTableService{
	
	@Autowired
	TimeTableDao dao;
	
	@Override
	public int saveTimeTable(TimeTableBean timeTable) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTimeTableByNo(Integer timeTableNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTimeTable(TimeTableBean timeTable) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int discontinueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int continueAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TimeTableBean getTimeTableByNo(Integer timeTableNo) {
		return null;
		
	}

	@Override
	public List<TimeTableBean> getTimeTablesByMovie(String movieName) {
		return dao.getTimeTablesByMovie(movieName);
	}

	@Override
	public List<TimeTableBean> getTimeTablesByMovieVersion(String movieName, String version) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TimeTableBean> getAllTimeTables() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TimeTableBean> getAllAvailable() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TimeTableBean> getStartTimeByMovie(String movieName) {
		return dao.getStartTimeByMovie(movieName);
	}
	
}
