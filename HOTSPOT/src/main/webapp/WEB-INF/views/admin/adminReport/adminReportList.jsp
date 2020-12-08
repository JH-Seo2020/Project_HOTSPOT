<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="resources/css/admin/adminReportList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="outer">
		<%@ include file="../../common/menubar.jsp"%>
        <%@ include file="../sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>신고관리</span>
            </div>

            <div id="reportList">
				<form action="" method="post" id="form_reportStatus">
					<select id="select_reportStatus" name="reportStatus" class="custom-select custom-select-sm mb-3">
						<option value="접수완료">접수완료</option>
						<option value="처리중">처리중</option>
						<option value="처리완료">처리완료</option>
					</select>
				</form>
				<!-- 리턴된 신고상태값(접수완료/처리중/처리완료) 담기 -->
				<input id="hidden_reportStatus" type="hidden" name="reportStatus" value="${reportStatus}">
				
				<form action="" method="post" id="form_reportList">
	                <table class="table table-hover">
	                    <thead>
	                      <tr>
	                        <th style="width: 70px;">신고번호</th>
	                        <th style="width: 85px;">신고유형</th>
	                        <th style="width: 90px;">신고상세유형</th>
	                        <th style="width: 100px;">신고자</th>
	                        <th style="width: 100px;">신고대상</th>
	                        <th style="width: 300px;">신고내용</th>
	                        <th style="width: 90px;">신고일</th>
	                        <th style="width: 70px;">처리상태</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach var="re" items="${list}">
		                        <tr>
		                            <td>${ re.reportNo }</td>
		                            <td>${ re.reportType1 }</td>
		                            <td>${ re.reportType2 }</td>
		                            <td>${ re.reportWriter }</td>
		                            <td>${ re.reportTarget }</td>
		                            <td>${ re.reportContent }</td>
		                            <td>${ re.reportDate }</td>
		                            <td>${ re.reportStatus }</td>
		                        </tr>
	                        </c:forEach>
	                    </tbody>
	                  </table>
	                  <!-- 리턴된 신고번호 담기 -->
	                  <input id="hidden_reportNo" type="hidden" name="reportNo" value="">
                  </form>
                  <ul class="pagination pagination-sm">
                  	<c:choose>
                  		<c:when test="${ pageInfo.currentPage eq 1 }">
                  			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li class="page-item"><a class="page-link" href="reportList.ad?currentPage=${ pageInfo.currentPage-1 }&reportStatus=${reportStatus}">Previous</a></li>
                  		</c:otherwise>
                  	</c:choose>
                  	
                  	<c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
	                    <li class="page-item">
	                    <a class="page-link" href="reportList.ad?currentPage=${ page }&reportStatus=${reportStatus}">${ page }</a>
	                    </li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="reportList.ad?currentPage=${ pageInfo.currentPage+1 }&reportStatus=${reportStatus}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                  </ul>
            </div>
        </div>
    </div>
    <script>
    	$(function(){
    		
    		// 셀렉스박스가 변경될때마다
    		$("#select_reportStatus").change(function(){
    			// 선택한 신고상태기준으로 정렬요청
    			$("#form_reportStatus").attr("action", "reportList.ad").submit();
    		});
    		
    		// 선택한 신고상태로 고정
    		$("#select_reportStatus").val($("#hidden_reportStatus").val()).attr("selected", "selected");
    		
    		// 리스트에서 행 클릭시
    		$(".table tbody>tr").click(function(){
    			// 신고번호 넘기면서 상세화면요청
    			var tdText = $(this).children().eq(0).text();
    			$("#hidden_reportNo").attr("value", tdText);
    			$("#form_reportList").attr("action", "reportDetail.ad").submit();
    		});
    		
    	});
    </script>
</body>
</html>