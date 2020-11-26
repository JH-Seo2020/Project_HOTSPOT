package com.kh.hotspot.guest.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao {
	
	public int selectReservListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.selectReservListCount");
	}

}
