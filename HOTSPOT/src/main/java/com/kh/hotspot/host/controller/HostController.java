package com.kh.hotspot.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HostController {
	/**
	 * @author jieun
	 * @return 호스트메인페이지
	 */
	@RequestMapping("hostMain.ho")
	public String hostMain() {
		
		return "host/common/hostMain";
		
	}
	
	@RequestMapping("hostEnrollForm.ho")
	public String hostEnrollForm() {
		
		return "host/hostPage/hostEnrollForm";
	}
	
	@RequestMapping("hostInquiry.ho")
	public String hostInquiryForm() {
		
		return "host/hostPage/hostInquiry";
	}
	@RequestMapping("hostCalculateForm.ho")
	public String hostCalculateForm() {
		return "host/hostPage/hostCalculateForm";
	}
}
