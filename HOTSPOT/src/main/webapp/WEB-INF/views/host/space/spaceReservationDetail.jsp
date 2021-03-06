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
	    width: 160px;
	    height: 40px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	    float:right
	}
	#cancelAlert{
	    position: relative;
	    background: rgb(243, 243, 243);
	    padding: 15px;
	    margin-top: 35%;
	}
	#reportAlert{
	    position: relative;
	    background: rgb(243, 243, 243);
	    padding: 30px;
	    width: 550px;
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
	<jsp:include page="../common/hostMenubar.jsp" />
	<jsp:include page="../common/subMenubar.jsp"/>


	<div style="position: absolute; top: 50px; left: 300px;" aling="center">
    <div id="content">
        <div id="reservation_Detail">
        	<input type="hidden" name="userId" value="${ loginUser.userId }">
        	<input type="hidden" name="reservNo" value="${ r.reservNo }">
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
			                            <td>${ r.payMethod }, ${ r.payDate }</td>
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
	            	<button type="button" class="reserveBtn" class="btn btn-primary" data-toggle="modal" data-target="#reportModal">신고하기</button>
	            </c:when>
	            <c:otherwise>
	            
	            </c:otherwise>
            </c:choose>
        </div>
	    <div align="center">
	     <c:if test="${ r.reservStatus eq '취소환불' }">
	     	<h3>해당 예약이 취소완료 되었습니다! 감사합니다.</h3>
	     </c:if>
	    </div>
    </div>
    
    
	  <!-- 예약취소 모달 -->
	  <div class="modal" id="cancelModal">
	    <div class="modal-dialog">
          <div id="cancelAlert" class="modal-content">
          	<form action="reservDelete.re" method="post">
          	<input type="hidden" name="reservNo" value="${ r.reservNo }">
		        <div align="center">
		            <br>
		            <h6><b>예약을 정말로 취소하시겠습니까?</b></h6>
		            <div>
		                <span><b> 예약을 취소하시면 입력한 정보가 모두 소멸됩니다.</b></span><br><br>
		                <button type="submit" class="submitBtn">확인</button> &nbsp;
		                <button type="button" class="submitBtn" class="close" data-dismiss="modal">취소</button>
		            </div>
		        </div>
	        </form>
	      </div>
	    </div>
	  </div>

    
    
   	  <!-- 신고 모달 -->
	  <div class="modal" id="reportModal">
	    <div class="modal-dialog">
          <div id="reportAlert" class="modal-content">
		     <div align="center">
	            <br>
	            <h5 style="color:  rgb(145, 37, 247)"><b>어떤것이 불편하셨나요?</b></h5><br>
		            <form action="reservReport.re" method="POST">
		            <input type="hidden" name="reportWriter" value="${ loginUser.userId }">
		                <table id="reportEnrollForm">
		                    <tr>
		                        <td>신고유형</td>
		                        <td>
		                            <select name="reportType1"> 
		                                <option value="호스트신고">게스트신고</option>
		                                <option value="공간신고">공간신고</option>
		                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>신고상세유형</td>
		                        <td>
		                            <select name="reportType2">
		                                <option value="서비스불만족">서비스불만족</option>
		                                <option value="허위내용">허위내용</option>
		                                <option value="광고">광고</option>
		                                <option value="기타">기타</option>
		                            </select>
		                        </td> 
		                    </tr>
		                    <tr>
		                        <td>신고할 게스트</td>
		                        <td><input type="text" name="reportTarget" value="${ r.userId }" readonly></td>
		                    </tr>
		                    <tr>
		                        <td>신고내용</td>
		                        <td>
		                            <textarea name="reportContent" cols="40" rows="5" style="resize: none;"></textarea>
		                        </td>
		                    </tr>
		                </table>
		                <br>
		                <button type="submit" class="submitBtn">신고하기</button> &nbsp;&nbsp;
		                <button type="button" class="submitBtn" class="close" data-dismiss="modal">취소</button>
			        </form>
		        </div>
		    </div>
	    </div>
	  </div>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>