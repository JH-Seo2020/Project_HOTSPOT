package com.kh.hotspot.guest.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;

@Repository
public class SpaceDetailDao {
	

	public SpaceInfo selectSpaceDetail(SqlSessionTemplate sqlSession, int spcNo) {
		
		return sqlSession.selectOne("guestspaceMapper.selectSpaceDetail",spcNo);
	}

	public ArrayList<SpaceImages> selectSpaceImages(SqlSessionTemplate sqlSession, int spcNo) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectSpaceImages",spcNo);
	}

	public ArrayList<SpaceNotes> selectSpaceNotes(SqlSessionTemplate sqlSession, int spcNo) {
		
		return (ArrayList)sqlSession.selectList("guestspaceMapper.selectSpaceNotes",spcNo);
	}

	public Member selectWhoIsHost(SqlSessionTemplate sqlSession, int spcNo) {

		return sqlSession.selectOne("guestspaceMapper.selectWhoIsHost",spcNo);
	}

	//질문등록
	public int insertQuestion(SqlSessionTemplate sqlSession, Qna qna) {

		return sqlSession.insert("guestspaceMapper.insertQuestion",qna);
	}

	//신고등록
	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		
		return sqlSession.insert("guestspaceMapper.insertReport",report);
	}

}
