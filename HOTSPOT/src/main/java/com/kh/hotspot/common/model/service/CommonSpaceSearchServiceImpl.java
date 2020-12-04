package com.kh.hotspot.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.dao.CommonSpaceSearchDao;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Service
public class CommonSpaceSearchServiceImpl implements CommonSpaceSearchService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommonSpaceSearchDao spaceSearchDao;
	
	@Override	// 조회결과수
	public int selectListCount(SpaceInfo spaceInfo) {
		return spaceSearchDao.selectListCount(spaceInfo, sqlSession);
	}
	
	@Override	// 검색결과리스트 조회
	public ArrayList<SpaceInfo> selectList(SpaceInfo spaceInfo, PageInfo pageInfo) {
		return spaceSearchDao.selectList(spaceInfo, pageInfo, sqlSession);
	}	
	
	@Override	// 각 공간별 리뷰수 조회
	public int selectReviewCount(int spcNo) {
		return spaceSearchDao.selectReviewCount(spcNo, sqlSession);
	}	
	
	@Override	// 각 공간별 위시수 조회
	public int selectWishCount(int spcNo) {
		return spaceSearchDao.selectWishCount(spcNo, sqlSession);
	}

}
