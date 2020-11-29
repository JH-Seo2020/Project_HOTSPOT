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
		<link href="resources/css/admin/adminHostDetail.css" rel="stylesheet" type="text/css">
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
                        <td>2020-11-11</td>
                        <th style="padding-left: 10px;">수정일</th>
                        <td>2020-11-11</td>
                    </tr>
                </table>
                <div id="profile">
                    프로필이미지
                </div>
                <table id="table_info1">
                    <tr>
                        <th>회원유형</th>
                        <td>Guest</td>
                    </tr>
                    <tr>
                        <th>활동상태</th>
                        <td>
                            <select>
                                <option>Y</option>
                                <option>N</option>
                                <option>B</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <table id="table_info2">
                    <tr>
                        <th>아이디</th>
                        <td>userId01</td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>userPass01</td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>userNickname01</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>userEmail01@gmail.com</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>010-3563-5943</td>
                    </tr>
                </table>
                <textarea id="textarea" cols="53" rows="10" placeholder="회원 메모를 작성해주세요."></textarea>
            </div>


            <!-- 호스트정보 영역 -->
            <div id="hostInfo">
                <span class="span_infoTitle">호스트정보</span>
                <table id="tab_hostInfo">
                    <tr height="35px">
                        <th width="100px">사업자번호</th>
                        <td>111111111111111111111111111111</td>
                    </tr>
                    <tr height="35px">
                        <th>상호명</th>
                        <td>홍콩반점</td>
                    </tr>
                    <tr height="35px">
                        <th>주소</th>
                        <td>부영로 165 114동 </td>
                    </tr>
                    <tr height="35px">
                        <th>계좌정보</th>
                        <td>은행명/계좌번호/예금주</td>
                    </tr>
                    <tr height="30px">
                        <th>사업자등록증</th>
                        <td>파일명</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="" download="">다운로드</a></td>
                    </tr>
                </table>
            </div>


            <button class="btn">저장</button>
        </div>
    </div>
</body>
</html>