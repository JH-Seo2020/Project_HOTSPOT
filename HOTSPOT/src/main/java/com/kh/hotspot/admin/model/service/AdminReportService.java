package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReportService {
	
	// 총 신고갯수 조회
	int selectListCount();
	
	// 총 신고내역 조회
	ArrayList<Report> selectList(String reportStatus, PageInfo pageInfo);

}
