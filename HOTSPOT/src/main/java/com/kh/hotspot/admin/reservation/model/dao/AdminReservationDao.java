package com.kh.hotspot.admin.reservation.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.reservation.model.vo.Reservation;
import com.kh.hotspot.admin.reservation.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class AdminReservationDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String head) {
		
		return sqlSession.selectOne("reservationMapper.selectListCount", head);
	}
	public ArrayList<Reservation> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String head){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectList", head, rowbounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, Map map) {
		
		return sqlSession.selectOne("reservationMapper.searchListCount", map);
	}
	
	public ArrayList<Reservation> searchList(SqlSessionTemplate sqlSession, Map map, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("reservationMapper.searchList", map, rowbounds);
	}
	
	public Reservation detailReservation(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("reservationMapper.detailReservation", rno);
	}
	
	public int deleteReservation(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("reservationMapper.deleteReservation", rno);
	}
}
