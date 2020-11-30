package com.kh.hotspot.space.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
import com.kh.hotspot.space.model.vo.SpcNotes;

@Repository
public class HostSpaceDao {
	
	
	/**
	 * @author jisu
	 * @param sqlSession
	 * @param userId
	 * @return userId 기반 등록된 모든 공간정보를 받아옴
	 * 
	 */
	public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList",userId);
	}

	public int deleteSpace(SqlSessionTemplate sqlSession, String spcNo) {
		
		return sqlSession.update("hostMapper.deleteSpace", spcNo);
	}

	
	/**
	 * @author jisu
	 * @param sqlSession
	 * @return
	 */
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customerservicemapper.selectListCount");
	}

	/**
	 * @author jisu
	 * @return
	 */
	public ArrayList<VoicesNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectList", null, rowBounds);
	}
	/**
	 * @author jieun
	 * @param sqlSession
	 * @param sp
	 * @return
	 */
	// 공간 등록 (상세이미지, 유의사항)
	public int insertSpace(SqlSessionTemplate sqlSession,Space sp) {
		return sqlSession.insert("hostSpaceMapper.insertSpace",sp);
	}

	public int insertImages(SqlSessionTemplate sqlSession,ArrayList<SpcImages> imgList) {
		return sqlSession.insert("hostSpaceMapper.insertImages",imgList);
	}

	public int insertNotes(SqlSessionTemplate sqlSession,ArrayList<SpcNotes> noteList) {
		return sqlSession.update("hostSpaceMapper.insertNotes",noteList);
	}
	
	/**
	 * @author jisu
	 * @return
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("customerservicemapper.increaseCount", nno);
	}
	
	/**
	 * @author jisu
	 * @return
	 */
	public VoicesNotice selectNotices(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.selectOne("customerservicemapper.selectNotices", nno);
	}

	/**
	 * @author jisu
	 * @return
	 */
	public int selectSearchNoticeCount(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customerservicemapper.selectSearchNoticeCount", keyword);
	}

	/**
	 * @author jisu
	 * @return
	 */
	public ArrayList<VoicesNotice> selectSearchNoticeList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectSearchNoticeList", keyword, rowBounds);
	}

}
