package com.web.service.impl;

import java.util.Date;
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
	public List<BulletinBean> getAllBulletin()
	{
		List<BulletinBean> list = dao.getAllBulletin();
		for (BulletinBean bb : list)
		{
			Integer discount = bb.getDiscount();
			switch (discount)
			{
			case 1:
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-low-price-50.png");
				break;
			case 2:
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-pricing-50.png");
				break;
			default:
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-delete-50.png");
				break;
			}
		}
		return list;
	}

	@Transactional
	public void insertNewBulletin(BulletinBean bb)
	{
		bb.setAvailable(true);
		bb.setPostTime(new Date());
		bb.setStatus(false);
		dao.insertBulletin(bb);
	}
}