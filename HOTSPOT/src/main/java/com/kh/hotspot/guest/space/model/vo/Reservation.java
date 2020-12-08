package com.kh.hotspot.guest.space.model.vo;

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
public class Reservation{
	
	private int reservNo;
	private String userId;
	private int spcNo;
	private String userIdHost;	//호스트아이디
	private Date reservDate;	//예약신청일
	private String reservName;	//예약자이름
	private String reservPhone;	//예약자전화번호
	private String reservEmail;	//예약자이메일
	private String totalTime;	//총예약시간
	private int reservTotal;	//예약인원수
	private String perpose;		//사용목적
	private String amountTime;	//시간당 금액
	private String useDate;		//사용시작일(2020.01.01)
	private String useTime;		//사용시작시간(14:00)
	private String endDate;		//사용종료일(2020.03.03)
	private String endTime;		//사용종료시간(18:00)
	private Date payDate;		//결제일
	private int paySum;			//결제총금액
	private String refund;		//환불계좌
	private String payMethod;	//결제방법아니야여기..?
	private String reservStatus;//결제상태(예약확정,결제대기,취소환불,이용완료)
	private String spcName;		//공간명...
	
	private int ReSpcNo;
	private String ReSpcName;
	private String ReSpcType;
	private String ReSpcImg;
	private String ReSpcChimg;
	private String ReSpcPrice;
	private String location;
	
	private String HoNo;
	private String HoName;
	private String HoPhone;
	private String HoEmail;
	private String HoLoc;
	
	
	
	
	
	

}
