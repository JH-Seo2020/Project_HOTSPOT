package com.kh.hotspot.admin.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
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
	
	public int deleteListNotice(SqlSessionTemplate sqlSession, String[] nno ) {
		
		return sqlSession.update("noticeMapper.deleteListNotice", nno);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n ) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("noticeMapper.searchListCount", sc);
	}
	
	public ArrayList<Notice> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchList", sc, rowbounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("noticeMapper.increaseCount", nno);
	}
	
	public int count(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.count");
	}
}
