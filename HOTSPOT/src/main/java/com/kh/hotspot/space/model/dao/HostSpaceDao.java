package com.kh.hotspot.space.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.vo.Space;

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
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<VoicesNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("customerservicemapper.selectList", null, rowBounds);
	}

}
