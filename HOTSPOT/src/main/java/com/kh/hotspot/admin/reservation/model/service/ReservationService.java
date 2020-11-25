package com.kh.hotspot.admin.reservation.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.reservation.model.vo.Reservation;
import com.kh.hotspot.admin.reservation.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface ReservationService {
	
	int selectListCount();
	ArrayList<Reservation> selectList(PageInfo pi);
	
	int searchListCount(SearchCondition sc);
	ArrayList<Reservation> searchList(PageInfo pi, SearchCondition sc);
	
	int deleteReservation(String[] rno);
	
	Reservation detailReservation(int rno);
		
}
