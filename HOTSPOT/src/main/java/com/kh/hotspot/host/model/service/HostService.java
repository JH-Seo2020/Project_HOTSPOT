package com.kh.hotspot.host.model.service;

import com.kh.hotspot.host.model.vo.HostInfo;


public interface HostService {

	//1.호스트등록 
	int insertHost(HostInfo hi);
	//2.호스트 조회
	HostInfo selectHost(String userId);
	//3.호스트정보 수정 
	
	//4.1:1문의 내역 조회 
	
	//5.1:1문의 작성
	
	//6.공지사항조회
}
