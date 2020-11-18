<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- CSS -->
<link href="../../resources/css/admin/adminReportList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="outer">
        <div id="leftSpace">
            <div id="logo">
                <img id="img_hotspotLogo" src="resources/hotspotLogo.png">
                <span id="span_name">관리자페이지</span>
            </div>
            <ul>
                <li>
                    <img class="img_icon" src="resources/userIcon.png">
                    <span>회원관리</span>
                </li>
                <li>
                    <img class="img_icon" src="resources/reportIcon.png">   
                    <span>신고관리</span>
                </li>
                <li>
                    <img class="img_icon" src="resources/reviewIcon.png">
                    <span>후기관리</span>
                </li>
                <li id="adminSpace">
                    <img class="img_icon" src="resources/spaceIcon.png">
                    <span>공간관리</span>
                    <ul style="display:none; padding: 0px;" id="subAdminSpace">
                        <li style="padding: 5px; margin-left: 68px;"><a href="">공간관리</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">예약관리</a></li>
                    </ul>
                </li>
                <li id="adminFaq">
                    <img class="img_icon" src="resources/faqIcon.png">
                    <span>고객센터</span>
                    <ul style="display:none; padding: 0px;" id="subAdminFaq">
                        <li style="padding: 5px; margin-left: 68px;"><a href="">공지사항</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">예약관리</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <script>
            $(function(){
                    $("#adminSpace").click(function(){
                        $("#subAdminSpace").toggle();
                    })
                    $("#adminFaq").click(function(){
                        $("#subAdminFaq").toggle();
                    })
                         
            })
        </script>
        <div id="rightSpace">
            <div id="categoryName">
                <span>신고관리</span>
            </div>

            <div id="reportList">
                <select id="select_reportSearchSelect" name="reportSearchSelect" class="custom-select custom-select-sm mb-3">
                    <option value="reportWriter">선택</option>
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
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>게스트신고</td>
                            <td>서비스불만족</td>
                            <td>userId1</td>
                            <td>userId1</td>
                            <td>가나다라를신고합니다</td>
                            <td>2020-10-26</td>
                            <td>접수완료</td>
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