package com.web.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BullentinDao;
import com.web.entity.BullentinBean;

@Service
public class BulletinBoardService {
	@Autowired
	BullentinDao dao;

	@Transactional
	public List<BullentinBean> getAllBullentin() {
		return dao.getAllBullentin();
	}
	
	
	
	
	
	
	
	
}
