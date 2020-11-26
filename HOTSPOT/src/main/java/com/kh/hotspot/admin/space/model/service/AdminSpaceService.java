package com.kh.hotspot.admin.space.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hotspot.admin.space.model.vo.Space;
import com.kh.hotspot.admin.space.model.vo.SpaceImg;
import com.kh.hotspot.common.model.vo.PageInfo;

public interface AdminSpaceService {

	int selectListCount(String arr);
	ArrayList<Space> selectList(PageInfo pi, String arr);
	
	int searchListCount(Map map);
	ArrayList<Space> searchList(PageInfo pi, Map map);
	
	int deleteSpace(String[] sno);
	Space detailSpace(int sno);
	ArrayList<SpaceImg> selectImgList(int sno);
	
}
