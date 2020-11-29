package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotspot.admin.model.dao.AdminReviewDao;
import com.kh.hotspot.admin.model.vo.AdminSearchCondition;
import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminReviewDao reviewDao;
	
	@Override	// 총 후기갯수 조회
	public int selectListCount() {
		return reviewDao.selectListCount(sqlSession);
	}

	@Override	// 후기리스트 조회
	public ArrayList<Review> selectList(AdminSearchCondition searchCondition, PageInfo pageInfo) {
		
		String searchOption = searchCondition.getSearchOption();
		String searchWord = searchCondition.getSearchWord();
		String status = searchCondition.getStatus();
		
		System.out.println("-----서비스-----");
		System.out.println("searchOption : " + searchOption);
		System.out.println("searchWord : " + searchWord);
		System.out.println("status : " + status);
		
		ArrayList<Review> list = null;
		if(searchOption == null || "null".equals(searchOption)) {
			list = reviewDao.selectOneFilterList(searchCondition, pageInfo, sqlSession);
		}else {
			list = reviewDao.selectAllFilterList(searchCondition, pageInfo, sqlSession);
		}

		return list;
	}
}
