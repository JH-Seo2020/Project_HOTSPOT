package com.kh.hotspot.admin.faq.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.faq.model.vo.Faq;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface FaqService {

	int selectListCount();
	ArrayList<Faq> selctList(PageInfo pi);
	
	int searchListCount(SearchCondition sc);
	ArrayList<Faq> searchList(SearchCondition sc, PageInfo pi);
	
	int insertFaq(Faq f);
	Faq selectFaq(int fno);
	
	int updateFaq(Faq f);
	
	int deleteFaq(String[] fno);
	
}
