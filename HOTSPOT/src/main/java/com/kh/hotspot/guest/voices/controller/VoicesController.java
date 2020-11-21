package com.kh.hotspot.guest.voices.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.guest.voices.model.service.VoicesService;


@Controller
public class VoicesController {
	
//	@Autowired
//	private VoicesService vService;
	
	@RequestMapping("notice.guest")
	public String noticeForGuest(Model model) {
		return "guest/voices/noticeListView";
	}

}
