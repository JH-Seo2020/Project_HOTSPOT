package com.kh.hotspot.guest.myPage.model.service;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
		
		return mDao.updateMember(sqlSession, m);
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
		
		String subject = "인증 메일";
        String content = "인증번호는 "+result+"입니다";
        String from = "y3ystation@gmail.com";
        String to = userEmailCheck;
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
		return result;
	}

	@Override
	public boolean emailCertification(HttpSession session, String userEmailCheck, int inputCode) {
		
		int gerneationCode = 10000;
		
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




}
