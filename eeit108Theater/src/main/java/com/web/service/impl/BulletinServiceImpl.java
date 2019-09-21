package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.BulletinDao;
import com.web.entity.BulletinBean;

@Service
public class BulletinServiceImpl {
	@Autowired
	BulletinDao dao;

	@Transactional
	public List <List<BulletinBean>> getStatsBulletin() {
		
		List<BulletinBean> getExistenceBulletin = dao.getExistenceBulletin();
		switchImg(getExistenceBulletin);

		List<BulletinBean> getExpiredBulletin = dao.getExpiredBulletin();
		switchImg(getExpiredBulletin);

		List<BulletinBean> getDeadBulletin = dao.getDeadBulletin();
		switchImg(getDeadBulletin);

		List <List<BulletinBean>> statusBulletin = new ArrayList<>();
		 statusBulletin.add(getExistenceBulletin);
		 statusBulletin.add(getExpiredBulletin);
		 statusBulletin.add(getDeadBulletin);
		 
		return statusBulletin;
	}

	
	@Transactional
	public void insertNewBulletin(BulletinBean bb) {
		dao.insertBulletin(bb);
	}

	@Transactional
	public BulletinBean getBulletinBeanById(Integer no) {
		BulletinBean bb = dao.getBulletinById(no);
		return bb;
	}

	@Transactional
	public int updateBulletinBeanById(Integer id, Boolean bo) {
		int deleteReturn = dao.updateBulletindByBortingId(id, bo);
		return deleteReturn;
	}
	
	@Transactional
	public List<BulletinBean> getSameBulletinByBortingId(Integer no) {
		 List<BulletinBean> sameBulletinBeans = dao.getSameBulletinByBortingId(no);
		return sameBulletinBeans;
	}


// 準備程式
	public void switchImg(List<BulletinBean> bb) {
		for (BulletinBean eb : bb) {
			Integer discount = eb.getDiscount();
			switch (discount)
			{
			case 1:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountP.png");
				eb.setPay("滿");
				eb.setFree("送");
				break;
			case 2:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountT.png");
				eb.setPay("買");
				eb.setFree("送");
				break;
			default:
				eb.setImgUrlString("/images/icons/backstage/bulletin/discountN.png");
				eb.setPay(null);
				eb.setFree(null);
				break;
			}
		}
	}
	
	
	
	
}