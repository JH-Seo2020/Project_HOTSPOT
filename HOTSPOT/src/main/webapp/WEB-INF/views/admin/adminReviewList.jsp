<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="resources/css/admin/adminReviewList.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="outer">
    <%@ include file="../common/menubar.jsp"%>
    	<%@ include file="sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>후기관리</span>
            </div>

            <div id="reviewList">
                <select id="select_reviewSearchSelect" name="reviewSearchSelect" class="custom-select custom-select-sm mb-3">
                    <option selected disabled>선택</option>
                    <option value="reviewWriter">작성자</option>
                    <option value="spcNo">공간번호</option>
                </select>
                <input type="text" id="input_reviewSearch" class="form-control" name="reviewSearch">
                <button class="btn" id="btn_reviewSearch">검색</button>
                <select id="select_reviewStatus" name="reviewStatus" class="custom-select custom-select-sm mb-3">
                    <option value="reviewStatus">Y</option>
                    <option  value="reviewStatus">N</option>
                </select>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th width="30px">후기번호</th>
                        <th width="30px">공간번호</th>
                        <th width="70px">작성자</th>
                        <th width="200px">제목</th>
                        <th width="20px">별점</th>
                        <th width="70px">작성일</th>
                        <th width="45px">후기상태</th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1000</td>
                            <td>1000</td>
                            <td>userId1userId1</td>
                            <td>제목이구요 제목이라서 제목입니다.</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>★★★★★</td>
                            <td>2020-10-26</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>userId1</td>
                            <td>userId1</td> 
                            <td>★★★★★</td>
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