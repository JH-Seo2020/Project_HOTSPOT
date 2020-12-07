package com.kh.hotspot.host.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.host.model.vo.Qna;
import com.kh.hotspot.host.model.dao.HostDao;
import com.kh.hotspot.host.model.vo.Calculation;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.host.model.vo.Inquiry;
import com.kh.hotspot.space.model.vo.Space;


@Service
public class HostServiceImpl implements HostService {

	@Autowired 
	private HostDao hDao;
	@Autowired // root-context에 등록되어있음 
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHost(HostInfo hi) {
		int result = hDao.insertHost(sqlSession, hi);
		return result;
	}
	@Override
	public int updateHost(HostInfo hi) {
		int result = hDao.updateHost(sqlSession, hi);
		return result;
	}
	@Override
	public HostInfo selectHost(String userId) {
		HostInfo hi = hDao.selectHost(sqlSession, userId);
		return hi;
	}
	@Override
	public ArrayList<Space> selectSpaceList(String userId) {
		ArrayList<Space> space = hDao.selectSpaceList(sqlSession, userId);
		return space;
	}
	@Override
	public int selectQnaListCount(String spcName) {
		int count = hDao.selectQnaListCount(sqlSession,spcName);
		return count;
	}
	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi,String spcName) {
		return hDao.selectQnaList(sqlSession,pi,spcName);
		
	}
	@Override
	public int insertQna(Qna q) {
		return hDao.insertQna(sqlSession,q);
	}
	@Override
	public ArrayList<Qna> selectAnswerComplete(PageInfo pi,String spcName) {
		return hDao.selectAnswerComplete(sqlSession,pi,spcName);
	}
	@Override
	public ArrayList<Qna> selectAnswerInComplete(PageInfo pi, String spcName) {
		return hDao.selectAnswerIncomplete(sqlSession,pi,spcName);
	}
	@Override
	public int deleteQna(Qna q) {
		return hDao.deleteQna(sqlSession, q);
	}
	@Override
	public ArrayList<Calculation> selectCalAll(Calculation cal) {
		return hDao.selectCalAll(sqlSession,cal);
	}
	@Override
	public ArrayList<Calculation> selectCalList(Calculation cal) {
		return hDao.selectCalList(sqlSession,cal);
	}
	@Override
	public int insertInquiry(Inquiry inq) {
		return hDao.insertInquiry(sqlSession,inq);
	}
	@Override
	public ArrayList<Inquiry> selectInquiry(PageInfo pi,String userId) {
		return hDao.selectInquiry(sqlSession,pi,userId);
	}
	@Override
	public int selectInquiryCount(String userId) {
		return hDao.selectInquiryCount(sqlSession,userId);
	}
	@Override
	public int deleteInquiry(int inquiryNo) {
		return hDao.deleteInquiry(sqlSession,inquiryNo);
	}
	@Override
	public int selectMyReviewListCount(String userId) {
		// TODO Auto-generated method stub
		return hDao.selectMyReviewListCount(sqlSession,userId);
	}
	@Override
	public ArrayList<Review> selectMyReviewList(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		return hDao.selectMyReviewList(sqlSession,pi,userId);
	}
}
