package com.kh.hotspot.guest.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Reservation;

@Repository
public class MyPageDao {
	
	public int selectReservListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.selectReservListCount");
	}
	
	public ArrayList<Reservation> selectReservList(SqlSessionTemplate sqlSession, PageInfo pi, String userId){

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectReservList", userId, rowBounds);
	}

//	public int increaseCount(SqlSessionTemplate sqlSession, int reservNo) {
//		return sqlSession.update("mypageMapper.increaseCount", reservNo);
//	}
	
	
	public Reservation selectDetailReserv(SqlSessionTemplate sqlSession, int reservNo) {
		return sqlSession.selectOne("mypageMapper.selectDetailReserv", reservNo);
	}
}
