package com.kh.hotspot.guest.myPage.model.service;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.hotspot.guest.myPage.model.dao.MemberDao;
import com.kh.hotspot.guest.myPage.model.vo.MailUtils;
import com.kh.hotspot.guest.myPage.model.vo.Member;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao mDao;
	@Autowired
	private JavaMailSender mailSender;

	

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String userId) {
		
		return mDao.idCheck(sqlSession, userId);
	}

	@Override
	public int mailSend(HttpSession session, String userEmailCheck) throws Exception {
		//인증번호 관련
		
		int result = 10000;
		
		//mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>이메일 인증 번호는 다음과 같습니다.</p>")
				.append(result)
				.toString());
		sendMail.setFrom("관리자 ", "관리자명");
		sendMail.setTo(userEmailCheck);
		sendMail.send();
		
		return result;
		
	}

	@Override
	public boolean emailCertification(HttpSession session, String userEmailCheck, int inputCode) {
		
		int gerneationCode = (Integer) session.getAttribute("checkNum");
		
		if(gerneationCode == inputCode) {
			return true;
		}else {
		
			return false;
	
		}
	}

	@Override
	public int nickCheck(String userNickname) {
		
		return mDao.nickCheck(sqlSession, userNickname);
	}


	@Override
	public int loginUpdate(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteloginMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}



}
