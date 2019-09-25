package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		return dao.getTimeTableByNo(timeTableNo);
		
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

	@Override
	public List<TimeTableBean> getTheaterByMovieName(String movieName) {
		return dao.getTheaterByMovieName(movieName);
	}

	@Override
	public List<TimeTableBean> getStartTimeByMovieAndTheater(String movieName, String theater, String version) {
		return null;
	}

	@Override
	public List<TimeTableBean> getTimeTableBeanByMovieName(String movieName) {
		return dao.getTimeTableBeanByMovieName(movieName);
	}
	
	@Override
	public List<List<TimeTableBean>> getMovieTime(String movieName){
		List<List<TimeTableBean>> list = new ArrayList<>();
		for(String theater : dao.getTheatersByMovieName(movieName)) {
			list.add(dao.getMovieTimeByTheater(movieName, theater));
		}
		return list;
	}
	@Override
	public List<TimeTableBean> getStartTimeByDateAndVersionAndMovie(String startDate, String version, String movieName) {
		return dao.getStartTimeByDateAndVersionAndMovie(startDate, version, movieName);
	}

	@Override
	public List<String> getTheatersByMovieName(String movieName) {
		return dao.getTheatersByMovieName(movieName);
	}	 
	
}
