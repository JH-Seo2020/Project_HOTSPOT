package com.kh.hotspot.admin.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.inquiry.model.dao.InquiryDao;
import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryDao iDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return iDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi, String head) {
		return iDao.selectList(sqlSession, pi, head);
	}

	@Override
	public Inquiry selectInquiry(int ino) {
		return null;
	}

	@Override
	public int insertReply(int ino) {
		return 0;
	}

	@Override
	public int deleteListInquiry(String[] ino) {
		return 0;
	}

	@Override
	public int deleteInquiry(int ino) {
		return 0;
	}

	@Override
	public int searchListCount(SearchCondition sc) {
		return 0;
	}

	@Override
	public ArrayList<Inquiry> searchList(SearchCondition sc, PageInfo pi) {
		return null;
	}

}
