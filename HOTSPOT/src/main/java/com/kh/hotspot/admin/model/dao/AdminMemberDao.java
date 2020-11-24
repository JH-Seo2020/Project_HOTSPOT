package com.kh.hotspot.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;

@Repository
public class AdminMemberDao {
	
	// 총 회원수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	// 모든 회원리스트 조회
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}
	
	// 회원유형 검색결과조회
	public ArrayList<Member> selectSearchUserType(String searchText, SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchUserType", searchText, rowBounds);
	}
	
	// 회원아이디 검색결과조회
	public ArrayList<Member> selectSearchUserId(String searchText, SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchUserId", searchText, rowBounds);
	}
	
	// 선택한 회원상태('N'인경우)로 우선정렬조회
	public ArrayList<Member> selectStatusSearchList(String userStatus, SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("memberMapper.selectStatusSearchList", userStatus, rowBounds);
	}

}
