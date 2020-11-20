package com.kh.hotspot.guest.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Repository
public class SpaceDao {

	public ArrayList<SpaceInfo> selectTodaySpace(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectTodaySpace");
	}

	public ArrayList<SpaceInfo> selectUserReview(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectUserReview");
	}

}
