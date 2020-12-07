package com.kh.hotspot.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class AdminReviewDao {
	
	// 총 후기갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}
	
	// 후기리스트 조회
	public ArrayList<Review> selectList(PageInfo pageInfo, SqlSessionTemplate sqlSession){
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", null, rowBounds);
	}
	
	// 후기상세조회
	public Review selectDetail(int reviewNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectDetail", reviewNo);
	}
	
	// 후기상태 변경
	public int updateStatus(int reviewNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("reviewMapper.updateStatus", reviewNo);
	}

}
