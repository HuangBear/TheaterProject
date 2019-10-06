package com.web.dao;

import com.web.entity.TheaterBean;

public interface TheaterDao {

	int save(TheaterBean tb);

	int update(TheaterBean tb);

	int delete(TheaterBean tb);

	TheaterBean getTheater(String theater);

	TheaterBean getTheaterByNo(Integer no);

}