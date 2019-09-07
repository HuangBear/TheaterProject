package com.web.dao;

import java.util.List;

import com.web.entity.BulletinBean;

public interface BulletinDao {

	void saveBulletin(BulletinBean bb);

	void deletecBulletin(Integer bullentin_no);

	List<BulletinBean> getAllBulletin();

	void updateBulletin(BulletinBean bb);
}
