package com.kh.hotspot.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.dao.AdminReportDao;


@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminReportDao adminReportDao;
	

}
