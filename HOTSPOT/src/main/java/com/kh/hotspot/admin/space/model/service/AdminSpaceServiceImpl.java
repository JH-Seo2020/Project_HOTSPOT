package com.kh.hotspot.admin.space.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.space.model.dao.AdminSpaceDao;
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
	public int selectListCount(String arr) {
		return 0;
	}

	@Override
	public ArrayList<Space> selectList(PageInfo pi, String arr) {
		return null;
	}

	@Override
	public int searchListCount(Map map) {
		return 0;
	}

	@Override
	public ArrayList<Space> searchList(PageInfo pi, Map map) {
		return null;
	}

	@Override
	public int deleteSpace(String[] sno) {
		return 0;
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
