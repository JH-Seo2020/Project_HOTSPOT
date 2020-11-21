package com.kh.hotspot.admin.faq.model.vo;

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
public class Faq {

	private int faqNo;
	private String faqWriter;
	private String faqTitle;
	private String faqContent;
	private String faq_type;
	private String enrollDate;
	
	
}
