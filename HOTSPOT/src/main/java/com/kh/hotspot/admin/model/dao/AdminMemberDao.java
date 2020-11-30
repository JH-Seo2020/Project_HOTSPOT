package com.kh.hotspot.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.host.model.vo.HostInfo;

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
	
	// 회원상세정보 조회
	public Member selectDetail(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectDetail", userId);
	}
	
	// 호스트정보 조회
	public HostInfo selectHostInfo(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectHostInfo", userId);
	}
	
	// 회원상태, 메모 저장
	public int updateUserInfo(Member member, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updateUserInfo", member);
	}
	
}
