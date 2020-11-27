package com.kh.hotspot.admin.space.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.space.model.dao.AdminSpaceDao;
import com.kh.hotspot.admin.space.model.vo.SearchCondition;
import com.kh.hotspot.admin.space.model.vo.Space;
import com.kh.hotspot.admin.space.model.vo.SpaceImg;
import com.kh.hotspot.common.model.vo.PageInfo;

@Service
public class AdminSpaceServiceImpl implements AdminSpaceService {
	
	@Autowired
	private AdminSpaceDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return sDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Space> selectList(PageInfo pi) {
		return sDao.selectList(sqlSession, pi);
	}

	@Override
	public int searchListCount(SearchCondition sc) {
		return sDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Space> searchList(PageInfo pi, SearchCondition sc) {
		return sDao.searchList(sqlSession, pi, sc);
	}

	@Override
	public int deleteSpace(String[] sno) {
		return sDao.deleteSpace(sqlSession, sno);
	}

	@Override
	public Space detailSpace(int sno) {
		return null;
	}

	@Override
	public ArrayList<SpaceImg> selectImgList(int sno) {
		return null;
	}

}
