package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.hotspot.admin.model.vo.AdminSearchCondition;
import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReviewService {
	
	// 총 후기갯수 조회
	int selectListCount();
	
	// 후기리스트 조회
	ArrayList<Review> selectList(AdminSearchCondition searchCondition, PageInfo pageInfo);
	
}
