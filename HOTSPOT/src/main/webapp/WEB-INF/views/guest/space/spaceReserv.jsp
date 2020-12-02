<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/guest/spaceReserv.css" type="text/css"/>
<!-- moment js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 메뉴바 -->
    <jsp:include page="../../common/menubar.jsp"/>
    
        <form id="reservWrap">
        <div class="forCenter"><h1>예약하기</h1></div>
        <div id="resInfo">
            <span class="forTitle">공간 예약 정보</span>
            <hr>
            <table class="table table-borderless">
                <tr>
                    <th scope="row">공간명</th>
                    <td>${reserv.reservName }</td>
                </tr>
                <tr>
                    <th scope="row">예약일 및 시간</th>
                    <td>${reserv.useDate } ${reserv.useTime }:00 ~ ${reserv.endDate } ${reserv.endTime }:00 (24시간)</td>
                </tr>
                <tr>
                    <th scope="row">예약 인원</th>
                    <td>${reserv.reservTotal }명</td>
                </tr>    
                <tr>
                    <th scope="row">시간 당 금액</th>
                    <td>${reserv.amountTime }원</td>
                </tr>  
            </table>
        </div>
        <div id="resGuestInfo">
            <span class="forTitle">예약자 정보</span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="smallNotice">예약자 정보로 이메일이 발송됩니다. 이메일을 정확하게 입력해주세요!</span>
            <hr>
            <table class="table table-borderless">
                <tr>
                    <th scope="row">예약자 성명 *</th>
                    <td><input type="text" class="form-control" value="" required></td>
                </tr>
                <tr>
                    <th scope="row">연락처 *</th>
                    <td><input type="tel" class="form-control" value="" required></td>
                </tr>
                <tr>
                    <th scope="row">이메일 *</th>
                    <td><input type="text" class="form-control" value="" required></td>
                </tr>    
                <tr>
                    <th scope="row">사용 목적</th>
                    <td><input type="text" class="form-control" placeholder="목적 혹은 요청사항을 적어주세요"></td>
                </tr>
                <tr>
                    <th scope="row">취소 시 환불받을 계좌</th>
                    <td>
                        <select class="form-control accountNo">
                            <option>은행명</option>
                            <option value="">신한</option>
                        </select>
                        <input type="text" class="form-control accountNo" placeholder="계좌번호를 -제외하고 적어주세요">
                    </td>
                </tr>    
            </table>
        </div>
        <div id="resHostInfo">
            <span class="forTitle">호스트 정보</span>
            <hr>
            <table class="table table-borderless">
                <tr>
                    <th scope="row">상호명</th>
                    <td>경복궁 카페 그리다꿈</td>
                </tr>
                <tr>
                    <th scope="row">사업자 번호</th>
                    <td>202012091520</td>
                </tr>
                <tr>
                    <th scope="row">연락처</th>
                    <td>01033330000 또는 yeok3@gmail.com</td>
                </tr>    
                <tr>
                    <th scope="row">사업장 소재지</th>
                    <td>경복궁역 출구 근처 어딘가</td>
                </tr>    
            </table>
        </div>
        <div id="totalPay">
            <span class="forTitle">결제할 금액</span>
            <hr>
            <span style="font-size: 25px; ">24시간 x ${reserv.reservTotal }명 x ${reserv.amountTime }원 =</span>
            <span class="forRight">1,344,000원</span> 
        </div>
        <div id="methods">
            <span class="forTitle">결제 방법</span>
            <hr>
            <input type="radio" value="신용카드" name="paymentMethod" class="radioChoice" required>
            <label class="forTitle">신용카드</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" value="무통장입금" name="paymentMethod" class="radioChoice" required>
            <label class="forTitle">무통장입금</label>
        </div>
        <div class="forCenter">
            <input type="checkbox" value="agree" required> 위 공간의 예약조건을 확인했으며, 결제 진행에 동의합니다.
        </div>
        <div class="forCenter">
            <button type="submit" class="btn btn-purple">동의 및 결제 진행하기</button>
        </div>
    </form>
    
    
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>