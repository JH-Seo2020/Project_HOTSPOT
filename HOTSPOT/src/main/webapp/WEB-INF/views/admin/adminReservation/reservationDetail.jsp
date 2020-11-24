<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
         <div style="font-size:20px; margin-left:20px;">예약관리</div>
         <hr style="background:ligthgrey;">
         <br><br>
         <div align="center" style="width:1000px; height:750px; border:1px solid; margin:auto;">
             <br>
             <h1>예약 상세내역</h1>
             <table id="adminReDetail" class="table" style="width:600px;">
                 <tr>
                     <td>예약번호</td>
                     <td>7</td>
                 </tr>
                 <tr>
                     <td width="100">호스트아이디</td>
                     <td style="width:200px;">user01</td>
                 </tr>
                 
                 <tr>
                     <td>게스트아이디</td>
                     <td>user01</td>
                 </tr>
                 <tr>
                     <td>공간명</td>
                     <td>[경복궁역]한옥카페'그리다꿈'</td>
                 </tr>
                 <tr>
                     <td>세부공간</td>
                     <td>토론방</td>
                 </tr>
                 <tr>
                     <td>예약일 및 시간</td>
                     <td>2020.10.30 05:00 ~ 2020.10.31 05:00(24시간)</td>
                 </tr>
                 <tr>
                     <td>예약인원</td>
                     <td>8명</td>
                 </tr>
                 <tr>
                     <td>총 금액</td>
                     <td>1,240,000원</td>
                 </tr>
                 <tr>
                     <td>결제방법</td>
                     <td>무통장입급</td>
                 </tr>
                 <tr>
                     <td>결제한 날짜</td>
                     <td>2020.10.25</td>
                 </tr>
                 
             </table>
             <br>
             <div style="width:1000px;" >
                 <hr>
                 <div align="right">
                     <button class="btn btn-secondary">목록으로</button><br>
                 </div>
                 <button class="btn btn-danger">예약취소</button>
             </div>
			</div>
         <br><br><br><br><br><br><br><br>
 	</div>
    
</body>
</html>