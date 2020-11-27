package com.kh.hotspot.space.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.space.model.service.HostSpaceService;
import com.kh.hotspot.space.model.vo.Space;
import com.kh.hotspot.space.model.vo.SpcImages;
@Controller
public class HostSpaceContoller {
	
	@Autowired
	private HostSpaceService HostSpaceService;
	
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
	 * @return 공간등록
	 */
	@RequestMapping("insertSpace.ho")
	public String insertSpace(Space sp, MultipartFile upfile, MultipartFile[] upfiles,SpcImages si,HttpSession session) {
	
	// 1. 대표 이미지 파일 작업 
		// 전달 된 파일이 있을 경우 => 파일명 수정 작업 후 업로드 
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session); 
			
			if(changeName != null) {
				sp.setSpcImg(upfile.getOriginalFilename());
				sp.setSpcChimg("resources/upFiles/" + changeName);
			}
		}
	// 2. 상세이미지 파일작업
		if(upfiles.length > 0) {
			ArrayList changeName = saveFile2(upfiles,session); 
			ArrayList<SpcImages> list = new ArrayList();
			if(changeName != null) {
				for(int i=0; i<upfiles.length; i++) {
					si.setImgOgImg(upfiles[i].getOriginalFilename());
					si.setImgChImg("resources/upFiles/" + changeName.get(i));
					list.add(si);
				}
			}
			System.out.println(list);
		}
	
		return "host/space/spaceEnrollForm";
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
		
		
		ArrayList<Space> spaceList = HostSpaceService.selectSpaceList(userId);
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
	public String spaceModify(Space sp, HttpSession session) {
		
		
		return null;
	}
	
	
	
	
	@RequestMapping("delete.space")
	public String spaceDelete(String spcNo, Model m) {
		
		int result = HostSpaceService.deleteSpace(spcNo);
		
		if(result > 0) {
			return "redirect:/host/space/spaceInfoList";
		}else {
			m.addAttribute("alretMsg","삭제에 실패했습니다.");
			
			return "redirect:/host/space/spaceInfoList";
		}
	}
}
