<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="outer">
    	<%@ include file="../../common/menubar.jsp"%>
    	<!-- CSS -->
		<link href="resources/css/admin/adminReportDetail.css" rel="stylesheet" type="text/css">
    	<%@ include file="../sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>신고관리</span>
            </div>

            <!-- 신고상세 -->
            <div id="reportDetailSpace">
                <table id="table_reportInfo1">
                    <tr>
                        <th width="60px">신고번호</th>
                        <td width="70px">${ report.reportNo }</td>
                        <th width="47px">신고자</th>
                        <td width="140px">${ report.reportWriter }</td>
                        <th width="60px">신고유형</th>
                        <td width="90px">${ report.reportType1 }</td>
                        <th width="86px">신고상세유형</th>
                        <td width="140px">${ report.reportType2 }</td>
                        <th width="47px">신고일</th>
                        <td width="100px">${ report.reportDate }</td>
                    </tr>
                </table>
                <table id="table_reportInfo2">
                    <tr>
                        <th width="540px">신고대상</th>
                        <th>처리상태</th>
                    </tr>
                    <tr>
                        <td>
                            <div id="selectUserId">${ report.reportTarget }</div>
                        </td>
                        <td>
                            <select id="select_reportStatus" name="reportStatus" class="custom-select custom-select-sm mb-3" style="margin-top: 14px; width: 130px;">
                                <option value="접수완료">접수완료</option>
                                <option value="처리중">처리중</option>
                                <option value="처리완료">처리완료</option>
                            </select>
                            <!-- 리턴된 신고상태값(접수완료/처리중/처리완료) 담기 -->
                            <input id="hidden_reportStatus" type="hidden" name="reportStatus" value="${report.reportStatus}">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">신고내용</th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="selectReportContent">${ report.reportContent }</div>
                        </td>
                    </tr>
                </table>
                <button class="btn">저장</button>
            </div>
        </div>
    </div>
    <script>
    	$(function(){
    		// 전달받은 신고상태로 고정
    		$("#select_reportStatus").val($("#hidden_reportStatus").val()).attr("selected", "selected");
    		// 저장버튼누를경우
    		$(".btn").click(function(){
    			// 신고번호
    			var reportNo = $("#table_reportInfo1 tr>td").eq(0).text();
    			var reportStatus = $("#select_reportStatus").val();
				// 저장확인팝업
				var question = confirm("저장하시겠습니까?");
				if(question){
					// 저장요청
					$.ajax({
						url: "updateReportStatus.ad",
						data: {
							reportNo:reportNo,
							reportStatus:reportStatus
							}, 
						success: function(result){
							if(result !== "") {
								location.href="reportList.ad"
								alert("저장되었습니다.");	
							}else{
								alert("저장 실패하였습니다.");
							}
						},
						error: function(){
							alert("저장 실패하였습니다.");
						}
					});
				}
    		});
    	});
    </script>
</body>
</html>