package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;

public interface AdminMemberService {
	
	// 총 회원수 조회
	int selectListCount();
	
	// 모든 회원리스트 조회
	ArrayList<Member> selectList(PageInfo pageInfo);

}
