package com.kh.hotspot.guest.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Repository
public class SpaceDao {

	public ArrayList<SpaceInfo> selectTodaySpace(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectTodaySpace");
	}

	public ArrayList<SpaceInfo> selectUserReview(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectUserReview");
	}

	public Member selectHostInfoForHomep(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("guestspaceMapper.selectHostInfoForHomep", userId);
	}

	public ArrayList<SpaceInfo> selectHostSpacesForHomep(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectHostSpacesForHomep",userId);
	}


}
