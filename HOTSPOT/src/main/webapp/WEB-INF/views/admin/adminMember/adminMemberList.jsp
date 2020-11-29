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
		<link href="resources/css/admin/adminMemberList.css" rel="stylesheet" type="text/css">
    	<%@ include file="../sidebarSunkyung.jsp"%>
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
	                            <c:choose>
	                            	<c:when test="${ mem.hostStatus eq 'W' }">
	                            		<td style="padding-left: 3px;">
                               				<img id="img_newIcon" src="resources/images/admin/newIcon.png" style="float: left; margin-right: -5px;">
                                			${ mem.userId }
                                			<input id="hidden_userId" type="hidden" name="userId" value="${mem.userId}">
                            			</td>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<td>${ mem.userId }</td>
	                            	</c:otherwise>
	                            </c:choose>
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
			$(".table tbody>tr").click(function(){
				// 회원아이디 넘기면서 상세화면 요청
				/* var userId = $(this).children().eq(1).text(); */
				var userId = $("#hidden_userId").val();
				$.ajax({
					url: "guestDetail.ad",
					data: {
						userId:userId
						}, 
					success: function(hostStatus){
						if(hostStatus == 'W'){
							// 호스트신청한 게스트인경우
							location.href="hostRequest.ad?userId=" + userId;
						}else if(hostStatus == 'Y'){
							// 호스트인경우
							location.href="hostInfo.ad?userId=" + userId;
						}else{
							// 게스트인경우
							location.href="guestInfo.ad?userId=" + userId;
						}
					},
					error: function(){
						alert("조회 실패하였습니다.");
					}
				});
			})
		});
    </script>
</body>
</html>