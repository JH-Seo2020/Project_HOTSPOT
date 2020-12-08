package com.kh.hotspot.admin.notice.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface NoticeService {

	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	int insertNotice(Notice n);
	
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	int updateNotice(Notice n);
	int deleteListNotice(String[] nno);
	int deleteNotice(int nno);
	int searchListCount(SearchCondition sc);
	ArrayList<Notice> searchList(PageInfo pi, SearchCondition sc);
	int count();
}
