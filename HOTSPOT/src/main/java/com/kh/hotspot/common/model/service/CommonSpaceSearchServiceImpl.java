package com.kh.hotspot.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.dao.CommonSpaceSearchDao;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Service
public class CommonSpaceSearchServiceImpl implements CommonSpaceSearchService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommonSpaceSearchDao spaceSearchDao;
	
	
	@Override
	public ArrayList<SpaceInfo> selectList(String searchWord) {
		return spaceSearchDao.selectList(searchWord, sqlSession);
	}
	

}
