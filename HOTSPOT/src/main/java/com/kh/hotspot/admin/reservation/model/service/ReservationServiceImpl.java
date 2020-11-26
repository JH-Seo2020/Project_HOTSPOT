package com.kh.hotspot.admin.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

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
	public int selectListCount(String head) {
		return rDao.selectListCount(sqlSession, head);
	}

	@Override
	public ArrayList<Reservation> selectList(PageInfo pi, String head) {
		return rDao.selectList(sqlSession, pi, head);
	}

	@Override
	public int searchListCount(Map map) {
		return rDao.searchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Reservation> searchList(PageInfo pi, Map map) {
		return rDao.searchList(sqlSession, map, pi);
	}

}
