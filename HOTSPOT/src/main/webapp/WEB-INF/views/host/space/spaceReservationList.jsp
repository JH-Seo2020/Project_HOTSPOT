<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--부트스트랩-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!--제이쿼리-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 메뉴바 css -->
<link rel="stylesheet" href="resources/css/guest/menubar.css" type="text/css"/>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify cdn -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<style>
    #noticeWrap{
        width: 100%;
        height: auto;
        margin: auto;
    }
    #noticeWrap div,form{
        margin: auto;
    }
    #noticeTitle{
        text-align: center;
        font-weight: bold;
        font-size: 30px;
        padding-top:3%;
    }
    #noticeSearch{
        width: 1200px;
        height: auto;
        margin-top: 4%;
        margin-bottom: 4%;
    }
    #noticeSpace{
        width: 1200px;
        height: auto;
        padding: 2% 2%;
        background-color: white;
    }
    table>thead,tbody>tr>th,td{text-align:center;}
   
    #pagination{
        text-align: center;
        padding: 4% 0;
    }
    #pagination>button{
        border: none;
        background-color: rebeccapurple;
        color: white;
    }
    /*기타 css*/
    .purple{
        background-color: rebeccapurple;
        color: white;
        border: white;
    }
    .purple:hover{
    	color:gray;
    }
    .black{
        color: black !important;
        text-decoration: none !important;
        font-weight: lighter;
    }
    .disabled{
    	disabled:true;
    	background-color: black;
    }
</style>
<body>
	<jsp:include page="../common/hostMenubar.jsp" />
	<jsp:include page="../common/subMenubar.jsp"/>


	<div style="position: absolute; top: 50px; left: 300px;" aling="center">
    <div id="noticeWrap">
        <div id="noticeTitle">
            <p>호스트 공간 예약 내역</p>
        </div>
        
        <div id="noticeSpace" style="margin-left: 450px;">
            <table style="border-collapse: separate; border-spacing: 30px;">
                <thead >
                  <tr>
                  	<th>구분</th>
                    <th>아이디</th>
                    <th>공간명</th>
                    <th>거래일자</th>
                    <th>이용시간</th>
                    <th>총금액</th>
                    <th>상태</th>
                    <th>결제 취소</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${!empty reservationList }">
		                	<c:forEach var="rl" items="${reservationList }">
				                  <tr>
				                  	<th>${rl.reservNo }</th>
                                    <td>${rl.userId }</td>
									<td>${rl.spcName }</td>
                                    <td>${rl.payDate}</td>
                                    <td>${rl.totalTime}</td>
                                    <td>${rl.paySum}</td>
                                    <td>${rl.reservStatus}</td>
                                    
                                    <td><button class="btn btn-primary">결제 취소</button></td>
				                  </tr>
		                	</c:forEach>  
		                </c:when>
		                <c:otherwise>
		                	<tr>
			                  	<th></th>
			                    <td colspan="8">
			                        <p style="font-size:20px;">"등록하신 공간이 없거나 예약 인원이 없습니다"</p>
			                    </td>
			                    <td></td>
			                 </tr>
		                </c:otherwise>
                	</c:choose>
                </tbody>
              </table>
              <br><br><br>
              <table style="border-collapse: separate; border-spacing: 30px;">
                <thead>
                    <tr>
                        <th></th>
                        <th>총 금액</th>
                        <th>수수료</th>
                        <th>정산 금액</th>
                        <th>총 결제</th>
                    </tr>
                </thead>
                
                <tbody>
                    <tr>
                        <td>합계</td>
                        <c:forEach var="i" items="${ reservationList }">
                        	<c:set var="sum" value="${i.paySum + sum }"/>
                        </c:forEach>
                        	<td>${sum }원</td>
                        <c:set var="pay" value="${sum/10 }"/>
                        <td> ${pay }원 </td>
                        <td>${sum - pay}원</td>
                        <td>총 1 건</td>
                    </tr>

                </tbody>

              </table>
        </div>
        
   </div>
	</div>


	<jsp:include page="../../common/footer.jsp" />
</body>
</html>