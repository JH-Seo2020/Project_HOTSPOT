package com.kh.hotspot.admin.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.faq.model.dao.FaqDao;
import com.kh.hotspot.admin.faq.model.vo.Faq;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao fDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return fDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectList(PageInfo pi) {
		return fDao.selectList(sqlSession, pi);
	}

	@Override
	public int searchListCount(SearchCondition sc) {
		return fDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Faq> searchList(SearchCondition sc, PageInfo pi) {
		return fDao.searchList(sqlSession, pi, sc);
	}

	@Override
	public int insertFaq(Faq f) {
		return fDao.insertFaq(sqlSession, f);
	}

	@Override
	public Faq selectFaq(int fno) {
		return fDao.selectFaq(sqlSession, fno);
	}

	@Override
	public int updateFaq(Faq f) {
		return fDao.updateFaq(sqlSession, f);
	}

	@Override
	public int deleteFaq(String[] fno) {
		return fDao.deleteFaq(sqlSession, fno);
	}

}
