package com.kh.hotspot.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.dao.HostSpaceDao;


@Service
public class HostSpaceServiceImpl implements HostSpaceService{

	@Autowired
	private HostSpaceDao spaceDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**@author jisu
	 * 
	 */
	@Override
	public ArrayList<Space> selectSpaceList(String userId) {
		
		
		
		return spaceDao.selectSpaceList(sqlSession, userId);
	}

}
