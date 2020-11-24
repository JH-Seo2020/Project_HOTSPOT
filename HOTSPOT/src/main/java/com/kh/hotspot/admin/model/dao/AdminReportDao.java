package com.kh.hotspot.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class AdminReportDao {
	
	// 총 신고갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}
	
	// 총 신고내역 조회
	public ArrayList<Report> selectList(String reportStatus, SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		System.out.println("reportStatus : " + reportStatus);
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectList", reportStatus, rowBounds);
		
	}

}
