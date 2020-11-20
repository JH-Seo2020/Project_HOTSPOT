package com.kh.hotspot.guest.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.guest.myPage.model.service.MemberService;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public String loginMember(@RequestParam("userId") String userId, HttpSession session) {
		
		
		
		Member loginUser = mService.loginMember(userId);
		
		System.out.print(loginUser);
		if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())*/) { // 로그인 성공
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserNickname() + "님 환영합니다!");
			return "redirect:/";
			
		}else { // 실패
			session.invalidate();
			return "redirect:/";
		}
	
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, HttpSession session) {
		
		
		System.out.print(m);
		//String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//m.setUserPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "HOTSPOT에 오신걸 환영합니다!");
			return "redirect:/";
			
		}else { 
			session.invalidate();
			return "redirect:/";
		}
	}
	
	@RequestMapping("test.ho")
	public String enrollAgreements() {
		
		return "common/enrollUserAgreements";
	}
	
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		
		return "common/enrollForm";
	}
	
	@RequestMapping("enrollForm.cancle")
	public String enrollCancle() {
		
		return "redirect:/";
	}
	
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("email.certify")
	public void sendEmail(HttpServletRequest request, String userEmailCheck){
		HttpSession session = request.getSession();
		
		try {
			session.setAttribute("checkNum", mService.mailSend(session, userEmailCheck));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("certificationNumber.check")
	public boolean emailCertification(HttpServletRequest request, String userEmailCheck, String inputCode) {
		HttpSession session = request.getSession();
		
		boolean result = mService.emailCertification(session, userEmailCheck, Integer.parseInt(inputCode));
		
		return result;
	}
	
	@RequestMapping("checkId.me")
	public int idCheck(String userId) {
		
		int result = mService.idCheck(userId);
		
		return result;
	}
	
	@RequestMapping("checkNick.me")
	public int nicknameCheck(String userNickname) {
		
		int result = mService.nickCheck(userNickname);
		
		return result;
	}


}
