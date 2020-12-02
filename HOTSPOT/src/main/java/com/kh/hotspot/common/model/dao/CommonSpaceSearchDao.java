package com.kh.hotspot.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Repository
public class CommonSpaceSearchDao {
	
	public ArrayList<SpaceInfo> selectList(String searchWord, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("spaceSearchMapper.selectList", searchWord);
	}

}
