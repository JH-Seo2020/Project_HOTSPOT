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
public class Inquiry {
	private int inquiryNo;
	private String inquiryWriter; // 작성자 아이디
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryReply;
	private String replyStatus;
	private String enrollDate;
	private String replyDate;
	private String status;
}
