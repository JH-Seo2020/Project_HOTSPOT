package com.kh.hotspot.space.model.service;

import java.util.ArrayList;


import com.kh.hotspot.space.model.vo.Space;

public interface HostSpaceService {

	//1. 공간등록
	ArrayList<Space> selectSpaceList(String userId);

	
	
}
