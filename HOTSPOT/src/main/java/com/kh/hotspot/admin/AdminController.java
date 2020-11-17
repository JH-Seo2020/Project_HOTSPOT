package com.kh.hotspot.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("main.ad")
	public String adminPage() {
		
		return "admin/main";
	}
}
