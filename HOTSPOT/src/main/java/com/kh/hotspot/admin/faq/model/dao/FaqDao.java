package com.kh.hotspot.admin.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.faq.model.vo.Faq;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

@Repository
public class FaqDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminFaqMapper.selectListCount"); 
	}
	
	public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminFaqMapper.selectList", null, rowbounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		
		return sqlSession.selectOne("adminFaqMapper.searchListCount", sc);
		
	}
	
	public ArrayList<Faq> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc){
			
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminFaqMapper.searchList", sc, rowbounds);
	}
	
	public Faq selectFaq(SqlSessionTemplate sqlSession, int fno) {
	
		return sqlSession.selectOne("adminFaqMapper.selectFaq", fno); 
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, String[] fno) {
		
		return (int)sqlSession.delete("adminFaqMapper.deleteFaq", fno);
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("adminFaqMapper.insertFaq", f);
	}
	
	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		
		return sqlSession.update("adminFaqMapper.updateFaq", f);
	}
}
