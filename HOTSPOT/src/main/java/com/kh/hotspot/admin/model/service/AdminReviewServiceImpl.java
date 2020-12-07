package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotspot.admin.model.dao.AdminReviewDao;
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
	public ArrayList<Review> selectList(PageInfo pageInfo) {
		return reviewDao.selectList(pageInfo, sqlSession);
	}

	@Override	// 후기상세조회
	public Review selectDetail(int reviewNo) {
		return reviewDao.selectDetail(reviewNo, sqlSession);
	}
	
	@Override	// 후기상태 변경
	public int updateStatus(int reviewNo) {
		return reviewDao.updateStatus(reviewNo, sqlSession);
	}
}
