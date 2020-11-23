package com.kh.hotspot.guest.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hotspot.guest.myPage.model.service.MemberService;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		
		
		Member loginUser = mService.loginMember(m);
		
		System.out.print(loginUser);
		if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())*/) { // 로그인 성공
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserNickname() + "님 환영합니다!");
			return "redirect:/";
			
		}else { // 실패
			
			model.addAttribute("errorMsg", "로그인에 실패하셨습니다!");
			return "common/errorPage";
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
	@ResponseBody
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
	
	@ResponseBody
	@RequestMapping("certificationNumber.check")
	public boolean emailCertification(HttpServletRequest request, String userEmailCheck, String inputCode) {
		HttpSession session = request.getSession();
		
		boolean result = mService.emailCertification(session, userEmailCheck, Integer.parseInt(inputCode));
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="checkId.me", produces="text/html; charset=utf-8")
	public String idCheck(String userId) {
		
		System.out.print(userId);
		
		String result = "succece";//mService.idCheck(userId);
		
		return result;
	}
	
	@RequestMapping("checkNick.me")
	public int nicknameCheck(String userNickname) {
		
		int result = mService.nickCheck(userNickname);
		
		return result;
	}


	@RequestMapping("myProfile.me")
	public String selectProfileMember() {
		
		return "guest/myPage/myProfile";
		
	}
	
	
	@RequestMapping("profileUpdate.me")
	public String selectUpdateMember() {
		
		return "guest/myPage/myProfileUpdate";
		
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		
		int result = mService.updateMember(m);
		
		
		if(result > 0) { // 정보수정성공
			
			session.setAttribute("loginUser", mService.loginMember(m));
			System.out.println(m);
			session.setAttribute("alertMsg", "성공적으로 정보수정되었습니다.");
			
			return "redirect:myPage.me";
			
		}else{
			
			model.addAttribute("errorMsg", "정보수정에 실패하셨습니다.");
			return "common/errorPage";
			
		}
	}

}
