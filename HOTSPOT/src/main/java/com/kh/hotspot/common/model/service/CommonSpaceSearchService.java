package com.kh.hotspot.common.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

public interface CommonSpaceSearchService {
	
	// 조회결과수
	int selectListCount(SpaceInfo spaceInfo);
	
	// 검색결과리스트 조회
	ArrayList<SpaceInfo> selectList(SpaceInfo spaceInfo, PageInfo pageInfo);
	
	// 각 공간별 리뷰수 조회
	int selectReviewCount(int spcNo);
	
	// 각 공간별 위시수 조회
	int selectWishCount(int spcNo);

}
