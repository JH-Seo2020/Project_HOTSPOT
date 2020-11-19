package com.kh.hotspot.admin.inquiry.model.vo;

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
	private String inquiryWriter;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryReply;
	private String replyStatus;
	private String enrollDate;
	private String replyDate;
	private String status;
	
}
