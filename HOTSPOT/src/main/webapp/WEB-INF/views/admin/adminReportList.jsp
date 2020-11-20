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
	<%@ include file="../common/menubar.jsp"%>
        <%@ include file="sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>신고관리</span>
            </div>

            <div id="reportList">
                <select id="select_reportSearchSelect" name="reportSearchSelect" class="custom-select custom-select-sm mb-3">
                    <option selected disabled>선택</option>
                    <option value="reportWriter">신고자</option>
                    <option value="reportTarget">신고대상</option>
                </select>
                <input type="text" id="input_reportSearch" class="form-control" name="reportSearch">
                <button class="btn" id="btn_reportSearch">검색</button>
                <select id="select_reportStatus" name="reportStatus" class="custom-select custom-select-sm mb-3">
                    <option value="reportWriter">접수완료</option>
                    <option  value="reportTarget">처리중</option>
                    <option  value="reportTarget">처리완료</option>
                </select>
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
                  <ul class="pagination pagination-sm">
                  	<c:choose>
                  		<c:when test="${ pageInfo.currentPage eq 1 }">
                  			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li class="page-item"><a class="page-link" href="reportList.ad?currentPage=${ pageInfo.currentPage-1 }">Previous</a></li>
                  		</c:otherwise>
                  	</c:choose>
                  	
                  	<c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
	                    <li class="page-item">
	                    <a class="page-link" href="reportList.ad?currentPage=${ page }">${ page }</a>
	                    </li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="reportList.ad?currentPage=${ pageInfo.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                  </ul>
            </div>
        </div>
    </div>
</body>
</html>