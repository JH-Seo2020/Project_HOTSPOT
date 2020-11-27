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
        #adminNotice tbody td:nth-child(3){
        	cursor:pointer;
        }
        #adminNotice tbody tr:hover{
        	background:mintcream;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
        <div>
            <br>
            <div style="font-size:20px; margin-left:20px; margin-top:11px;">공간관리</div>
            <hr style="background:ligthgrey;">
            <br><br>
            </div>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
            	<thead>
	                <tr>
	                    <th><input type="checkbox"></th>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자 아이디</th>
	                    <th>카테고리</th>
	                    <th>작성일</th>
	                </tr>
                </thead>
                <tbody>
                	<c:forEach var="s" items="${ list }">
		                <tr>
		                    <td><input type="checkbox" id="check" value="${s.spcNo }"></td>
		                    <td>${ s.spcNo }</td>
		                    <td>${ s.spcName }</td>
		                    <td>${ s.userId }</td>
		                    <td>${ s.spcType }</td>
		                    <td>${ s.enrollDate }</td>
	    	            </tr>
    	            </c:forEach>
                </tbody>
            </table>
                <script>
                	$(function(){
                		$("#adminNotice thead input[type=checkbox]").change(function(){
                			if($("#adminNotice thead input[type=checkbox]").prop("checked")){
                				$("#adminNotice tbody input[type=checkbox]").prop("checked", true);
                			}else{
                				$("#adminNotice tbody input[type=checkbox]").prop("checked", false);
                			}
                				
                		})
                			var selected = new Array();
                		$("#delete").click(function(){
                			$("#check:checked").each(function(){
                				selected.push(this.value);
                			})
                			if(confirm("삭제하시겠습니까?")){
                				
                			location.href="delete.sad?sno="+ selected;
                			}
                		})
                		$("#adminNotice tbody tr").find("td:eq(2)").click(function(){
                			location.href="detail.sad?sno="+$(this).prev().text();
                		})
                	})
                </script>
                
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="list.sad">
                    <select name="search" id="" style="height:34px;">
                    <option value="no">공간번호</option>
                    <option value="user">작성자</option>
                    <option value="title">제목</option>
                    </select>
                    <input type="text" name="keyword" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
              <c:choose>
              	<c:when test="${ empty sc }">
	                <c:choose>
	                	<c:when test="${ pi.currentPage eq pi.startPage }">
	                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
	                	</c:when>
	                	<c:otherwise>
	                		<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${pi.currentPage -1}'"><</button>
	                	</c:otherwise>
	                </c:choose>
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq p }">
	                			<button class="btn btn-secondary" disabled>${ p }</button>
	                		</c:when>
	                		<c:otherwise>
	                			<button class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${p}'">${ p }</button>
	                		</c:otherwise>
	                	</c:choose>                	
	                </c:forEach>
	                <c:choose>
	                	<c:when test="${ pi.currentPage eq pi.maxPage }">       
	                		<button class="btn btn-secondary" disabled>></button>
	                	</c:when>
	                	<c:otherwise>
	                		<button class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${pi.currentPage +1}'">></button>
	                	</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
	                	<c:when test="${ pi.currentPage eq pi.startPage }">
	                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
	                	</c:when>
	                	<c:otherwise>
	                		<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${pi.currentPage -1}&search=${search }&keyword=${keyword }'"><</button>
	                	</c:otherwise>
	                </c:choose>
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq p }">
	                			<button class="btn btn-secondary" disabled>${ p }</button>
	                		</c:when>
	                		<c:otherwise>
	                			<button class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${p}&search=${search }&keyword=${keyword }'">${ p }</button>
	                		</c:otherwise>
	                	</c:choose>                	
	                </c:forEach>
	                <c:choose>
	                	<c:when test="${ pi.currentPage eq pi.maxPage }">       
	                		<button class="btn btn-secondary" disabled>></button>
	                	</c:when>
	                	<c:otherwise>
	                		<button class="btn btn-secondary" onclick="location.href='list.sad?currentPage=${pi.currentPage +1}&search=${search }&keyword=${keyword }'">></button>
	                	</c:otherwise>
					</c:choose>
				</c:otherwise>	
             </c:choose> 
                <button style="margin-left:255px;" class="btn btn-danger" id="delete">삭제</button>        
            </div>
        </div>
    </div>
</body>
</html>