package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.guest.space.model.dao.SpaceDao;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;

@Service
public class SpaceDetailServiceImpl implements SpaceDetailService {
	
	@Autowired
	private SpaceDao spaceDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public SpaceInfo selectSpaceDetail(int spcNo) {
		
		return spaceDao.selectSpaceDetail(sqlSession, spcNo);
	}

	@Override
	public ArrayList<SpaceImages> selectSpaceImages(int spcNo) {
		
		return spaceDao.selectSpaceImages(sqlSession,spcNo);
	}

	@Override
	public ArrayList<SpaceNotes> selectSpaceNotes(int spcNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Review> selectUserReviewDetail(int spcNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Qna> selectQnaDetail(int spcNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReport() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLike(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SpaceInfo> selectStartTime() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SpaceInfo> selectEndTime() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLike() {
		// TODO Auto-generated method stub
		return 0;
	}




}
