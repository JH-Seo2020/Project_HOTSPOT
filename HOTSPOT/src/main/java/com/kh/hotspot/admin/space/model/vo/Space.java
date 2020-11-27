package com.kh.hotspot.admin.space.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Space {

	private int spcNo;
	private String spcName;
	private String spcInt;
	private String spcLong;
	private String spcTag;
	private String spcType;
	private String spcMin;
	private String spcMax;
	private String spcImg;
	private String spcChimg;
	private String spcPrice;
	private String spcHours;
	private String spcHoliday;
	private String spcStatus;
	private String spcCon;
	private String userId;
	private String mapLatitude;
	private String mapLongitude;
	private String mapLocation;
	private String enrollDate;
}
