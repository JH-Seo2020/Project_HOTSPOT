package com.kh.hotspot.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.dao.HostSpaceDao;


@Service
public class HostSpaceServiceImpl implements HostSpaceService{

	@Autowired
	private HostSpaceDao hSpaceDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**@author jisu
	 * @return userId 기반 등록된 모든 공간정보를 받아옴
	 */
	@Override
	public ArrayList<Space> selectSpaceList(String userId) {
		
		
		return hSpaceDao.selectSpaceList(sqlSession, userId);
	}


	@Override
	public int deleteSpace(String spcNo) {
		
		return hSpaceDao.deleteSpace(sqlSession, spcNo);
	}


	@Override
	public int selectNoticeCount() {
		
		return hSpaceDao.selectNoticeCount(sqlSession);
	}


	@Override
	public ArrayList<VoicesNotice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectList(sqlSession, pi);
	}
	
	

}
