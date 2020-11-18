package com.kh.hotspot.admin.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
		
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}
}
