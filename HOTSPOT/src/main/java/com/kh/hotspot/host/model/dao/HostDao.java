package com.kh.hotspot.host.model.dao;


import java.sql.Array;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.space.model.vo.Space;

@Repository
public class HostDao {

	public int insertHost(SqlSessionTemplate sqlSession, HostInfo hi) {
		return sqlSession.insert("hostMapper.insertHost",hi);
		
	}

	public int updateHost(SqlSessionTemplate sqlSession, HostInfo hi) {
		
		return sqlSession.update("hostMapper.updateHost",hi);
	}
	public HostInfo selectHost(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("hostMapper.selectHost", userId);
	}
	public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList", userId);
	}
}
