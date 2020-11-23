package com.kh.hotspot.host.model.service;

import java.util.ArrayList;

import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.space.model.vo.Space;


public interface HostService {

	//1.호스트등록 
	int insertHost(HostInfo hi);
	//2.호스트 조회
	HostInfo selectHost(String userId);
	//3.공간 정보 조회
	ArrayList<Space> selectSpaceList(String userId);
}
