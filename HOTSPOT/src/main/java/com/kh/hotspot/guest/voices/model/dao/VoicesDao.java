package com.kh.hotspot.guest.voices.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;

@Repository
public class VoicesDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customerservicemapper.selectListCount");
	}

	public ArrayList<VoicesNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectList", null, rowBounds);
	}

}
