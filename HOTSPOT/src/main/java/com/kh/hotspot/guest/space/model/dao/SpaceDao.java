package com.kh.hotspot.guest.space.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.host.model.vo.HostInfo;

@Repository
public class SpaceDao {

	public ArrayList<SpaceInfo> selectTodaySpace(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectTodaySpace");
	}

	public ArrayList<SpaceInfo> selectUserReview(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectUserReview");
	}

	//호스트홈피관련
	public Member selectHostInfoForHomep(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("guestspaceMapper.selectHostInfoForHomep", userId);
	}

	public ArrayList<SpaceInfo> selectHostSpacesForHomep(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectHostSpacesForHomep",userId);
	}

	public int selectCountReviewForHomep(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("guestspaceMapper.selectCountReviewForHomep", userId);
	}

	public ArrayList<Review> selectReviewsForHomep(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectReviewsForHomep", userId, rowBounds);
	}

	public HostInfo hostInfo(SqlSessionTemplate sqlSession, Reservation reserv) {
	
		return sqlSession.selectOne("guestReservtaionMapper.hostInfo", reserv);
	}

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		
		return sqlSession.insert("guestReservtaionMapper.insertReservation", r);
	}

	public int updatePaymentInfo(SqlSessionTemplate sqlSession, Reservation reservUp) {
		
		return sqlSession.update("guestReservtaionMapper.updatePaymentInfo", reservUp);
	}
	
	public int selectRightBeforeReserv(SqlSessionTemplate sqlSession, Reservation r) {
		
		return sqlSession.selectOne("guestReservtaionMapper.selectRightBeforeReserv", r);
	}

	public int deleteReserv(SqlSessionTemplate sqlSession, int reservNo) {
		
		return sqlSession.delete("guestReservtaionMapper.deleteReserv", reservNo);
	}


}
