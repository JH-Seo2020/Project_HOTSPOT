package com.kh.hotspot.guest.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;

@Repository
public class MyPageDao {
	
	
	/**
	 * 나의 예약리스트
	 * 
	 */
	public int selectReservListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.selectReservListCount", userId);
	}
	
	public ArrayList<Reservation> selectReservList(SqlSessionTemplate sqlSession, PageInfo pi, String userId){

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		//System.out.println(userId);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectReservList", userId, rowBounds);
	}
	
	
	public ArrayList<Reservation> alignReservList(SqlSessionTemplate sqlSession, String align, String userId){
		
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("align", align);
		hmap.put("userId", userId);
		return (ArrayList)sqlSession.selectList("mypageMapper.alignReservList", hmap);
	}

	
	public Reservation selectDetailReserv(SqlSessionTemplate sqlSession, int reservNo, String userId) {
		
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("reservNo", reservNo);
		hmap.put("userId", userId);
		return sqlSession.selectOne("mypageMapper.selectDetailReserv", hmap);
	}
	
	
	public int deleteReserv(SqlSessionTemplate sqlSession, int reservNo) {
		return sqlSession.update("mypageMapper.deleteReserv", reservNo);
	}
	
	
	public int reportReserv(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("mypageMapper.reportReserv", rp);
	}
	
	
	
	
	/**
	 * 이용후기
	 * 
	 */
	public int selectMyReviewListCount(SqlSessionTemplate sqlSession, String userId) {
		
		
		
		return sqlSession.selectOne("mypageMapper.selectMyReviewListCount", userId);
	}
	
	public ArrayList<Review> selectMyReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String userId){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
//		HashMap<Object, Object> hmap = new HashMap<>();
//		hmap.put("reservNo", reservNo);
//		hmap.put("userId", userId);
//		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectMyReviewList", userId, rowBounds);
		
	}
	
}






















