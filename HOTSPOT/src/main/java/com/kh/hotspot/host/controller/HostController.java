package com.kh.hotspot.host.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.host.model.service.HostService;
import com.kh.hotspot.host.model.vo.Calculation;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.host.model.vo.Inquiry;
import com.kh.hotspot.host.model.vo.Qna;
import com.kh.hotspot.space.model.vo.Space;

@Controller
public class HostController {
	@Autowired 
	private HostService hService;
	
	/**
	 * @author jieun
	 * @return 호스트메인페이지
	 */
	@RequestMapping("hostMain.ho")
	public String hostMain(Member m,HttpSession session) {
		
		Member loginUser =(Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		HostInfo hi =  hService.selectHost(userId);
		if(hi != null) {
			session.setAttribute("hostInfo", hi );
			return "host/common/hostMain";
		}
		return "host/common/hostMain";
	}
	/**
	 * @author jieun
	 * @return 호스트등록페이지
	 */
	@RequestMapping("hostEnrollForm.ho")
	public String hostEnrollForm() {
		return "host/hostPage/hostEnrollForm";
	}
	/**
	 * @author jieun
	 * @return 호스트등록
	 */
	@RequestMapping("insertHost.ho")
	public String hostEnroll(HttpSession session,HostInfo hi,MultipartFile upfile, ModelAndView mv) {
		
		// 1. 파일 작업 
		// 전달 된 파일이 있을 경우 => 파일명 수정 작업 후 업로드 
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session); 
			
			if(changeName != null) {
				hi.setBusinessLicense(upfile.getOriginalFilename());
				hi.setLicensePath("resources/upFiles/" + changeName);
			}
		}
					
		//2. 서비스 호출 
		int result = hService.insertHost(hi);
		
		//3. 결과
		if(result > 0) {
			session.setAttribute("alertMsg", "호스트등록이 완료 되었습니다. 승인여부는(1~2일 소요) 이메일로 안내드리겠습니다 ");
			return "redirect:hostMain.ho";
			
		}else { // 실패 할 경우 
			return "common/errorPage";
		}
		
	}
	/**
	 * @author jieun
	 * @param upfile
	 * @param session
	 * @return 파일 저장 및 이름 변경 메소드
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		// 저장시킬 폴더의 물리적인 경로 
		String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return changeName;
	}
	/**
	 * @author jieun
	 * @param session
	 * @param h
	 * @return 호스트 정산 페이지
	 */
	
	@RequestMapping("hostCalculateForm.ho")
	public String hostCalculateForm(HttpSession session, Model model) {
		//1. userId 뽑기 
		HostInfo hi = (HostInfo) session.getAttribute("hostInfo");
		String userId = hi.getUserId();
		//2.  hService 전달 
		ArrayList<Space> space = hService.selectSpaceList(userId);
		//3. 결과의 따른 화면 
		if(space != null) {
			session.setAttribute("space",space);
			return "host/hostPage/hostCalculateForm";
		}else {
			return "common/errorPage";
		}
		
	}
	/**
	 * @author jieun
	 * @param session
	 * @param h
	 * @return 호스트 정산 
	 */
	
	@RequestMapping("selectCalculate.ho")
	public String hostCalculate(Calculation cal, HttpSession session, Model model) {
		//1. 전달값 확인
		if(cal != null) {
			String spcName = cal.getSpcName();
			model.addAttribute("spcName", spcName);
			String reservDate = cal.getReservDate().replace(",", "");
			String month = reservDate.substring(4);
			String year = reservDate.substring(0,4);
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			String date = cal.getReservDate().replace(",","년 ");
			model.addAttribute("date", date);
			cal.setReservDate(reservDate);
			
			if(spcName.equals("전체 공간 선택")) {
			
				ArrayList<Calculation> list = hService.selectCalAll(cal);
				
				if(list != null) {
					model.addAttribute("list",list);
					return "host/hostPage/hostCalculateForm";
				}
			} else { // 전제공간 선택이 아닐경우
				ArrayList<Calculation> list = hService.selectCalList(cal);
				if(list != null) {
					model.addAttribute("list",list);
					return "host/hostPage/hostCalculateForm";
				}
			}
			
		}else { // 넘어온 전달 값이 없을 경우 
			return "common/errorPage";
		}
		return "common/errorPage";
	}
	/**
	 * @author jieun
	 * @param response
	 * @param cal
	 * @throws Exception
	 *	정산내역 엑셀파일 다운로드 기능
	 */
	@RequestMapping("exceldown.ho")
	public void excelDown(HttpServletResponse response, Calculation cal) throws Exception {

	    // 정산 목록조회
		String userId = cal.getUserId();
		String reservDate = cal.getReservDate().replace(",", "");
		cal.setReservDate(reservDate);

		ArrayList<Calculation> list = hService.selectCalAll(cal);
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    org.apache.poi.ss.usermodel.Sheet sheet = wb.createSheet("정산내역");
	    
	   // 특정 서식 지정 (가격, 날짜타입)
	    CellStyle cellStyle = wb.createCellStyle();
	    CellStyle dataStyle = wb.createCellStyle();
	    DataFormat format = wb.createDataFormat();
	    dataStyle.setDataFormat(format.getFormat("#,##0"));
	    CreationHelper createHelper = wb.getCreationHelper();
	    cellStyle.setDataFormat(
	    createHelper.createDataFormat().getFormat("yyyy-mm-dd"));
	    
	    // 셀 너비 지정
	    sheet.setColumnWidth(0, 11*256);
	    sheet.setColumnWidth(1, 20*256);
	    sheet.setColumnWidth(2, 15*256);
	    sheet.setColumnWidth(3, 14*256);
	    sheet.setColumnWidth(4, 14*256);
	    sheet.setColumnWidth(5, 14*256);
	    sheet.setColumnWidth(6, 14*256);
	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;
	    int rowCount =0;
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    CellStyle footStyle = wb.createCellStyle();
	  
	    // 가는 경계선을 가집니다.
	    cellStyle.setBorderTop(BorderStyle.THIN);
	    cellStyle.setBorderBottom(BorderStyle.THIN);
	    cellStyle.setBorderLeft(BorderStyle.THIN);
	    cellStyle.setBorderRight(BorderStyle.THIN);
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    footStyle.setBorderTop(BorderStyle.THIN);
	    footStyle.setBorderBottom(BorderStyle.THIN);
	    footStyle.setBorderLeft(BorderStyle.THIN);
	    footStyle.setBorderRight(BorderStyle.THIN);
	    dataStyle.setBorderTop(BorderStyle.THIN);
	    dataStyle.setBorderBottom(BorderStyle.THIN);
	    dataStyle.setBorderLeft(BorderStyle.THIN);
	    dataStyle.setBorderRight(BorderStyle.THIN);
	    // 스타일 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	   
	    footStyle.setFillForegroundColor(HSSFColorPredefined.LAVENDER.getIndex());
	    footStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    footStyle.setDataFormat(format.getFormat("#,##0"));

	    //가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    footStyle.setAlignment(HorizontalAlignment.CENTER);
	    cellStyle.setAlignment(HorizontalAlignment.CENTER);
	    dataStyle.setAlignment(HorizontalAlignment.CENTER);
	    // 데이터용 경계 스타일 테두리만 지정

	    CellStyle bodyStyle = wb.createCellStyle();
	    
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 타이틀 
	    rowCount++;
	    
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue(reservDate+"월");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("핫스팟 정산내역 보고서 ");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("호스트 아이디: ");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue(cal.getUserId());
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("");
	   

	    // 헤더 생성

	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("결제번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("공간명");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("거래일자");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("총금액");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수수료");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("정산금액");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("승인");

	    // 데이터 부분 생성
	    int paySum =0;
	    int fees = 0;
	    int calcul = 0;
	    int CpaySum = 0;
	    int Cfees = 0;
	    int Ccalcul =0;
	    int success = 0;
	    for(Calculation c : list) {
	 
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(c.getReservNo());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(c.getSpcName());
	        cell = row.createCell(2);
	        cell.setCellStyle(cellStyle);
	        cell.setCellValue(c.getPayDate());
	        cell = row.createCell(3);
	        cell.setCellStyle(dataStyle);
	        cell.setCellValue(c.getPaySum()+"원");
	        cell = row.createCell(4);
	        cell.setCellStyle(dataStyle);
	        cell.setCellValue(c.getPaySum()/10+"원");
	        cell = row.createCell(5);
	        cell.setCellStyle(dataStyle);
	        cell.setCellValue(c.getPaySum()-(c.getPaySum()/10)+"원");
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(c.getReservStatus());
	        
	        paySum += c.getPaySum();
	        fees += c.getPaySum()/10;
	        calcul +=  paySum -c.getPaySum()/10;
	        if(c.getReservStatus().equals("이용완료")) {
	        	success ++;
	        }
	        if(c.getReservStatus().equals("취소환불")) {
	        	CpaySum += c.getPaySum();
	        	Cfees += c.getPaySum()/10;
	        	Ccalcul += CpaySum -c.getPaySum()/10;
	        }
	    }
	    row = sheet.createRow(rowNo++);
		   
	    cell = row.createCell(2);

	    cell.setCellStyle(footStyle);

	    cell.setCellValue("총계 ");
	    
	    cell = row.createCell(3);

	    cell.setCellStyle(footStyle);

	    cell.setCellValue(paySum-CpaySum+"원");
	    
	    cell = row.createCell(4);

	    cell.setCellStyle(footStyle);

	    cell.setCellValue(fees-Cfees+"원");
	    
	    cell = row.createCell(5);

	    cell.setCellStyle(footStyle);

	    cell.setCellValue(paySum-CpaySum-fees-Cfees+"원");
	    cell = row.createCell(6);

	    cell.setCellStyle(footStyle);

	    cell.setCellValue("결제완료 총"+success+"건");
	    
	  
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=calculate.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	
	}
	/**
	 * @author jieun
	 * @return 
	 */
	@RequestMapping("hostInquiryForm.ho")
	public String hostInquiryForm() {
		
		return "host/hostPage/hostInquiryForm";
	}

	/**
	 * @author jieun
	 * @param session
	 * @param currentPage 
	 * @param loginUser 
	 * @param h
	 * @return 호스트 1:1문의 리스트 조회
	 */
	@RequestMapping("hostInquiry.ho")
	public String selectInquiry(@RequestParam(value="currentPage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		// 현재 로그인 되어있는 userId 값 가져오기  
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
	    int listCount = hService.selectInquiryCount(userId);
		
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2, 4);
		 ArrayList<Inquiry> list = hService.selectInquiry(pi,userId);
		 if(list != null) {
			 model.addAttribute("list", list);
			 model.addAttribute("pi", pi);
			 return "host/hostPage/hostInquiry";
		 }else {
			 return "common/errorPage";
		 }
	}
	
	/**
	 * @author jieun
	 * @param session
	 * @param currentPage 
	 * @param listCount 
	 * @param h
	 * @return 호스트1:1문의 작성
	 */
	@RequestMapping("insertInquiry.ho")
	public String insertInquiry(Inquiry inq,HttpSession session, Model model) {
		
		int result = hService.insertInquiry(inq);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "1:1문의 작성이 완료 되었습니다.");
			return "host/hostPage/hostInquiry";
		}else {
			session.setAttribute("alertMsg", "1:1문의 작성이 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteInquiry.ho")
	public String insertInquiry(HttpSession session, Model model, int inquiryNo) {
		
		int result = hService.deleteInquiry(inquiryNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg","1:1문의 삭제가 완료 되었습니다.");
			return "host/hostPage/hostInquiry";
		}else {
			session.setAttribute("alertMsg", "1:1문의 삭제가 실패하였습니다.");
			return "common/errorPage";
		}
	
		
	}
	
	/**
	 * @author jieun
	 * @param session
	 * @param h
	 * @return 호스트 qna 페이지
	 */
	@RequestMapping("hostQnaForm.ho")
	public String hostQnaForm(HttpSession session, Model model) {
		//1. userId 뽑기 
		HostInfo hi = (HostInfo) session.getAttribute("hostInfo");
		String userId = hi.getUserId();
		//2.  hService 전달 
		ArrayList<Space> space = hService.selectSpaceList(userId);
		//3. 결과의 따른 화면 
		if(space != null) {
			session.setAttribute("space",space);
			return "host/hostPage/hostQna";
		}else {
			return "common/errorPage";
		}
		
	}
	/**
	 * @author jieun
	 * @param spcNo
	 * @return qna 리스트 조회
	 */
	@RequestMapping("selectQnaList.ho")
	public String hostQnaList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, String spcName, Model model) {

		int listCount = hService.selectQnaListCount(spcName);
		PageInfo pi = Pagination.getPageInfo (currentPage,listCount, 2,4);
		ArrayList<Qna> list = hService.selectQnaList(pi,spcName);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
	
		return "host/hostPage/hostQna";
	}
	/**
	 * @author jieun
	 * @param q
	 * @return QnA 답글 저장
	 */
	@ResponseBody
	@RequestMapping("insertQnaAnswer.ho")
	public String insertQna(Qna q) {
		// ajax요청 
		int result=hService.insertQna(q); 
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	/**
	 * @author jieun
	 * @param q
	 * @return QnA 답글 삭제
	 */
	@ResponseBody
	@RequestMapping("deleteQnaAnswer.ho")
	public String deleteQna(Qna q) {
		// ajax요청 
		int result=hService.deleteQna(q); 
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	/**
	 * @author jieun
	 * @param currentPage
	 * @param spcNo
	 * @param model
	 * @return QnA 답변여부 정렬
	 */
	@RequestMapping("qnaAnswerComplete.ho")
	public String selectAnswerComplete(@RequestParam(value="currentPage", defaultValue="1")int currentPage, String spcName, Model model) {
		int listCount = hService.selectQnaListCount(spcName);
		PageInfo pi = Pagination.getPageInfo (currentPage,listCount, 2,4);
		ArrayList<Qna> list = hService.selectAnswerComplete(pi,spcName);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
	
		return "host/hostPage/hostQna";
	}
	/**
	 * @author jieun
	 * @param currentPage
	 * @param spcNo
	 * @param model
	 * @return QnA 답변여부 정렬
	 */
	@RequestMapping("qnaAnswerIncomplete.ho")
	public String selectAnswerWhether(@RequestParam(value="currentPage", defaultValue="1")int currentPage, String spcName, Model model) {
		int listCount = hService.selectQnaListCount(spcName);
		PageInfo pi = Pagination.getPageInfo (currentPage,listCount, 2,4);
		ArrayList<Qna> list = hService.selectAnswerInComplete(pi,spcName);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
	
		return "host/hostPage/hostQna";
		
	}
	

	/**
	 * @author jisu
	 * @return
	 */
	@RequestMapping("hostMyPage.ho")
	public String hostMyPage(HttpSession session) {
		HostInfo hi = (HostInfo) session.getAttribute("hostInfo");
			if(hi == null) {
				
				session.setAttribute("alertMsg", "호스트 등록이 필요한 페이지입니다. ");
				return "host/common/hostMain";
			}else {
			return "host/hostPage/hostMyPage";
			}
	}
	/**
	 * @author jius
	 * @return
	 */
	@RequestMapping("modify.ho")
	public String modifyHost() {
		
		return "host/hostPage/hostMyPageModify";
	}
	
	/**
	 * @author jisu
	 * @param session
	 * @param hi
	 * @param upfile
	 * @return
	 */
	@RequestMapping("updateHost.ho")
	public String updateHost(HttpSession session,HostInfo hi,MultipartFile upfile) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session); // 공통으로 쓰이게끔 뺀 메소드 호출만으로 끝
			
			if(changeName != null) {
				hi.setBusinessLicense(upfile.getOriginalFilename());
				hi.setLicensePath("resources/upFiles/" + changeName);
			}
		}
		
		
		int result = hService.updateHost(hi);
		
		return "host/hostPage/hostMyPage";
	}
	
	@RequestMapping("review.host")
	public String selectMyReviewList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, HttpSession session, Model model, String userId) {
		
		if(userId == null) {
			// 맨 처음 페이지 들어올때
			Member loginUser = (Member)session.getAttribute("loginUser");
			userId = loginUser.getUserId();
		}
		int listCount = hService.selectMyReviewListCount(userId);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);

		ArrayList<Review> rvList = hService.selectMyReviewList(pi, userId);
		
		model.addAttribute("pi", pi);
		session.setAttribute("rvList", rvList);
		
		return "host/space/reviewHostList";
	}
}
