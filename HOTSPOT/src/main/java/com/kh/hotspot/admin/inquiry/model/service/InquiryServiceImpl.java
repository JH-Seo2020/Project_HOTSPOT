package com.kh.hotspot.admin.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.inquiry.model.dao.InquiryDao;
import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryDao iDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(String head) {
		return iDao.selectListCount(sqlSession, head);
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi, String head) {
		return iDao.selectList(sqlSession, pi, head);
	}

	@Override
	public Inquiry selectInquiry(int ino) {
		return iDao.selectInquiry(sqlSession, ino);
	}

	@Override
	public int deleteListInquiry(String[] ino) {
		return iDao.deleteListInquiry(sqlSession, ino);
	}

	@Override
	public int deleteInquiry(int ino) {
		return iDao.deleteInquiry(sqlSession, ino);
	}


	@Override
	public int insertReply(Inquiry i) {
		
		return iDao.insertReply(sqlSession, i);
	}

}
