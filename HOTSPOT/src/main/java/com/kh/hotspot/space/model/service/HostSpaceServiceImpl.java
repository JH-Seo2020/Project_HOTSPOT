package com.kh.hotspot.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
import com.kh.hotspot.space.model.vo.SpcNotes;
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


	@Override
	public int insertSpace(Space sp, ArrayList<SpcImages> imgList, ArrayList<SpcNotes> noteList) {
		int result = hSpaceDao.insertSpace(sqlSession,sp);
		int result3 = hSpaceDao.insertNotes(sqlSession, noteList);
	//	int result2 = hSpaceDao.insertImages(sqlSession, imgList);
		
//		if(result == 0 || result2 == 0 || result3 == 0) {
//			return 0;
//		}
		return result;
	}
	public int increaseCount(int nno) {
		// TODO Auto-generated method stub
		return hSpaceDao.increaseCount(sqlSession,nno);
	}


	@Override
	public VoicesNotice selectNotices(int nno) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectNotices(sqlSession,nno);
	}


	@Override
	public int selectSearchNoticeCount(String keyword) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectSearchNoticeCount(sqlSession, keyword);
	}


	@Override
	public ArrayList<VoicesNotice> selectSearchNoticeList(String keyword, PageInfo pi) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectSearchNoticeList(sqlSession, keyword, pi);
	}
	
	

}
