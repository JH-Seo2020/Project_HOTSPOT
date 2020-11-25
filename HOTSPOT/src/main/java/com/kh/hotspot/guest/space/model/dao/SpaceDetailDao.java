package com.kh.hotspot.guest.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;

@Repository
public class SpaceDetailDao {
	

	public SpaceInfo selectSpaceDetail(SqlSessionTemplate sqlSession, int spcNo) {
		
		return sqlSession.selectOne("guestspaceMapper.selectSpaceDetail",spcNo);
	}

	public ArrayList<SpaceImages> selectSpaceImages(SqlSessionTemplate sqlSession, int spcNo) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectSpaceImages",spcNo);
	}

	public ArrayList<SpaceNotes> selectSpaceNotes(SqlSessionTemplate sqlSession, int spcNo) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectSpaceNotes",spcNo);
	}

}
