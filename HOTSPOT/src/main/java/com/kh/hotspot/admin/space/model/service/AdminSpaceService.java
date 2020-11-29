package com.kh.hotspot.admin.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.space.model.vo.SearchCondition;
import com.kh.hotspot.admin.space.model.vo.Space;
import com.kh.hotspot.admin.space.model.vo.SpaceImg;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminSpaceService {

	int selectListCount();
	ArrayList<Space> selectList(PageInfo pi);
	
	int searchListCount(SearchCondition sc);
	ArrayList<Space> searchList(PageInfo pi, SearchCondition sc);
	
	int deleteSpace(String[] sno);
	Space detailSpace(int sno);
	ArrayList<Space> selectImgList(int sno);
	ArrayList<Space> selectNotice(int sno);
	
}
