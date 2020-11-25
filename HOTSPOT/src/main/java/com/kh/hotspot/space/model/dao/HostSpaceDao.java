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
	 * @return
	 */
	public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList",userId);
	}

}
