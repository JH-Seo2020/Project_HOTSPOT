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

}
