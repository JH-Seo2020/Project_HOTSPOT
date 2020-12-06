package com.kh.hotspot.host.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.host.model.vo.Qna;
import com.kh.hotspot.host.model.vo.Calculation;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.host.model.vo.Inquiry;
import com.kh.hotspot.space.model.vo.Space;


public interface HostService {

	//1.호스트등록 
	int insertHost(HostInfo hi);
	//2.호스트 조회
	HostInfo selectHost(String userId);
	//3.공간 정보 조회
	ArrayList<Space> selectSpaceList(String userId);
	//3.호스트정보 수정 
	int updateHost(HostInfo hi);
	//4. qna리스트 전체조회(개수)
	int selectQnaListCount(int spcNo);
	//4_1. qna리스트 전체조회
	ArrayList<Qna> selectQnaList(PageInfo pi, int spcNo);
	//4_2. qna 답글 등록
	int insertQna(Qna q);
	//4_3. qna 답변유무 조회
	ArrayList<Qna> selectAnswerComplete(PageInfo pi, int spcNo);
	ArrayList<Qna> selectAnswerInComplete(PageInfo pi, int spcNo);
	//4_4 qna 삭제
	int deleteQna(Qna q);
	//5. 전체 정산 조회
	ArrayList<Calculation> selectCalAll(Calculation cal);
	//5_1.공간별 정산 조회 
	ArrayList<Calculation> selectCalList(Calculation cal);
	//6. 1:1문의 작성
	int insertInquiry(Inquiry inq);
	//6_2. 1:1문의 전체 개수 조회
	int selectInquiryCount(String userId);
	//6_3. 1:1 문의 리스트조회
	ArrayList<Inquiry> selectInquiry(PageInfo pi, String userId);

}
