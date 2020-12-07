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
	public int selectListCount(Member member, SqlSessionTemplate sqlSession) {
		
		System.out.println("userType : " + member.getUserType());
		System.out.println("userId : " + member.getUserId());
		
		return sqlSession.selectOne("memberMapper.selectListCount", member);
	}
	
	// 모든 회원리스트 조회
	public ArrayList<Member> selectList(Member member, PageInfo pageInfo, SqlSessionTemplate sqlSession) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", member, rowBounds);
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
	
	// 회원유형 변경
	public int updateUserType(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updateUserType", userId);
	}
	
	// 호스트정보 상태변경(수락)
	public int updateHostStatusY(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updateHostStatusY", userId);
	}
	
	// 호스트정보 상태변경(거절)
	public int updateHostStatusN(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updateHostStatusN", userId);
	}
	
	// 검색결과수 조회
	public int selectSearchCount(Member member, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectSearchCount", member);
	}
	
	// 검색결과리스트 조회
	public ArrayList<Member> selectSearch(Member member, PageInfo pageInfo, SqlSessionTemplate sqlSession){
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearch", member, rowBounds);
	}
	
}
