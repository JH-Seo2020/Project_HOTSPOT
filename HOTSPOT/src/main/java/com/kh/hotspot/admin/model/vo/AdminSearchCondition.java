package com.kh.hotspot.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminSearchCondition {
	
	private String searchOption;		// 검색옵션
	private String searchWord;			// 검색어
	private String status;				// 상태

}
