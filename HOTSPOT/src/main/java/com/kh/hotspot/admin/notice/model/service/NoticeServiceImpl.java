package com.kh.hotspot.admin.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.notice.model.dao.NoticeDao;
import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

	
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession) ;
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public int increaseCount(int nno) {
		return nDao.increaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		return nDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteListNotice(String[] nno) {
		return nDao.deleteListNotice(sqlSession, nno);
	}

	@Override
	public int searchListCount(SearchCondition sc) {
		return nDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Notice> searchList(PageInfo pi, SearchCondition sc) {
		return nDao.searchList(sqlSession, pi, sc);
	}

	@Override
	public int deleteNotice(int nno) {
		
		return nDao.deleteNotice(sqlSession, nno);
	}

	@Override
	public int count() {
		return nDao.count(sqlSession);
	}

}
