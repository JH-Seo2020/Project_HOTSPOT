package com.kh.hotspot.admin.space.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.space.model.vo.SearchCondition;
import com.kh.hotspot.admin.space.model.vo.Space;
import com.kh.hotspot.admin.space.model.vo.SpaceImg;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class AdminSpaceDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminSpaceMapper.selectListCount");
	}
	
	public ArrayList<Space> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminSpaceMapper.selectList", null, rowbounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		
		return sqlSession.selectOne("adminSpaceMapper.searchListCount", sc);
	}
	
	public ArrayList<Space> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminSpaceMapper.searchList", sc, rowbounds);
		
		
	}
	
	public int deleteSpace(SqlSessionTemplate sqlSession, String[] sno) {
		
		return sqlSession.update("adminSpaceMapper.deleteSpace", sno);
	}
	
	public Space detailSpace(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("adminSpaceMapper.detailSpace", sno);
		
		
	}
	
	public ArrayList<Space> selectImgList(SqlSessionTemplate sqlSession, int sno){
		
		return (ArrayList)sqlSession.selectList("adminSpaceMapper.selectImgList", sno);
	}
	
	public ArrayList<Space> selectNotice(SqlSessionTemplate sqlSession, int sno){
		return (ArrayList)sqlSession.selectList("adminSpaceMapper.selectNotice", sno);
	}
	
	
}
