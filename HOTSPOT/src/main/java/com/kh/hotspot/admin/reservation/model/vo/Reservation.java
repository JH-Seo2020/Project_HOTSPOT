package com.kh.hotspot.admin.reservation.model.vo;

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
public class Reservation {
	
	private int reNo;		// 예약번호
	private String reGuest; // 게스트아이디
	private int spcNo;		// 공간번호
	private String reHost;	// 호스트 아이디
	private String reDate;	// 예약신청 날짜
	private String reName;	// 예약자이름
	private String tTime;	// 예약이용 총 시간
	private int reTotal;	// 총 인원
	private String pType;	// 사용하는 목적
	private double aTime;	// 시간당 금액
	private String startDate;// 이용시작 날짜
	private String startTime;// 시작시간
	private String endDate;	// 이용종료날짜
	private String endTime;	// 종료시간
	private String payDate; // 결제날짜
	private String pSum;	// 결제 총 금액
	private String refund;	// 환불계좌
	private String payMethod;// 결제방법
	private String reStatus;// 예약상태	
}
