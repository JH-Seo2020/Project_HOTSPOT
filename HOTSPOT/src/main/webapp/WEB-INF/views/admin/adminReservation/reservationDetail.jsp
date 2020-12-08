<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
        #adminNotice{
            width:1000px;
        }
        #adminNotice input[type=checkbox]{
            width:15px;
            height:15px;
        }
        #adminReDetail td{
            height:65px;
            font-size:20px;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">   
         <br>
         <div style="font-size:20px; margin-left:20px; margin-top:11px;">예약관리</div>
         <hr style="background:ligthgrey;">
         <br><br>
         <div align="center" style="width:1000px; height:750px; border:1px solid; margin:auto;">
             <br>
             <h1>예약 상세내역</h1>
             <table id="adminReDetail" class="table" style="width:600px;">
                 <tr>
                     <td>예약번호</td>
                     <td>${ r.reNo }</td>
                 </tr>
                 <tr>
                     <td width="100">호스트아이디</td>
                     <td style="width:200px;">${ r.reHost }</td>
                 </tr>
                 
                 <tr>
                     <td>게스트아이디</td>
                     <td>${ r.reGuest }</td>
                 </tr>
                 <tr>
                     <td>공간명</td>
                     <td>${ r.spcName }</td>
                 </tr>
                 <tr>
                     <td>세부공간</td>
                     <td>${ r.purType }</td>
                 </tr>
                 <tr>
                     <td>예약일 및 시간</td>
                     <td>${r.startDate } ${ r.startTime } ~ ${ r.endDate } ${ r.endTime }(${r.totalTime }시간)</td>
                 </tr>
                 <tr>
                     <td>예약인원</td>
                     <td>${r.reTotal }명</td>
                 </tr>
                 <tr>
                     <td>총 금액</td>
                     <td><fmt:formatNumber value="${ r.paySum }" groupingUsed="true"/></td>
                 </tr>
                 <tr>
                     <td>결제방법</td>
                     <td>${ r.payMethod }</td>
                 </tr>
                 <tr>
                     <td>결제한 날짜</td>
                     <td>${ r.payDate }</td>
                 </tr>
                 
             </table>
             <br>
             <div style="width:1000px;" >
                 <hr>
                 <div align="right">
                     <button class="btn btn-secondary" onclick="location.href='list.rad'">목록으로</button><br>
                 </div>
                 <c:choose>
                 	<c:when test="${ r.reStatus == '예약확정' || r.reStatus == '결제대기'}">                		
	                 	<button class="btn btn-danger" onclick="if(confirm('취소하시겠습니까?')){location.href='delete.rad?rno=${r.reNo}'}">예약취소</button>
                 	</c:when>
                 </c:choose>
             </div>
			</div>
         <br><br><br><br><br><br><br><br>
 	</div>
    
</body>
</html>