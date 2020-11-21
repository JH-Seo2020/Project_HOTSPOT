package com.kh.hotspot.guest.voices.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.dao.VoicesDao;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;

@Service
public class VoicesServiceImpl implements VoicesService{
	
	@Autowired
	private VoicesDao vDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		
		return vDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<VoicesNotice> selectList(PageInfo pi) {
		
		return vDao.selectList(sqlSession,pi);
	}

	@Override
	public int increaseCount(int nno) {
		
		return vDao.increaseCount(sqlSession,nno);
	}

	@Override
	public VoicesNotice selectNotices(int nno) {
		
		return vDao.selectNotices(sqlSession,nno);
	}

	@Override
	public ArrayList<VoicesNotice> selectSearchNotice(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
