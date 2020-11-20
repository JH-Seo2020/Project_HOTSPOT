package com.kh.hotspot.guest.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.guest.myPage.model.vo.Member;

@Repository
public class myPageDao {

	public Member loginMember(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("memberMapper.loginMember", userId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String userNickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.nickCheck", userNickname);
	}

}
