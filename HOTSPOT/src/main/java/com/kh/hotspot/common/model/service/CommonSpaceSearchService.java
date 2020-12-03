package com.kh.hotspot.common.model.service;

import java.util.ArrayList;

import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

public interface CommonSpaceSearchService {
	
	ArrayList<SpaceInfo> selectList(String searchWord);

}
