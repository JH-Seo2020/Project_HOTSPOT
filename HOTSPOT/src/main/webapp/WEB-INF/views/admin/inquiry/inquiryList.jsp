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
            <br>
            <div style="font-size:20px; margin-left:20px; margin-top:11px;">1:1문의</div>
            <hr style="background:ligthgrey;">
            <br><br>
            <div id="answerArray" style="width:1000px; margin:auto"> 
                <select name="head" id="head" style="height:30px;">
                    <option value="전체">전체</option>
                    <option value="답변">답변</option>
                    <option value="미답변">미답변</option>
                </select>
            </div>
            <script>
            	$(function(){
	
            		$("#head").change(function(){
            			location.href="list.inq?head="+ $("#head").val();
            		})
					$("#head option[value=${head}]").attr("selected", true);
            	})	
         		  	
            </script>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
            	<thead>
	                <tr>
	                    <th><input type="checkbox"></th>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>처리상태</th>
	                    <th>작성일</th>
	                </tr>
                </thead>
                <c:forEach var="i" items="${ list }">
	               	<tbody>
		                <tr>
		                    <td><input id="check" type="checkbox" value="${ i.inquiryNo }"></td>
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
	                </tbody>
                </c:forEach>
            </table>
            <script>
            	$(function(){
            		$("tbody tr").find("td:eq(2)").click(function(){
            			location.href="detail.inq?ino="+ $(this).prev().text();
            		})
            		$("#adminNotice thead input[type=checkbox]").click(function(){
            			if($(this).prop("checked")){
            				$("tbody input[type=checkbox]").prop("checked", true);
            			}else{
            				$("tbody input[type=checkbox]").prop("checked", false);
            			}
            		})
            		$("#delete").click(function(){
						  var selected = new Array();	            			
 	            		$("#check:checked").each(function(){		
 	            			selected.push($(this).val())
 	            		})
 	            		if(selected == ""){
            				alert("선택된 항목이 없습니다.");
            			}else{
 	            			if(confirm("삭제하시겠습니까?")){
 	            				
 	            			location.href="deleteList.inq?ino="+selected
 	            			}
            			}
            		});
            	})
            </script>
            
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <%-- <form action="search.inq">
                    <select name="search" id="" style="height:34px;">
                    <option value="no">글번호</option>
                    <option value="tilte">제목</option>
                    </select>
                    <input type="hidden" name="schead" value="${ head }">
                    <input type="text" name="keyword" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form> --%>
                <c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<button style="margin-left:350px;" class="btn btn-secondary" disabled><</button>
                	</c:when>
                	<c:otherwise>
                		<button style="margin-left:350px;" class="btn btn-secondary" onclick="location.href='list.inq?currentPage=${ pi.currentPage -1}&head=${head}'"><</button>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq p }">
                			<button class="btn btn-secondary" disabled>${ p }</button>
                		</c:when>
                		<c:otherwise>
                			<button class="btn btn-secondary" onclick="location.href='list.inq?currentPage=${p}&head=${head}'">${ p }</button>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                <c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">
                		<button class="btn btn-secondary" disabled>></button>
                	</c:when>
                	<c:otherwise>
                		<button class="btn btn-secondary" onclick="location.href='list.inq?currentPage=${ pi.currentPage + 1}&head=${ head }'">></button>
                	</c:otherwise>
                </c:choose>
                <button style="margin-left:255px;" class="btn btn-danger" id="delete">삭제</button>        
            </div>
        </div>
</body>
</html>