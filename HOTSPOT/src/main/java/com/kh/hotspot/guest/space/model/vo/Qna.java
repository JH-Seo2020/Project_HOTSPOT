package com.kh.hotspot.guest.space.model.vo;

import java.sql.Clob;
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
	private String qaContent;		//string으로 받아서 Clob으로 넘겨줄예정
	private String qaWriter;	//닉네임
	private Date qaDate;
	private String qaAnswer;
	private String qaStatus;
	private String qaSecret;
	private String userId;
	private int spcNo;

}
