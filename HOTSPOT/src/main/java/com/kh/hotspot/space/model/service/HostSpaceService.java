package com.kh.hotspot.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
import com.kh.hotspot.space.model.vo.SpcNotes;

public interface HostSpaceService {

	//1. 공간등록
	ArrayList<Space> selectSpaceList(String userId);
	
	//2. 공간 삭제
	int deleteSpace(String spcNo);
	
	//3. 공지사항 게시글 개수 조회
	int selectNoticeCount();

	//공지사항 게시글 리스트 조회
	ArrayList<VoicesNotice> selectList(PageInfo pi);
	
	//5. 공간 등록 
	int insertSpace(Space sp, ArrayList<SpcNotes> noteLIst);

	//공지사항 조회수 증가
	int increaseCount(int nno);
	
	//공지사항 상세조회
	VoicesNotice selectNotices(int nno);

	//공지사항 제목검색시 게시글 개수 조회
	int selectSearchNoticeCount(String keyword);

	//공지사항 제목검색 리스트 가져오기
	ArrayList<VoicesNotice> selectSearchNoticeList(String keyword, PageInfo pi);
	
	// 상세이미지 등록
	int insertImages(SpcImages si);

	
	
}
