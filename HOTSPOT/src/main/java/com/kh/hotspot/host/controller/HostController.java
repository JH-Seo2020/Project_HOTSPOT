package com.kh.hotspot.host.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.host.model.service.HostService;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.space.model.vo.Space;

@Controller
public class HostController {
	@Autowired 
	private HostService hService;
	
	/**
	 * @author jieun
	 * @return 호스트메인페이지
	 */
	@RequestMapping("hostMain.ho")
	public String hostMain(Member m,HttpSession session) {
		
		Member loginUser =(Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		HostInfo hi =  hService.selectHost(userId);
		if(hi != null) {
			session.setAttribute("hostInfo", hi );
			return "host/common/hostMain";
		}
		return "host/common/hostMain";
	}
	/**
	 * @author jieun
	 * @return 호스트등록페이지
	 */
	@RequestMapping("hostEnrollForm.ho")
	public String hostEnrollForm() {
		return "host/hostPage/hostEnrollForm";
	}
	/**
	 * @author jieun
	 * @return 호스트등록
	 */
	@RequestMapping("insertHost.ho")
	public String hostEnroll(HttpSession session,HostInfo hi,MultipartFile upfile, ModelAndView mv) {
		
		// 1. 파일 작업 
		// 전달 된 파일이 있을 경우 => 파일명 수정 작업 후 업로드 
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session); 
			
			if(changeName != null) {
				hi.setBusinessLicense(upfile.getOriginalFilename());
				hi.setLicensePath("resources/upFiles/" + changeName);
			}
		}
					
		//2. 서비스 호출 
		int result = hService.insertHost(hi);
		
		//3. 결과
		if(result > 0) {
			session.setAttribute("alertMsg", "호스트등록이 완료 되었습니다. 승인여부는(1~2일 소요) 이메일로 안내드리겠습니다 ");
			return "redirect:hostMain.ho";
			
		}else { // 실패 할 경우 
			return "common/errorPage";
		}
		
	}
	/**
	 * @author jieun
	 * @param upfile
	 * @param session
	 * @return 파일 저장 및 이름 변경 메소드
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		// 저장시킬 폴더의 물리적인 경로 
		String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return changeName;
	}
	/**
	 * @author jieun
	 * @param session
	 * @param h
	 * @return 호스트 qna 페이지
	 */
	@RequestMapping("hostQnaForm.ho")
	public String hostQnaForm(HttpSession session, Model model) {
		//1. userId 뽑기 
		HostInfo hi = (HostInfo) session.getAttribute("hostInfo");
		String userId = hi.getUserId();
		//2.  hService 전달 
		ArrayList<Space> space = hService.selectSpaceList(userId);
		//3. 결과의 따른 화면 
		if(space != null) {
			model.addAttribute("space",space);
			return "host/hostPage/hostQna";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("hostInquiry.ho")
	public String hostInquiryForm() {
		
		return "host/hostPage/hostInquiry";
	}
	
	@RequestMapping("hostCalculateForm.ho")
	public String hostCalculateForm() {
		return "host/hostPage/hostCalculateForm";
	}
	
	
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("hostMyPage.ho")
	public String hostMyPage() {
		
		
			return "host/hostPage/hostMyPage";
		
	}
	/**
	 * @author jius
	 * @return
	 */
	@RequestMapping("modify.ho")
	public String modifyHost() {
		
		return "host/hostPage/hostMyPageModify";
	}
	
	@RequestMapping("updateHost.ho")
	public String updateHost(HttpSession session,HostInfo hi,MultipartFile upfile) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session); // 공통으로 쓰이게끔 뺀 메소드 호출만으로 끝
			
			if(changeName != null) {
				hi.setBusinessLicense(upfile.getOriginalFilename());
				hi.setLicensePath("resources/upFiles/" + changeName);
			}
		}
		int result =hService.updateHost(hi);
		
		return "host/hostPage/hostMyPage";
	}
}
