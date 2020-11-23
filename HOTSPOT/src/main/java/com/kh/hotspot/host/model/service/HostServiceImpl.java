package com.kh.hotspot.host.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.host.model.dao.HostDao;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.space.model.vo.Space;


@Service
public class HostServiceImpl implements HostService {

	@Autowired 
	private HostDao hDao;
	@Autowired // root-context에 등록되어있음 
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHost(HostInfo hi) {
		int result = hDao.insertHost(sqlSession, hi);
		return result;
	}

	@Override
	public HostInfo selectHost(String userId) {
		HostInfo hi = hDao.selectHost(sqlSession, userId);
		return hi;
	}

	@Override
	public ArrayList<Space> selectSpaceList(String userId) {
		ArrayList<Space> space = hDao.selectSpaceList(sqlSession, userId);
		return space;
	}

	
}
