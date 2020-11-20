package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReportService {
	
	// 신고내역 조회
	// 총 신고내역 수 조회
	int selectListCount();
	
	ArrayList<Report> selectList(PageInfo pageInfo);

}
