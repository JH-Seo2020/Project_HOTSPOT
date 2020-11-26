package com.kh.hotspot.admin.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hotspot.admin.reservation.model.vo.Reservation;
import com.kh.hotspot.admin.reservation.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReservationService {
	
	int selectListCount(String head);
	ArrayList<Reservation> selectList(PageInfo pi, String head);
	
	int searchListCount(Map map);
	ArrayList<Reservation> searchList(PageInfo pi, Map map);
	
	int deleteReservation(int rno);
	
	Reservation detailReservation(int rno);
		
}
