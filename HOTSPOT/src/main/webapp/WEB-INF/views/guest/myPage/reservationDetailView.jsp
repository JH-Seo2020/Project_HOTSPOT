<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
	    position: absolute;
	    top: 30%;
	    left: 20%;
	    margin: 100px;
	    margin-left: -110px;
	    margin-top: -80px;
	    padding: 50px;
	    width: 80%;
	}
	.reservTitle{
	    font-weight: bold;
	    font-size: 20px;
	}
	#cancelReserve{
	    width: 150px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	    float:right
	}
</style>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>


    <div id="content">
        <div id="reservation_Detail">
            <br>
            <h2 align="center"><b>예약 상세내역</b></h2>
            <br><br>
            <div>
                <span class="reservTitle">공간 예약정보</span> &nbsp;&nbsp;
                <span class="badge badge-pill badge-warning" style="background: #ffe714; width: 70px;">예약확정</span>

            </div>
            <hr>
            <div id="reserveTable">
                <div id="guestTable">
                    <table  class="table table-bordered table-sm">
                        <tbody>
                        <tr>
                            <th>공간명</th>
                            <td>그리다꿈</td>
                        </tr>
                        <tr>
                            <th>사용목적</th>
                            <td>파티룸</td>
                        </tr>
                        <tr>
                            <th>예약신청 날짜 및 시간</th>
                            <td>2020.10.30 16:00 - 2020.10.31 16:00</td>
                        </tr>
                        <tr>
                            <th>예약한 총 시간</th>
                            <td>24시간</td>
                        </tr>
                        <tr>
                            <th>예약인원</th>
                            <td>8명</td>
                        </tr>
                        <tr>
                            <th>시간당 금액</th>
                            <td>7,000원</td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <td>무통장입금</td>
                        </tr>
                        <tr>
                            <th style="color: rgb(122, 27, 216)">총 결제금액</th>
                            <td >총시간 X 인원수 X 시간당 금액 = 1000000원</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <br><br>
                <div>
                    <span class="reservTitle">호스트 정보</span> &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <hr>
                <div id="hostTable">
                    <table  class="table table-bordered table-sm">
                        <tbody>
                        <tr>
                            <th scope="row">상호명</th>
                            <td>아무개상가</td>
                        </tr>
                        <tr>
                            <th scope="row">사업자번호</th>
                            <td>123456789</td>
                        </tr>
                        <tr>
                            <th scope="row">연락처</th>
                            <td>010-0000-1111 / yeoc3@gmail.com</td>
                        </tr>
                        <tr>
                            <th scope="row">사업장 소재지</th>
                            <td>경복궁역 출구 근처</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <button type="button" id="cancelReserve">예약 취소하기</button>
            <!-- 이용완료시 신고버튼이 보여짐 -->
        </div>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>