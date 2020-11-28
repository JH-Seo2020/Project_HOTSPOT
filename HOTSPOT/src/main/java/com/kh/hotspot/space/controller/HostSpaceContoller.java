package com.kh.hotspot.space.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.space.model.service.HostSpaceService;
import com.kh.hotspot.space.model.vo.Space;

@Controller
public class HostSpaceContoller {
	
	@Autowired
	private HostSpaceService hSpaceService;
	
	/**
	 * @author jieun
	 * @return 공간등록페이지
	 */
	@RequestMapping("spaceEnrollForm.ho")
	public String spaceEnrollForm() {
		return "host/space/spaceEnrollForm";
	}
	
	
	/**
	 * @author jisu
	 * @return 호스트 공간정보
	 */
	@RequestMapping("space.list")
	public String spaceList(HttpSession session) {
		
		Member loginUser =(Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		
		ArrayList<Space> spaceList = hSpaceService.selectSpaceList(userId);
		session.setAttribute("spaceList", spaceList);
		
		return "host/space/spaceInfoList";
	}
	
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("spaceModifyForm.ho")
	public String spaceModifyForm() {
		return "host/space/spaceModifyForm";
	}
	
	
	/**
	 * @author jisu
	 * @param sp
	 * @param session
	 * @return
	 */
	@RequestMapping("spaceModify.ho")
	public String spaceModify(Space sp, HttpSession session) {
		
		
		return null;
	}
	
	
	
	
	@RequestMapping("delete.space")
	public ModelAndView spaceDelete(String spcNo, ModelAndView mv, HttpSession session) {
		
		int result = hSpaceService.deleteSpace(spcNo);
		
		if(result > 0) {
			
			Member loginUser =(Member) session.getAttribute("loginUser");
			
			String userId = loginUser.getUserId();
			
			
			ArrayList<Space> spaceList = hSpaceService.selectSpaceList(userId);
			mv.addObject("spaceList", spaceList).setViewName("host/space/spaceInfoList");
			
		}else {
			mv.addObject("errorMsg", "삭제에 실패했습니다").setViewName("common/errorPage");
			
		}
		return mv;
	}
	
	@RequestMapping("notice.ho")
	public String hostNoticeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = hSpaceService.selectNoticeCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		ArrayList<VoicesNotice> list = hSpaceService.selectList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "host/hostPage/hostNoticePage";
	}
}
