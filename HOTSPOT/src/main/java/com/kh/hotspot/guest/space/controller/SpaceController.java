package com.kh.hotspot.guest.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpaceController {
	
	@RequestMapping("/")
	public String index() {
		return "main";
	}

}
