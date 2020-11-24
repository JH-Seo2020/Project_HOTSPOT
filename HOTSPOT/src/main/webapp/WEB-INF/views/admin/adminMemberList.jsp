<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="resources/css/admin/adminUserList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="outer">
	<%@ include file="../common/menubar.jsp"%>
    	<%@ include file="sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>회원관리</span>
            </div>
            <div id="userList">
                <select id="select_userSearchSelect" name="searchType" class="custom-select custom-select-sm mb-3">
                    <option value="" selected disabled>선택</option>
                    <option value="userType">회원유형</option>
                    <option value="userId">아이디</option>
                </select>
                <input type="text" id="input_userSearch" class="form-control" name="searchText">
                <button class="btn" id="btn_userSearch">검색</button>
                <select id="select_userStatus" name="userStatus" class="custom-select custom-select-sm mb-3">
                    <option id="userStatusY" value="Y">Y</option>
                    <option id="userStatusN" value="N">N</option>
                </select>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th width="30px">회원유형</th>
                        <th width="50px">아이디</th>
                        <th width="50px">닉네임</th>
                        <th width="20px">이메일</th>
                        <th width="30px">전화번호</th>
                        <th width="45px">가입일</th>
                        <th width="45px">수정일</th>
                        <th width="45px">상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="mem" items="${ list }">
							<tr>
	                            <td>${ mem.userType }</td>
	                            <td>${ mem.userId }</td>
	                            <td>${ mem.userNickname }</td>
	                            <td>${ mem.userEmail }</td>
	                            <td>${ mem.userPhone }</td>
	                            <td>${ mem.enrollDate }</td>
	                            <td>${ mem.modifyDate }</td>
	                            <td>${ mem.userStatus }</td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                  </table>
                  <ul class="pagination pagination-sm">
                  	<c:choose>
                  		<c:when test="${ pageInfo.currentPage eq 1 }">
                  			<li class="page-item disabled"><a class="page-link">Previous</a></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li class="page-item"><a class="page-link" href="memberList.ad?currentPage=${ pageInfo.currentPage-1 }">Previous</a></li>
                  		</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
                    	<li class="page-item">
                    		<a class="page-link" href="memberList.ad?currentPage=${ page }">${ page }</a>
                    	</li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
                    		<li class="page-item disabled"><a class="page-link">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="memberList.ad?currentPage=${ pageInfo.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                  </ul>
            </div>
        </div>
    </div>
    <script>
		$(function(){
			$("#btn_userSearch").click(function(){
				var searchType = $("#select_userSearchSelect").val();				// '회원유형'/'아이디'
				var searchText = $("#input_userSearch").val();						// '검색어'
				location.href="memberSearchresult.ad?searchType=" + searchType + "&searchText=" + searchText;
			});
		});
    </script>
</body>
</html>