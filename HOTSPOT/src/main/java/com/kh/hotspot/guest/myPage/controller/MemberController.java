package com.kh.hotspot.guest.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hotspot.guest.myPage.model.service.MemberService;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public String loginMember(@RequestParam("userId")String userId, 
							   HttpSession session, Model model) {
				
		Member loginUser = mService.loginMember(userId);
		
		
		
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


	
	// 성희 myPage Controller 시작
	@RequestMapping("myProfile.me")
	public String selectProfileMember() {
		
		return "guest/myPage/myProfile";
		
	}
	
	
	@RequestMapping("profileUpdate.me")
	public String selectUpdateMember() {
		
		return "guest/myPage/myProfileUpdate";
		
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(m.getUserProfile() != null) {
				String removeFilePath = session.getServletContext().getRealPath(m.getUserProfileC());
				new File(removeFilePath).delete();
				
			}
			
			// 새로 넘어온 파일업로드 시키기
			String userProfileC = saveFile(session, reupfile);
			m.setUserProfile(reupfile.getOriginalFilename());
			m.setUserProfileC("resources/uploadFiles/" + userProfileC);
		}
		
		int result = mService.updateMember(m);
		
		
		if(result > 0) { // 정보수정성공
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 정보수정되었습니다.");
			
			return "redirect:myPage.me";
			
		}else{
			
			model.addAttribute("errorMsg", "정보수정에 실패하셨습니다.");
			return "common/errorPage";
			
		}
	}
	
		
	@ResponseBody
	@RequestMapping("updateCheckNickname.me")
	public String updateCheckNickname(String userNickname) {
		
		int count = mService.updateCheckNickname(userNickname);
		
		if(count > 0) {
			return "fail";
			
		}else {
			return "success";
		}
	
		
	}	
	
		
	@RequestMapping("delete.me")
	public String deleteMember(String userId, HttpSession session, Model model) {
		
		int result = mService.deleteMember(userId);
		
		if(result > 0) {
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
			
			return "redirect:/";
			
		}else {
			
			model.addAttribute("errorMsg", "탈퇴에 실패하셨습니다.");
			return "common/errorPage";
		}
		
		}
		
	
	
	// 파일업로드용 공통메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
	
		// 원본명
		String originName = upfile.getOriginalFilename();
		
		// 저장시킬 폴더의 물리적인 경로
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 인덱스값 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 수정명
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	

}
