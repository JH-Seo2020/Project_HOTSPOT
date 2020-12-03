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
public class Calculation {
	private String reservNo;		// 예약번호
	private int spcNo;			// 공간번호
	private String spcName;		// 공간명
	private String reservDate;	// 조회연월
	private String userId;		// 호스트아이디
	private Date payDate;		//결제일
	private int paySum;			//결제총금액
	private String reservStatus; //현재 결제상태 (예약확정,결제대기,취소환불,이용완료)
}
