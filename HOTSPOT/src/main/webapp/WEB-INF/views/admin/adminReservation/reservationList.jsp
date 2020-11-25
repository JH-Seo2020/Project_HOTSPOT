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
            <div style="font-size:20px; margin-left:20px;">예약관리</div>
            <hr style="background:ligthgrey;">
            <br><br>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
            	
                <tr>
                    <th><input type="checkbox"></th>
                    <th>예약번호</th>
                    <th>공간번호</th>
                    <th>결제방법</th>
                    <th>호스트 아이디</th>
                    <th>게스트아이디</th>
                    <th>결제한 날짜</th>
                </tr>
            	<c:forEach var="r" items="${ list }">
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>${ r.reNo }</td>
	                    <td>${ r.spcNo }</td>
	                    <td>${ r.payMethod }</td>
	                    <td>${ r.reHost }</td>
	                    <td>${ r.reGuest }</td>
	                    <td>${ r.payDate }</td>
	                </tr>
				</c:forEach>                
            </table>
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="list.rad">
                    <select name="search" id="" style="height:34px;">
                    <option value="reNo">예약번호</option>
                    <option value="guest">게스트</option>
                    <option value="host">호스트</option>
                    </select>
                    <input type="text" name="keyword" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.startPage }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage -1}'"><</button>
                			</c:when>
                			<c:otherwise>
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage -1}&search=${search }&keyword=${keyword }'"><</button>
                			</c:otherwise>
                		</c:choose>
                	</c:when>
                	<c:otherwise>
                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<c:choose>
                		<c:when test="${empty sc }">
                			<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${p}'">${ p }</button>
                		</c:when>
                		<c:otherwise>
                			<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${p}&search=${search }&keyword=${keyword }'">${ p }</button>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.maxPage }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage +1}'">></button>
                			</c:when>
                			<c:otherwise>
                				<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage +1}&search=${search }&keyword=${keyword }'">></button>
                			</c:otherwise>
                		</c:choose>	
                	</c:when>
                	<c:otherwise>
                		<button class="btn btn-secondary" disabled>></button>
                	</c:otherwise>
                </c:choose>

                <button style="margin-left:255px;" class="btn btn-danger">삭제</button>        
            </div>
        </div>    
    </div>
</body>
</html>