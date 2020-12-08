package com.kh.hotspot.common.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Repository
public class CommonSpaceSearchDao {
	
	// 조회결과수
	public int selectListCount(SpaceInfo spaceInfo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spaceSearchMapper.selectListCount", spaceInfo);
	}
	
	// 검색결과리스트 조회
	public ArrayList<SpaceInfo> selectList(SpaceInfo spaceInfo, PageInfo pageInfo, SqlSessionTemplate sqlSession){
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("spaceSearchMapper.selectList", spaceInfo, rowBounds);
	}
	
	// 각 공간별 리뷰수 조회
	public int selectReviewCount(int spcNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spaceSearchMapper.selectReviewCount", spcNo);
	}
	
	// 각 공간별 위시수 조회
	public int selectWishCount(int spcNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spaceSearchMapper.selectWishCount", spcNo);
	}

}
