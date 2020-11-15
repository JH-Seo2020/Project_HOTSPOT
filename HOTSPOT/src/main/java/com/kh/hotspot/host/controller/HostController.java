package com.kh.hotspot.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HostController {

	@RequestMapping("test.do")
	public String test( Model model) {
		
		return "host/hostEnrollForm";
	}
}
