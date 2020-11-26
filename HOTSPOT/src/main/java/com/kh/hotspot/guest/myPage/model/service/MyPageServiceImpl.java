package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.dao.MyPageDao;
import com.kh.hotspot.guest.space.model.vo.Reservation;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDao mpDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int selectReservListCount() {
		return mpDao.selectReservListCount(sqlSession);
	}
	

	@Override
	public ArrayList<Reservation> selectReservList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation selectReserv(int reservNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReserv(int reservNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reportHostandSpace(String userIdHost, int spcNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

}
