package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminReportService {
	
	// 총 신고갯수 조회
	int selectListCount();
	
	// 신고리스트 조회
	ArrayList<Report> selectList(String reportStatus, PageInfo pageInfo);
	
	// 신고내역 상세조회
	Report selectReportDetail(int reportNo);
	
	// 신고상태 변경 요청
	int updateReportStatus(Report report);

}
