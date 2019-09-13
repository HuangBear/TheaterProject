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
	public List<BulletinBean> getAllBulletin()
	{
		List<BulletinBean> list = dao.getAllBulletin();
//		System.out.println(list.get(0).getImgUrlString());
		for (BulletinBean bb : list)
		{

			Boolean dp = bb.getDiscountPrice();
			Boolean dt = bb.getDiscountTick();
			if (dp == true && dt == false)
			{
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-low-price-50.png");
			} else if (dp == false && dt == true)
			{
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-pricing-50.png");
			} else 
			{
				bb.setImgUrlString("/images/icons/backstage/bulletin/icons8-delete-50.png");
			}
		}
		return list;
	}

}
