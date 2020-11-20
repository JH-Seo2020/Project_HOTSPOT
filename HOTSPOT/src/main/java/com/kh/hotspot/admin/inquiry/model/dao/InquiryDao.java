package com.kh.hotspot.admin.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class InquiryDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String head) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount", head);
	}
	
	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String head){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", head, rowbounds);
	}
	
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int ino) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", ino);
	}
	
	public int deleteListInquiry(SqlSessionTemplate sqlSession, String[] ino) {
		
		return sqlSession.update("inquiryMapper.deleteListInquiry", ino);
	}
	
	public int deleteInquiry(SqlSessionTemplate sqlSession, int ino) {
		return sqlSession.update("inquiryMapper.deleteInquiry", ino);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.update("inquiryMapper.insertReply", i);
	}
	
	
	
}
