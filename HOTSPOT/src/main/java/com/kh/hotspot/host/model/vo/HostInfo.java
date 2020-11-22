package com.kh.hotspot.host.model.vo;

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
public class HostInfo {
	
	private String userId;
	private String businessNo;
	private String businessName;
	private String businessLicense;
	private String licensePath;
	private String businessLoc;
	private String businessAcc;
	private String businessPhone;
	private String businessEmail;
	private String hostStatus;
	
}
