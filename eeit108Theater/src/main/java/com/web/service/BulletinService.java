package com.web.service;

import java.util.List;

import com.web.entity.BulletinBean;

public interface BulletinService {
	List<BulletinBean> getExistenceBulletin(String targete);

	List<List<BulletinBean>> getStatsBulletin(String targete);

	List<BulletinBean> getDiscount(String date);

	void insertNewBulletin(BulletinBean bb);

	BulletinBean getBulletinBeanById(Integer no);

	int updateBulletinBeanById(Integer id, Boolean bo);

	List<BulletinBean> getSameBulletinByBortingId(Integer no);

	// 準備程式
	void switchImg(List<BulletinBean> bb);

}