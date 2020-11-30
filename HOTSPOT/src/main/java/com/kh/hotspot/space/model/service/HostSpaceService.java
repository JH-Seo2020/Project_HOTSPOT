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
	int insertSpace(Space sp, ArrayList<SpcImages> imgList, ArrayList<SpcNotes> noteLIst);

	
	
}
