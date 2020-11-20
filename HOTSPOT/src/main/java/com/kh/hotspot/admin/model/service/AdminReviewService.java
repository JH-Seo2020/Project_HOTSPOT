package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReviewService {
	
	// 총 후기갯수 조회
	int selectListCount();
	
	// 총 후기내역 조회
	ArrayList<Review> selectList(PageInfo pageInfo);
	
	

}
