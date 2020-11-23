package com.kh.hotspot.guest.voices.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesFaq;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.guest.voices.model.vo.VoicesSearch;

@Repository
public class VoicesDao {
	
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customerservicemapper.selectListCount");
	}

	public ArrayList<VoicesNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("customerservicemapper.increaseCount", nno);
	}

	public VoicesNotice selectNotices(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.selectOne("customerservicemapper.selectNotices", nno);
	}

	public int selectSearchNoticeCount(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("customerservicemapper.selectSearchNoticeCount", keyword);
	}
	
	public ArrayList<VoicesNotice> selectSearchNoticeList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectSearchNoticeList", keyword, rowBounds);
	}

	
	
	//여기서부터 자주묻는질문(FAQ)
	
	public int selectFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customerservicemapper.selectFaqListCount");
	}

	public ArrayList<VoicesFaq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectFaqList", null, rowBounds);
	}

	public int selectSearchFaqCount(SqlSessionTemplate sqlSession, VoicesSearch vs) {
		
		return sqlSession.selectOne("customerservicemapper.selectSearchFaqCount", vs);
	}

	public ArrayList<VoicesFaq> selectSearchFaq(SqlSessionTemplate sqlSession, VoicesSearch vs, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectSearchFaq", vs, rowBounds);
	}


}
