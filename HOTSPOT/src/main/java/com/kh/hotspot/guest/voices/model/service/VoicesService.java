package com.kh.hotspot.guest.voices.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;

public interface VoicesService {
	
	//1-1.공지게시글개수조회
	int selectListCount();
	//1-2.페이지가져오기
	ArrayList<VoicesNotice> selectList(PageInfo pi);
	
	//2-1.공지사항 상세보기
	int increaseCount(int noticeNo);
	//2-2.공지사항 상세조회
	VoicesNotice selectNotices(int noticeNo);
	
	//3.공지사항 제목검색
	ArrayList<VoicesNotice> selectSearchNotice(String keyword);

	
}
