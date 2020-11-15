package com.kh.hotspot.guest.space.model.vo;

import java.sql.Clob;
import java.sql.Date;

//어노테이션 붙여서 만들거 만들기 
public class Qna {
	
	private int qaNo;
	private Clob qaContent; 
	private String qaWriter;	//닉네임
	private Date qaDate;
	private String qaAnswer;
	private String qaStatus;
	private String qaSecret;
	private String userId;
	private int spcNo;

}
