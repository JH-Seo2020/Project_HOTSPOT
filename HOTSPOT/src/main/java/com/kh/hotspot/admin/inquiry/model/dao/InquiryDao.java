package com.kh.hotspot.admin.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class InquiryDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount");
	}
	
	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String head){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", head, rowbounds);
	}
}
