package com.kh.hotspot.guest.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.myPage.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String userNickname) {

		return sqlSession.selectOne("memberMapper.nickCheck", userNickname);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int updateCheckNickname(SqlSessionTemplate sqlSession, String userNickname) {
		return sqlSession.selectOne("memberMapper.updateCheckNickname", userNickname);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}

}
