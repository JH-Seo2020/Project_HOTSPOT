package com.kh.hotspot.admin.space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.space.model.service.AdminSpaceService;

@Controller
public class AdminSpaceController {
	
	@Autowired
	private AdminSpaceService sService;
	
	@RequestMapping("list.sad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="arr", defaultValue="최신순") String arr, Model model, String search, String keyword ) {
		
		
		return "admin/adminSpace/spaceList";
	}
}
