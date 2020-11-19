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
        #adminFooter form{
            display:inline;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
            <br>
            <div style="font-size:20px; margin-left:20px;">1:1문의</div>
            <hr style="background:ligthgrey;">
            <br><br>
            <div id="answerArray" style="width:1000px; margin:auto"> 
                <select name="" id="" style="height:30px;">
                    <option value="">전체</option>
                    <option value="">답변</option>
                    <option value="">미답변</option>
                </select>
            </div>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
                <tr>
                    <th><input type="checkbox"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>처리상태</th>
                    <th>작성일</th>
                </tr>
                <c:forEach var="i" items="${ list }">
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>${ i.inquiryNo }</td>
	                    <td>${ i.inquiryTitle }</td>
	                    <td>${ i.inquiryWriter }</td>
	                    <c:choose>
	                    	<c:when test="${ i.replyStatus ne 'Y' }">
	                    		<td>미답변</td>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<td>답변</td>
	                    	</c:otherwise>
	                    </c:choose>	
	                    
	                    <td>${ i.enrollDate }</td>
	                </tr>
                </c:forEach>
            </table>
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="">
                    <select name="" id="" style="height:34px;">
                    <option value="">글번호</option>
                    <option value="">제목</option>
                    </select>
                    <input type="text" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
                <button style="margin-left:90px;" class="btn btn-secondary"><</button>
                <button class="btn btn-secondary">1</button>
                <button class="btn btn-secondary">2</button>
                <button class="btn btn-secondary">3</button>
                <button class="btn btn-secondary">4</button>
                <button class="btn btn-secondary">5</button>
                <button class="btn btn-secondary">></button>

                <button style="margin-left:255px;" class="btn btn-danger">삭제</button>        
            </div>
        </div>
</body>
</html>