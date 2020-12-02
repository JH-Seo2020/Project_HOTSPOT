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
	    left: 20%;
	    margin: auto;
	    margin-bottom: 120px;
	    padding: 50px;
	    width: 80%;
	}
	.reservTitle{
	    font-weight: bold;
	    font-size: 20px;
	}
	.reserveBtn{
	    width: 150px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	    float:right
	}
	#reserveAlert{
	    position: relative;
	    background: rgb(243, 243, 243);
	    padding: 15px;
	    margin: 30%;
	    margin-left: 40%;
	    width: 400px;
	}
	.submitBtn{
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	#reportEnrollForm{
	    border-collapse: separate;
	    border-spacing: 0 10px;
	}
	#statusRable{
	background: #ffe714;
	text-align: center;
	width: 90px; 
	height: 25px; 
	font-size: 15px; 
	border-radius: 30px;
	}
	#guestTable tr th{color: rgb(122, 27, 216)}
	#hostTable tr th{color: rgb(122, 27, 216)}
	#cancelModal #reserveAlert{margin-left: 10%}
 </style>
</head>
<body>
	 <jsp:include page="../../common/menubar.jsp"/>


    <div id="content">
        <div id="reservation_Detail">
        	<input type="hidden" name="userId" value="${ loginUser.userId }">
        	<input type="hidden" name="reservNo" value="${ list.reservNo }">
            <br>
            <h2 align="center"><b>예약 상세내역</b></h2>
            <br><br>
            <div>
                <label class="reservTitle">공간 예약정보</label> &nbsp;&nbsp;
                <label id="statusRable">${ r.reservStatus }</label>
            </div>
            <hr>
            <div id="reserveTable">
                <div id="guestTable">
                    <table  class="table table-bordered table-sm">
                        <tbody>
                        <tr>
                            <th>공간명</th>
                            <td>${ r.reSpcName }</td>
                        </tr>
                        <tr>
                            <th>사용목적</th>
                            <td>${ r.perpose }</td>
                        </tr>
                        <tr>
                            <th>예약날짜 및 시간</th>
                            <td>${ r.useDate } ${ r.useTime } - ${ r.endDate } ${ r.endTime }</td>
                        </tr>
                        <tr>
                            <th>예약한 총 시간</th>
                            <td>${ r.totalTime }시간</td>
                        </tr>
                        <tr>
                            <th>예약인원</th>
                            <td>${ r.reservTotal }명</td>
                        </tr>
                        <tr>
                            <th>시간당 금액</th>
                            <td>${ r.reSpcPrice}원</td>
                        </tr>
	                        <c:choose>
		                        <c:when test="${ r.reservStatus eq '이용완료' && r.reservStatus eq '취소환불' }">
			                        <tr>
			                        	<th>결제방법 및 결제날짜</th>
			                            <td>${ r.payMethod }</td>
			                        </tr>
			                        </c:when>
			                        <c:otherwise>
	
			                        </c:otherwise>
	                        </c:choose>
                        <tr>
                            <th>총 결제금액</th>
                            <td>${ r.paySum }원</td>
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
                            <td>${ r.hoName }</td>
                        </tr>
                        <tr>
                            <th scope="row">사업자번호</th>
                            <td>${ r.hoNo }</td>
                        </tr>
                        <tr>
                            <th scope="row">연락처</th>
                            <td>핸드폰 : ${ r.hoPhone } / 이메일 : ${ r.hoEmail }</td>
                        </tr>
                        <tr>
                            <th scope="row">사업장 소재지</th>
                            <td>${ r.hoLoc }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <c:choose>
            	<c:when test="${ r.reservStatus eq '예약확정' }">
	            	<button type="button" class="reserveBtn" class="btn btn-primary" data-toggle="modal" data-target="#cancelModal">예약 취소하기</button>
	            </c:when>
	            <c:when test="${ r.reservStatus eq '이용완료' }">
	            	<button type="button" class="reserveBtn" onclick="">신고하기</button>
	            </c:when>
	            <c:otherwise>
	            
	            </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    
	  <!-- 예약취소 모달 -->
	  <div class="modal" id="cancelModal">
	    <div class="modal-dialog">
          <div id="reserveAlert" class="modal-content">
	        <div align="center">
	            <br>
	            <h6><b>예약을 정말로 취소하시겠습니까?</b></h6>
	            <div>
	                <span><b> 예약을 취소하시면 입력한 정보가 모두 소멸됩니다.</b></span><br><br>
	                <button type="submit" class="submitBtn">확인</button> &nbsp;
	                <button type="button" class="submitBtn" class="close" data-dismiss="modal">취소</button>
	            </div>
	        </div>
	      </div>
	    </div>
	  </div>

    
    

    <!-- 신고하기 버튼 클릭시 뜨는 alert
    <div id="reserveAlert">
        <div align="center">
            <br>
            <h5 style="color:  rgb(145, 37, 247)"><b>신고</b></h5>
            <form action="" method="POST">
                <table id="reportEnrollForm">
                    <tr>
                        <td>신고유형</td> &nbsp;&nbsp;
                        <td>
                            <select name="reportType"> 
                                <option value="hostReport">호스트신고</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>신고상세유형</td>
                        <td>
                            <select name="reportDetailType">
                                <option value="">서비스불만족</option>
                                <option value="">허위내용</option>
                                <option value="">광고</option>
                                <option value="">기타</option>
                            </select>
                        </td> 
                    </tr>
                    <tr>
                        <td>신고자</td>
                        <td><input type="text" name="userId" value="userId01" readonly></td>
                    </tr>
                    <tr>
                        <td>신고내용</td>
                        <td>
                            <textarea name="" id="" cols="30" rows="5" style="resize: none;"></textarea>
                        </td>
                    </tr>
                </table>
                <br>
                <button type="submit" class="submitBtn">신고하기</button>
            </form>
        </div>
        <br>
    </div>
     -->

    <jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>