package com.kh.hotspot.admin.inquiry.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface InquiryService {

	int selectListCount();
	ArrayList<Inquiry> selectList(PageInfo pi, String head);
	
	Inquiry selectInquiry(int ino);
	
	int insertReply(int ino);
	
	int deleteListInquiry(String[] ino);
	int deleteInquiry(int ino);
	
	int searchListCount(SearchCondition sc);
	ArrayList<Inquiry> searchList(SearchCondition sc, PageInfo pi);
	
}
