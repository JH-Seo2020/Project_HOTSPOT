package com.kh.hotspot.guest.voices.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesFaq;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;

public interface VoicesService {
	
	//1-1.공지게시글개수조회
	int selectListCount();
	//1-2.페이지가져오기
	ArrayList<VoicesNotice> selectList(PageInfo pi);
	
	//2-1.공지사항 조회수증가
	int increaseCount(int nno);
	//2-2.공지사항 상세조회
	VoicesNotice selectNotices(int nno);
	
	//3-1.공지사항 제목검색 시 게시글 개수 조회
	int selectSearchNoticeCount(String keyword);
	//3-2.공지사항 제목검색 리스트 가져오기
	ArrayList<VoicesNotice> selectSearchNoticeList(String keyword, PageInfo pi);
	
	//4-1.faq게시글개수조회
	int selectFaqListCount();
	//4-2.페이지가져오기(내용까지다)
	ArrayList<VoicesFaq> selectFaqList(PageInfo pi);
	
	//5.faq 검색
	ArrayList<VoicesFaq> selectSearchFaq(String keyword, PageInfo pi);

	
}
