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
                <select id="select_userSearchSelect" name="userSearchSelect" class="custom-select custom-select-sm mb-3">
                    <option value="" selected disabled>선택</option>
                    <option value="userType">회원유형</option>
                    <option value="userId">아이디</option>
                </select>
                <input type="text" id="input_userSearch" class="form-control" name="userSearch">
                <button class="btn" id="btn_userSearch">검색</button>
                <select id="select_userStatus" name="userStatus" class="custom-select custom-select-sm mb-3">
                    <option value="userStatus">Y</option>
                    <option  value="userStatus">N</option>
                </select>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th width="30px">회원번호</th>
                        <th width="30px">회원유형</th>
                        <th width="50px">아이디</th>
                        <th width="50px">이름</th>
                        <th width="20px">이메일</th>
                        <th width="30px">전화번호</th>
                        <th width="45px">가입일</th>
                        <th width="45px">수정일</th>
                        <th width="45px">상태</th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1000</td>
                            <td>Guest</td>
                            <td>userId1userId1</td>
                            <td>박한그루</td>
                            <td>skp0826@naver.com</td>
                            <td>01035635943</td>
                            <td>2020-10-26</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                    </tbody>
                  </table>
                  <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </ul>
            </div>
        </div>
    </div>
</body>
</html>