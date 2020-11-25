package com.kh.hotspot.common.template;

import com.kh.hotspot.common.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage = startPage + pageLimit -1;
		
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, startPage, endPage, maxPage, pageLimit, boardLimit);
	}
}
