package com.kh.hotspot.host.model.vo;


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
public class Qna {
	
	private int qaNo;
	private String qaContent; 
	private String qaWriter;	//닉네임
	private Date qaDate;
	private String qaAnswer;
	private String qaStatus;
	private String qaSecret;
	private String userId;
	private int spcNo;
	private String spcName;
	private String spcType;

}
