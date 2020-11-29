package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.host.model.vo.HostInfo;

public interface AdminMemberService {
	
	// 총 회원수 조회
	int selectListCount();
	
	// 모든 회원리스트 조회
	ArrayList<Member> selectList(PageInfo pageInfo);
	
	// 호스트정보 조회
	HostInfo selectHostInfo(String userId);
	
	// 회원정보 조회
	Member selectUserInfo(String userId);
	
	// 회원상태, 메모 저장
	int updateGuestInfo(Member member);

}
