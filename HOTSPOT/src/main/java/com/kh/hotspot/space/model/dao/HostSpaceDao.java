package com.kh.hotspot.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.space.model.vo.Space;

@Repository
public class HostSpaceDao {
	
	
	/**
	 * @author jisu
	 * @param sqlSession
	 * @param userId
	 * @return userId 기반 등록된 모든 공간정보를 받아옴
	 * 
	 */
	public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList",userId);
	}

	public int deleteSpace(SqlSessionTemplate sqlSession, String spcNo) {
		
		return sqlSession.update("hostMapper.deleteSpace", spcNo);
	}

}
