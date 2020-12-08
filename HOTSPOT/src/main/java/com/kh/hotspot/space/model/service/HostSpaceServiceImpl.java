package com.kh.hotspot.space.model.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
import com.kh.hotspot.space.model.vo.SpcNotes;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.dao.HostSpaceDao;


@Service
public class HostSpaceServiceImpl implements HostSpaceService{

	@Autowired
	private HostSpaceDao hSpaceDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private JavaMailSender mailSender;
	
	
	/**@author jisu
	 * @return userId 기반 등록된 모든 공간정보를 받아옴
	 */
	@Override
	public ArrayList<Space> selectSpaceList(String userId) {
		
		
		return hSpaceDao.selectSpaceList(sqlSession, userId);
	}


	@Override
	public int deleteSpace(String spcNo) {
		
		return hSpaceDao.deleteSpace(sqlSession, spcNo);
	}


	@Override
	public int selectNoticeCount() {
		
		return hSpaceDao.selectNoticeCount(sqlSession);
	}


	@Override
	public ArrayList<VoicesNotice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectList(sqlSession, pi);
	}


	@Override
	public int insertSpace(Space sp, ArrayList<SpcNotes> noteList) {
		int result = hSpaceDao.insertSpace(sqlSession,sp);
		int result2 = 0;
		for(int i =0; i<noteList.size(); i++) {
			result2= hSpaceDao.insertNotes(sqlSession, noteList.get(i));
		}
		
		
//		if(result == 0 || result2 == 0  ) {
//			return 0;
//		}
		return result;
	}
	@Override
	public int insertImages(SpcImages si) {
		
		return hSpaceDao.insertImages(sqlSession, si);
	}
	
	public int increaseCount(int nno) {
		// TODO Auto-generated method stub
		return hSpaceDao.increaseCount(sqlSession,nno);
	}


	@Override
	public VoicesNotice selectNotices(int nno) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectNotices(sqlSession,nno);
	}


	@Override
	public int selectSearchNoticeCount(String keyword) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectSearchNoticeCount(sqlSession, keyword);
	}


	@Override
	public ArrayList<VoicesNotice> selectSearchNoticeList(String keyword, PageInfo pi) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectSearchNoticeList(sqlSession, keyword, pi);
	}


	@Override
	public ArrayList<Reservation> spaceReservationList(String userId) {
		// TODO Auto-generated method stub
		return hSpaceDao.spaceReservationList(sqlSession, userId);
	}


	@Override
	public int updateSpace(Space sp, ArrayList<SpcNotes> noteList) {
		
		int result = hSpaceDao.updateSpace(sqlSession,sp);
		int result2 = 0;
		for(int i =0; i<noteList.size(); i++) {
			result2= hSpaceDao.updateNotes(sqlSession, noteList.get(i));
		}
		
		
//		if(result == 0 || result2 == 0  ) {
//			return 0;
//		}
		return result;
	}


	@Override
	public Member refundEmail(String guestId) {
		
		return hSpaceDao.refundEmail(sqlSession, guestId);
	}
	
	@Override
	public int mailSend(HttpSession session, String refundEmail, String hostEmail) {
		
		

		
		String subject = "결제 취소 메일";
        String content = "호스트가 결제를 취소하였습니다. 해당 자세한 내용을 확인하시려면 "+hostEmail+"로 연락해주시기 바랍니다.";
        String from = "y3ystation@gmail.com";
        String to = refundEmail;
        
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
		return 0;
	}


	@Override
	public int ReservationCancle(Reservation searchReservation) {
		// TODO Auto-generated method stub
		return hSpaceDao.ReservationCancle(sqlSession, searchReservation);
	}


	@Override
	public Space selectOneSpace(int sno) {
		// TODO Auto-generated method stub
		return hSpaceDao.selectOneSpace(sqlSession, sno);
	}


	@Override
	public int selectAll() {
		
		return hSpaceDao.selectAll(sqlSession);
	}




	
	

}
