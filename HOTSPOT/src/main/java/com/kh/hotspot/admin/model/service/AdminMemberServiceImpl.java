package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.dao.AdminMemberDao;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminMemberDao memberDao;
	
	@Override	// 총 회원수 조회
	public int selectListCount() {
		return memberDao.selectListCount(sqlSession);
	}
	
	@Override	// 모든 회원리스트 조회
	public ArrayList<Member> selectList(PageInfo pageInfo) {
		return memberDao.selectList(sqlSession, pageInfo);
	}

	@Override	// 검색결과 조회
	public ArrayList<Member> selectMemberSearchresult(String searchType, String searchText, PageInfo pageInfo) {
		if(searchType.equals("userType")) {
			// 회원유형인경우
			return memberDao.selectSearchUserType(searchText, sqlSession, pageInfo);
		}else {
			// 회원아이디인경우
			return memberDao.selectSearchUserId(searchText, sqlSession, pageInfo);
		}
	}
	
	@Override	// 선택한 회원상태('N'인경우)로 우선정렬조회
	public ArrayList<Member> selectStatusSearchList(String userStatus, PageInfo pageInfo) {
		return memberDao.selectStatusSearchList(userStatus, sqlSession, pageInfo);
	}


}
