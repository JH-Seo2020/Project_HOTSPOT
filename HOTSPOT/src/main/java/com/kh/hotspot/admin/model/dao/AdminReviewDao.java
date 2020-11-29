package com.kh.hotspot.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.model.vo.AdminSearchCondition;
import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class AdminReviewDao {
	
	// 총 후기갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}
	
	// 후기리스트 조회
	public ArrayList<Review> selectOneFilterList(AdminSearchCondition searchCondition, PageInfo pageInfo,
			                                     SqlSessionTemplate sqlSession){
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		String searchOption = searchCondition.getSearchOption();
		String searchWord = searchCondition.getSearchWord();
		String status = searchCondition.getStatus();
		
		System.out.println("-----selectOneFilterList dao-----");
		System.out.println("searchOption : " + searchOption);
		System.out.println("searchWord : " + searchWord);
		System.out.println("status : " + status);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectOneFilterList", searchCondition, rowBounds);
	}
	
	// 검색내용/필터 모두있는경우 조회
	public ArrayList<Review> selectAllFilterList(AdminSearchCondition searchCondition, PageInfo pageInfo,
												 SqlSessionTemplate sqlSession){
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		int limit = pageInfo.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		String searchOption = searchCondition.getSearchOption();
		String searchWord = searchCondition.getSearchWord();
		String status = searchCondition.getStatus();
		
		System.out.println("-----selectAllFilterList dao-----");
		System.out.println("searchOption : " + searchOption);
		System.out.println("searchWord : " + searchWord);
		System.out.println("status : " + status);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAllFilterList", searchCondition, rowBounds);
		
	}

}
