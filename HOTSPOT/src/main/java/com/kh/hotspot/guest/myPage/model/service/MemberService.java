package com.kh.hotspot.guest.myPage.model.service;

import javax.servlet.http.HttpSession;

import com.kh.hotspot.guest.myPage.model.vo.Member;


public interface MemberService {
	
	 Member loginMember(Member m);
	 
	 int insertMember(Member m);

	 int updateMember(Member m);
	 
	 int deleteMember(String userId);
	 
	 int idCheck(String userId);
	 
	 int mailSend(HttpSession session, String userEmailCheck) throws Exception;

	 boolean emailCertification(HttpSession session, String userEmailCheck, int parseInt);

	 int nickCheck(String userNickname);
	 
}
