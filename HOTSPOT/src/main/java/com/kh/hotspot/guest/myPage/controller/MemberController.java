package com.kh.hotspot.guest.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.guest.myPage.model.service.MemberService;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;
			
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, 
							   HttpSession session, Model model) {
		
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())*/) { // 로그인 성공
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserNickname() + "님 환영합니다!");
			return "redirect:/";
			
		}else { // 실패
			
			session.setAttribute("alertMsg", "로그인에 실패하셨습니다! 다시 시도해주세요.");
			return "redirect:/";
		}
	
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
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


	
	/**
	 * 성희 myPage Controller 시작 !
	 * 
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	public String updateMember(Member m, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(m);
		
		// 새로 넘어온 첨부파일이 있을경우
		if(!upfile.getOriginalFilename().equals("")) {
			
			// 기존의 첨부파일이 있었을 경우 => 서버에 업로드 된 기존 첨부파일을 지우기위해
			if(m.getUserProfile() != null) {
				
				String removeFilePath = session.getServletContext().getRealPath(m.getUserProfileC());
				new File(removeFilePath).delete();
			}
			
			String changeName = saveFile(upfile, session);
			m.setUserProfile(upfile.getOriginalFilename());
			m.setUserProfileC("resources/uploadFiles/" + changeName);
			
		}
		

		int result = mService.updateMember(m);
		
		
		if(result > 0) {
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 정보수정되었습니다.");
			
			return "redirect:myPage.me";
			
		}else{
			
			session.setAttribute("errorMsg", "정보수정에 실패하셨습니다.");
			return "common/errorPage";
			
		}
		
		
	}
	
	
	
	/**
	 * 이메일 인증하기
	 * 
	 */
	@RequestMapping("emailCheck.me")
	public ModelAndView emailCheck(Member m, HttpSession session, ModelAndView mv, 
								HttpServletResponse response_email, HttpServletRequest request) {
		
		Random r = new Random();
		int code = r.nextInt(4589362) + 49311;
		
		String setfrom = "y3ystation@gmail.com";			// 보내는사람 이메일
		String tomail = request.getParameter("userEmail");  // 받는사람 이메일
		String title = "프로필 수정에 필요한 인증 이메일 입니다.";			// 제목
		String content = 
		
		System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성
		
		System.getProperty("line.separator") + "안녕하세요 회원님! 저희 홈페이지를 찾아주셔서 감사합니다." +
		
		System.getProperty("line.separator") +
		
		System.getProperty("line.separator") +
		
		" 인증번호는 " + code + "입니다." 
		
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
		
		
		 MimeMessage message = mailSender.createMimeMessage();
		 try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
		

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
			
            mailSender.send(message);
            
		 } catch (MessagingException e) {
			e.printStackTrace();
		}
		
		 mv.setViewName("guest/myPage/myProfileUpdate");
		 mv.addObject("code", code);
		 
		 System.out.println("mv : "+mv);
		 
         response_email.setContentType("text/html; charset=UTF-8");
         //PrintWriter out_email = response_email("getWriter"); // getWriter가 어디서온걸까..
         //out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        //out_email.flush();
		
		return mv;

	}
	


	/***
	 * 닉네임 중복체크 ajax
	 * 
	 */
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
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mService.deleteMember(loginUser.getUserId());
		
		if(result > 0) {
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
			
			return "redirect:/";
			
		}else {
			
			model.addAttribute("alertMsg", "탈퇴에 실패하셨습니다.");
			return "redirect:/myProfile.me";
		}
		
		}
		
	
	
	// 파일업로드용 공통메소드
	public String saveFile(MultipartFile userProfile, HttpSession session) {
	
		// 원본명
		String originName = userProfile.getOriginalFilename();
		
		// 저장시킬 폴더의 물리적인 경로
		String profilePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 인덱스값 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 수정프로필명
		String changeName = currentTime + ranNum + ext;
		
		try {
			userProfile.transferTo(new File(profilePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	

}
