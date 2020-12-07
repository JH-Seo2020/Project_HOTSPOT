package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReviewService {
	
	// 총 후기갯수 조회
	int selectListCount();
	
	// 후기리스트 조회
	ArrayList<Review> selectList(PageInfo pageInfo);
	
	// 후기상세조회
	Review selectDetail(int reviewNo);
	
	// 후기상태 변경
	int updateStatus(int reviewNo);
	
}
