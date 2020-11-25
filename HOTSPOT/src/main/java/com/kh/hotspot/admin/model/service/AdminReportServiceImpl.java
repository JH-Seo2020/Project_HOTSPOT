package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.dao.AdminReportDao;
import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;


@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminReportDao reportDao;
	
	@Override	// 총 신고갯수 조회
	public int selectListCount() {
		return reportDao.selectListCount(sqlSession);
	}
	
	@Override	// 신고리스트 조회
	public ArrayList<Report> selectList(String reportStatus, PageInfo pageInfo) {
		return reportDao.selectList(reportStatus, sqlSession, pageInfo);
	}

	@Override	// 신고내역 상세조회
	public Report selectReportDetail(int reportNo) {
		return reportDao.selectReportDetail(reportNo, sqlSession);
	}
	
	@Override	// 신고상태 변경 요청
	public int updateReportStatus(Report report) {
		return reportDao.updateReportStatus(report, sqlSession);
	}
	

}
