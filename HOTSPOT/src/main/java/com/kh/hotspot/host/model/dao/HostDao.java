package com.kh.hotspot.host.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.host.model.vo.Qna;
import com.kh.hotspot.host.model.vo.Calculation;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.host.model.vo.Inquiry;
import com.kh.hotspot.space.model.vo.Space;

@Repository
public class HostDao {

	public int insertHost(SqlSessionTemplate sqlSession, HostInfo hi) {
		return sqlSession.insert("hostMapper.insertHost",hi);
		
	}

	public int updateHost(SqlSessionTemplate sqlSession, HostInfo hi) {
		
		return sqlSession.update("hostMapper.updateHost",hi);
	}
	public HostInfo selectHost(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("hostMapper.selectHost", userId);
	}
	public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList", userId);
	}
	public int selectQnaListCount(SqlSessionTemplate sqlSession, String spcName) {
		return sqlSession.selectOne("hostMapper.selectQnaListCount",spcName);
	}
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession ,PageInfo pi, String spcName){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		ArrayList<Qna> list = (ArrayList)sqlSession.selectList("hostMapper.selectQnaList", spcName, rowBounds);
		return list;
	}
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("hostMapper.insertQna",q);
	}

	public ArrayList<Qna> selectAnswerComplete(SqlSessionTemplate sqlSession, PageInfo pi, String spcName) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectAnswerComplete", spcName, rowBounds);
	}

	public ArrayList<Qna> selectAnswerIncomplete(SqlSessionTemplate sqlSession, PageInfo pi,String spcName) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("hostMapper.selectAnswerIncomplete", spcName, rowBounds);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("hostMapper.deleteQna",q);
	}

	public ArrayList<Calculation> selectCalAll(SqlSessionTemplate sqlSession, Calculation cal) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectCalAll",cal);
	}

	public ArrayList<Calculation> selectCalList(SqlSessionTemplate sqlSession, Calculation cal) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectCalList",cal);
	}

	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry inq) {
		return sqlSession.insert("hostMapper.insertInquiry", inq);
	}

	public ArrayList<Inquiry> selectInquiry(SqlSessionTemplate sqlSession,PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("hostMapper.selectInquiry",userId,rowBounds);
	}

	public int selectInquiryCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("hostMapper.selectInquiryCount",userId);
	}

	public int deleteInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
	
		return sqlSession.update("hostMapper.deleteInquiry", inquiryNo);
	}

	public ArrayList<Review> selectMyReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		//HashMap<Object, Object> hmap = new HashMap<>();
		//hmap.put("reservNo", reservNo);
		//hmap.put("userId", userId);
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectMyReviewList", userId, rowBounds);
	}

	public int selectMyReviewListCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hostMapper.selectMyReviewListCount", userId);
	}
}
