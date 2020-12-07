package com.kh.hotspot.space.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;
import com.kh.hotspot.space.model.service.HostSpaceService;
import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
import com.kh.hotspot.space.model.vo.SpcNotes;
@Controller
public class HostSpaceContoller {
	
	@Autowired
	private HostSpaceService hSpaceService;
	
	/**
	 * @author jieun
	 * @return 공간등록페이지
	 */
	@RequestMapping("spaceEnrollForm.ho")
	public String spaceEnrollForm() {
		return "host/space/spaceEnrollForm";
	}
	/**
	 * @author jieun
	 */
	@RequestMapping("insertSpace.ho")
	public String insertSpace(Space sp, MultipartFile upfile, MultipartFile[] upfiles,SpcNotes sn,HttpSession session,Model model) {
		// 1. 대표 이미지 파일 작업 
			// 전달 된 파일이 있을 경우 => 파일명 수정 작업 후 업로드 
			if(!upfile.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile,session); 
				
				if(changeName != null) {
					sp.setSpcImg(upfile.getOriginalFilename());
					sp.setSpcChimg("resources/upFiles/" + changeName);
				}
			}
	
		// 2. 유의사항 null 체크 및 값 넣어주기 
			ArrayList<SpcNotes>noteList = new ArrayList();
			if(sp.getNoteList() != null) {
				noteList=sp.getNoteList();
			}
		// 3. service 호출
		int result =  hSpaceService.insertSpace(sp,noteList);
		
		// 4. 상세이미지 파일작업
		int imageResult =0;
		SpcImages si = new SpcImages();
		if(upfiles.length > 0) {
		ArrayList changeName = saveFile2(upfiles,session); 
			if(changeName != null) {
				for(int i=0; i<upfiles.length; i++) {
					si.setImgOgImg(upfiles[i].getOriginalFilename());
					si.setImgChImg("resources/upFiles/" + changeName.get(i));
					imageResult = hSpaceService.insertImages(si);
				}
			}
		}
		if(result > 0 && imageResult > 0) {
			session.setAttribute("alertMsg","공간등록이 성공적으로 완료 되었습니다 :)");
			return "host/common/hostMain";
		}else {
			return "common/errorPage";
		}
	
	}
	// 파일 저장 메소드 
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
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
	// 상세이미지들 저장 메소드 
	private ArrayList saveFile2(MultipartFile[] upfiles, HttpSession session) {
		ArrayList list = new ArrayList();
		for(int i=0; i<upfiles.length; i++) {
			if(upfiles[i] != null) {
				String originName = upfiles[i].getOriginalFilename();
				// 저장시킬 폴더의 물리적인 경로 
				String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int)(Math.random() * 90000 + 10000);
				String ext = originName.substring(originName.lastIndexOf("."));
				
				String changeName = currentTime + ranNum + ext;
				
				list.add(changeName);
				
				try {
					upfiles[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
	/**
	 * @author jisu
	 * @return 호스트 공간정보
	 */
	@RequestMapping("space.list")
	public String spaceList(HttpSession session) {
		
		Member loginUser =(Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		
		ArrayList<Space> spaceList = hSpaceService.selectSpaceList(userId);
		session.setAttribute("spaceList", spaceList);
		
		return "host/space/spaceInfoList";
	}
	
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("spaceModifyForm.ho")
	public String spaceModifyForm() {
		return "host/space/spaceModifyForm";
	}
	
	
	/**
	 * @author jisu
	 * @param sp
	 * @param session
	 * @return
	 */
	@RequestMapping("spaceModify.ho")
	public String spaceModify(Space sp, MultipartFile upfile, MultipartFile[] upfiles,SpcNotes sn,HttpSession session,Model model) {
					// 1. 대표 이미지 파일 작업 
					// 전달 된 파일이 있을 경우 => 파일명 수정 작업 후 업로드 
					if(!upfile.getOriginalFilename().equals("")) {
						
						String changeName = saveFile(upfile,session); 
						
						if(changeName != null) {
							sp.setSpcImg(upfile.getOriginalFilename());
							sp.setSpcChimg("resources/upFiles/" + changeName);
						}
					}
			
				// 2. 유의사항 null 체크 및 값 넣어주기 
					ArrayList<SpcNotes>noteList = new ArrayList();
					if(sp.getNoteList() != null) {
						noteList=sp.getNoteList();
					}
				// 3. service 호출
				int result =  hSpaceService.updateSpace(sp,noteList);
				
				// 4. 상세이미지 파일작업
				int imageResult =0;
				SpcImages si = new SpcImages();
				if(upfiles.length > 0) {
				ArrayList changeName = saveFile2(upfiles,session); 
					if(changeName != null) {
						for(int i=0; i<upfiles.length; i++) {
							si.setImgOgImg(upfiles[i].getOriginalFilename());
							si.setImgChImg("resources/upFiles/" + changeName.get(i));
							imageResult = hSpaceService.insertImages(si);
						}
					}
				}
				if(result > 0 && imageResult > 0) {
					session.setAttribute("alertMsg","공간수정이 성공적으로 완료 되었습니다 :)");
					return "host/common/hostMain";
				}else {
					return "common/errorPage";
				}
	}
	
	
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("delete.space")
	public ModelAndView spaceDelete(String spcNo, ModelAndView mv, HttpSession session) {
		
		int result = hSpaceService.deleteSpace(spcNo);
		
		if(result > 0) {
			
			Member loginUser =(Member) session.getAttribute("loginUser");
			
			String userId = loginUser.getUserId();
			
			
			ArrayList<Space> spaceList = hSpaceService.selectSpaceList(userId);
			mv.addObject("spaceList", spaceList).setViewName("host/space/spaceInfoList");
			
		}else {
			mv.addObject("errorMsg", "삭제에 실패했습니다").setViewName("common/errorPage");
			
		}
		return mv;
	}
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("notice.ho")
	public String hostNoticeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = hSpaceService.selectNoticeCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		ArrayList<VoicesNotice> list = hSpaceService.selectList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "host/hostPage/hostNoticePage";
	}
	
	
	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("noticeDetail.ho")
	public String noticeDetailForGuest(int nno, Model model) {
		
		//1.조회수증가
		int result = hSpaceService.increaseCount(nno);
		
		if(result>0) {
			//2.조회성공시
			VoicesNotice vn = hSpaceService.selectNotices(nno);
			model.addAttribute("vn",vn);
			
		}else {
			//2-2.조회실패시
			model.addAttribute("errorMsg","공지사항 조회실패");
		}
		
		return "host/hostPage/hostNoticeDetail";
		
	}
	
	@RequestMapping("searchNotice.ho")
	public String noticeSearchForGuest(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String keyword, Model model) {
		
		//1.게시글개수조회
		int searchListCount = hSpaceService.selectSearchNoticeCount(keyword);
		
		//2.페이지네이션처리(5,5)
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount, 5, 5);
		
		//3.게시글리스트조회
		ArrayList<VoicesNotice> list = hSpaceService.selectSearchNoticeList(keyword, pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		
		return "host/hostPage/hostNoticePage";
		
	}
	
	@RequestMapping("reservation.ho")
	public String spaceReservationList(HttpSession session ,Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		ArrayList<Reservation> list = hSpaceService.spaceReservationList(userId);
		model.addAttribute("list", list);
		
		return "host/space/spaceReservationList";
	}
	
	@RequestMapping("cancle.reservation")
	public String ReservationCancle(HttpSession session, String guestId, String spcName,Model model) {
		
		Member refundUser = (Member) hSpaceService.refundEmail(guestId);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String hostEmail = loginUser.getUserEmail();
		
		String refundEmail = refundUser.getUserEmail();
		String userId = loginUser.getUserId();
		
		Reservation searchReservation = new Reservation();
		
		searchReservation.setUserId(guestId);
		searchReservation.setReSpcName(spcName);
		

		int result = hSpaceService.ReservationCancle(searchReservation);
		
		if(result >0) {
			
			session.setAttribute("alertMsg", "예약이 취소되었습니다!");
			session.setAttribute("checkNum", hSpaceService.mailSend(session, refundEmail, hostEmail));
			return "redirect:reservation.ho";
		
		}else {

			model.addAttribute("errorMsg", "오류가 발생했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("review.ho")
	public String hostReview() {
		
		return "host/space/reviewHostList";
	}
}
