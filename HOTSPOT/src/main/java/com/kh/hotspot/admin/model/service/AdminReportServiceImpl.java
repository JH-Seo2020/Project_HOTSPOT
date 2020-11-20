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
	
	@Override
	public int selectListCount() {
		return reportDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Report> selectList(PageInfo pageInfo) {
		return reportDao.selectList(sqlSession, pageInfo);
	}
	

}
