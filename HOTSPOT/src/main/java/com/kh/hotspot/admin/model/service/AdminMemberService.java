package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;

public interface AdminMemberService {
	
	// 총 회원수 조회
	int selectListCount();
	
	// 모든 회원리스트 조회
	ArrayList<Member> selectList(PageInfo pageInfo);
	
	// 검색결과 조회
	ArrayList<Member> selectMemberSearchresult(String searchType, String searchText, PageInfo pageInfo);
	
	
	// 선택한 회원상태('N'인경우)로 우선정렬조회
	ArrayList<Member> selectStatusSearchList(String userStatus, PageInfo pageInfo);

}
