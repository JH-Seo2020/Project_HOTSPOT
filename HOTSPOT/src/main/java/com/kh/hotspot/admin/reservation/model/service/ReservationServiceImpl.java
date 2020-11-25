package com.kh.hotspot.admin.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.reservation.model.dao.ReservationDao;
import com.kh.hotspot.admin.reservation.model.vo.Reservation;
import com.kh.hotspot.admin.reservation.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao rDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int deleteReservation(String[] rno) {
		return 0;
	}

	@Override
	public Reservation detailReservation(int rno) {
		return null;
	}

	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Reservation> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}

	@Override
	public int searchListCount(SearchCondition sc) {
		return rDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Reservation> searchList(PageInfo pi, SearchCondition sc) {
		return rDao.searchList(sqlSession, sc, pi);
	}

}
