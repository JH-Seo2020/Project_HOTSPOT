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
        <div>

            <br>
            <div style="font-size:20px; margin-left:20px;">공지사항</div>
            <hr style="background:ligthgrey;">
            <br><br>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
                <tr>
                    <th><input type="checkbox"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자 아이디</th>
                    <th>작성일</th>
                    <th>수정일</th>
                </tr>
               	<c:forEach var="n" items="${list }">
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>${n.noticeNo}</td>
	                    <td>${n.noticeTitle }</td>
	                    <td>${n.noticeWriter}</td>
	                    <td>${n.createDate }</td>
	                    <td>${n.modifyDate }</td>
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
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.startPage}">
                		<button onclick="location.href='list.no?currentPage=${ pi.currentPage-1 }'" style="margin-left:90px;" class="btn btn-secondary"><</button>
                	</c:when>
                	<c:otherwise>
                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
                	</c:otherwise>	
                </c:choose>
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
                	<button class="btn btn-secondary" onclick="location.href='list.no?currentPage=${ p }'">${ p }</button>
                </c:forEach>
                
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.endPage }">
                		<button onclick="location.href='list.no?currentPage=${ pi.currentPage+1 }'" class="btn btn-secondary">></button>
                	</c:when>
                	<c:otherwise>
                		<button disabled class="btn btn-secondary">></button>
                	</c:otherwise>	
				</c:choose>
                <button style="margin-left:180px" class="btn btn-secondary">글작성</button>
                <button class="btn btn-secondary">삭제</button>        
            </div>
        </div>
    </div>
</body>
</html>