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
		<link href="resources/css/admin/adminGuestDetail.css" rel="stylesheet" type="text/css">
    	<%@ include file="../sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>회원관리</span>
            </div>

            <!-- 게스트정보 영역 -->
            <div id="guestInfo">
                <span class="span_infoTitle">게스트정보</span>
                <table id="table_infoDate">
                    <tr>
                        <th>가입일</th>
                        <td>${ member.enrollDate }</td>
                        <th style="padding-left: 10px;">수정일</th>
                        <td>${ member.modifyDate }</td>
                    </tr>
                </table>
                <img id="profile" src="${ member.profilePath }${ member.userProfile }">
                <table id="table_info1">
                    <tr>
                        <th>회원유형</th>
                        <td>${ member.userType }</td>
                    </tr>
                    <tr>
                        <th>활동상태</th>
                        <td>
                        	<input id="hidden_userStatus" type="hidden" name="userStatus" value="${ member.userStatus }">
                            <select id="select_userStatus">
                                <option value="Y">Y</option>
                                <option value="N">N</option>
                                <option value="B">B</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <table id="table_info2">
                    <tr>
                        <th>아이디</th>
                        <td>${ member.userId }</td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>${ member.userPwd }</td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>${ member.userNickname }</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${ member.userEmail }</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${ member.userPhone }</td>
                    </tr>
                </table>
                <textarea id="textarea" cols="53" rows="10" placeholder="회원 메모를 작성해주세요.">${ member.userMemo }</textarea>
            </div>


            <!-- 호스트정보 영역 -->
            <div id="hostInfo">
                <span class="span_infoTitle">호스트정보</span>
                <span id="span_noHost">호스트 정보가 없습니다.</span>  
            </div>
            
            <button id="btn_save" class="btn">저장</button>
            
        </div>
    </div>
    <script>
    	$(function(){
    		
    		// 전달받은 회원상태로 고정
    		$("#select_userStatus").val($("#hidden_userStatus").val()).attr("selected", "selected");
    		
    		// 활동상태, 메모 저장
    		$("#btn_save").click(function(){
    			var userId = $("#table_info2 tr:eq(0)>td").text();	// 회원아이디
    			var userStatus = $("#select_userStatus").val();		// 회원상태
    			var userMemo = $("#textarea").val();				// 회원메모
				// 저장확인팝업
				var question = confirm("저장하시겠습니까?");
				if(question){
					// 저장요청
					$.ajax({
						url: "updateUserInfo.ad",
						data: {
							userId:userId,
							userStatus:userStatus,
							userMemo:userMemo
							}, 
						success: function(result){
							if(result > 0) {
								location.href="memberList.ad";
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