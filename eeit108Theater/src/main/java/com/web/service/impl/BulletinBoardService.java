package com.web.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;


@Service
public class BulletinBoardService {
	@Autowired
	BulletinDao dao;

	@Transactional
	public List<BulletinBean> getAllBulletin() {
		return dao.getAllBulletin();
	}
	
	
	
	
	
	
	
	
}
