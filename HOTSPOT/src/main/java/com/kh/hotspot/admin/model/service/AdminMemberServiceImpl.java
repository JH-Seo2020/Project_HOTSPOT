package com.kh.hotspot.admin.model.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.dao.AdminMemberDao;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.host.model.vo.HostInfo;


@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminMemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override	// 총 회원수 조회
	public int selectListCount() {
		return memberDao.selectListCount(sqlSession);
	}
	
	@Override	// 모든 회원리스트 조회
	public ArrayList<Member> selectList(PageInfo pageInfo) {
		return memberDao.selectList(sqlSession, pageInfo);
	}
	
	@Override	// 회원상세정보 조회
	public Member selectDetail(String userId) {
		return memberDao.selectDetail(userId, sqlSession);
	}
	
	@Override	// 호스트정보 조회
	public HostInfo selectHostInfo(String userId) {
		return memberDao.selectHostInfo(userId, sqlSession);
	}
	
	@Override	// 회원상태, 메모 저장
	public int updateUserInfo(Member member) {
		return memberDao.updateUserInfo(member, sqlSession);
	}

	@Override	// 메일보내기
	public void sendEmail(Member member, String result) throws Exception {
		
		String subject = "";	// 메일제목
		String content = "";	// 메일내용
		String from = "";		// 보내는사람 메일주소
		String to = "";			// 받는사람 메일주소
		if("concent".equals(result)) {	// 수락하는경우
			subject = "[핫스팟] 호스트 신청 수락안내 메일입니다.";
			content = "    <h5>\r\n" + 
					"    <br><br>안녕하세요 핫스팟입니다.<br><br>\r\n" + 
					"    신청해 주신 정보 및 파일 모두 확인해본 결과<br>\r\n" + 
					"    <span style=\"color: rgb(233, 41, 41);\">신청하신 내용과 등록된 내용이 모두 일치하여</span><br>\r\n" + 
					"    <span style=\"color: rgb(233, 41, 41);\">호스트 회원으로 변경되었음을 알려드립니다.</span><br><br>\r\n" + 
					"    항상 좋은 공간과 서비스 부탁드리겠습니다.<br><br>\r\n" + 
					"    자세한 내용은 홈페이지 하단의 번호(02-1253-8253)로 연락 주시면<br>\r\n" + 
					"    친절히 안내해드리겠습니다.<br>\r\n" + 
					"    감사합니다.\r\n" + 
					"    </h5>";
			from = "y3ystation@gmail.com";
			to = member.getUserEmail();
		}else {	// 거절하는경우
			subject = "[핫스팟] 호스트 신청 거절안내 메일입니다.";
			content = "    <h5>\r\n" + 
					"    <br><br>안녕하세요 핫스팟입니다.<br><br>\r\n" + 
					"    신청해 주신 정보 및 파일 모두 확인해본 결과<br>\r\n" + 
					"    <span style=\"color: rgb(233, 41, 41);\">신청하신 내용 중 실제 등록된 내용과 맞지 않는 부분이 확인되어</span><br>\r\n" + 
					"    <span style=\"color: rgb(233, 41, 41);\">호스트 신청이 거절되었음을 알려드립니다.</span><br><br>\r\n" + 
					"    자세한 내용은 홈페이지 하단의 번호(02-1253-8253)로 연락 주시면<br>\r\n" + 
					"    친절히 안내해드리겠습니다.<br>\r\n" + 
					"    감사합니다.\r\n" + 
					"    </h5>";
			from = "y3ystation@gmail.com";
			to = member.getUserEmail();
		}
		
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
		
		mailHelper.setFrom(from);
		mailHelper.setTo(to);
		mailHelper.setSubject(subject);
		mailHelper.setText(content, true);
		
		mailSender.send(mail);
		
	}

	@Override	// 회원유형 변경
	public int updateUserType(String userId) {
		return memberDao.updateUserType(userId, sqlSession);
	}

	@Override	// 호스트상태 변경
	public int updateHostStatus(String userId, String result) {
		
		if("concent".equals(result)) {
			return memberDao.updateHostStatusY(userId, sqlSession);		// 수락
		}else {
			return memberDao.updateHostStatusN(userId, sqlSession);		// 거절
		}
		
	}
	
	


}
