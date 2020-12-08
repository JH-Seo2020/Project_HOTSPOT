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
            <div style="font-size:20px; margin-left:20px; margin-top:11px;">FAQ</div>
            <hr style="background:ligthgrey;">
            <br><br>
            
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
            	<thead>
                	<tr>
                    <th><input type="checkbox"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>작성일</th>
                	</tr>
                </thead>
                <tbody>
	                <c:forEach var="f" items="${ list }">
		                <tr>
		                    <td><input id="check" type="checkbox" value="${f.faqNo}"></td>
		                    <td>${ f.faqNo }</td>
		                    <td>${ f.faqTitle }</td>
		                    <td>${ f.faqType }</td>
		                    <td>${ f.enrollDate }</td>
		                </tr>
	                </c:forEach>    
                </tbody>
            </table>
            <script>
            	$(function(){
            		
            		$("#adminNotice tbody tr").find("td:eq(2)").click(function(){
            			location.href="detail.fad?fno="+$(this).prev().text();
            		});
            		
            		$("#adminNotice thead input[type=checkbox]").change(function(){
            			if($("#adminNotice tbody input[type=checkbox]").prop("checked")){
            				$("#adminNotice tbody input[type=checkbox]").prop("checked", false);
            			}else{
            				$("#adminNotice tbody input[type=checkbox]").prop("checked", true);
            			}
            		})
            	});           	
            </script>
            
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="list.fad">
                    <select name="search" id="" style="height:34px;">
                    <option value="no">글번호</option>
                    <option value="title">제목</option>
                    </select>
                    <input type="text" name="keyword" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
                <c:choose>
                	<c:when test="${ pi.currentPage ne 1 }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${ pi.currentPage -1}'"><</button>
                			</c:when>
                			<c:otherwise>
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${ pi.currentPage -1}&search=${search }&keyword=${keyword }'"><</button>
                			</c:otherwise>
                		</c:choose>
                	</c:when>
                	<c:otherwise>
                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<c:choose>
                		<c:when test="${ empty sc }">
               				<c:choose>
	                			<c:when test="${ pi.currentPage eq p }">
	                				<button class="btn btn-secondary" disabled>${ p }</button>
	                			</c:when>
	                			<c:otherwise>
                					<button class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${p}'" >${ p }</button>
                				</c:otherwise>
                			</c:choose>
                		</c:when>
                		<c:otherwise>
                			<c:choose>
	                			<c:when test="${ pi.currentPage eq p }">
	                				<button class="btn btn-secondary" disabled>${ p }</button>
	                			</c:when>
	                			<c:otherwise>
                					<button class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${p}&search=${search }&keyword=${keyword }'" >${ p }</button>
                				</c:otherwise>
                			</c:choose>
                		</c:otherwise>
                	</c:choose>	
                </c:forEach>
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.maxPage }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${ pi.currentPage +1}'">></button>
                			</c:when>
                			<c:otherwise>
                				<button class="btn btn-secondary" onclick="location.href='list.fad?currentPage=${ pi.currentPage +1}&search=${search }&keyword=${keyword }'">></button>
                			</c:otherwise>
                		</c:choose>
                	</c:when>
                	<c:otherwise>
                		<button class="btn btn-secondary" disabled>></button>
                	</c:otherwise>
				</c:choose>
                <button style="margin-left:180px" class="btn btn-secondary" onclick="location.href='enrollForm.fad'">글작성</button>
                <button class="btn btn-secondary" onclick="deleteFaq();">삭제</button>       
            </div>
        </div>
    </div>
    <script>
    	function deleteFaq(){
    		var selected = new Array();
    		$("#check:checked").each(function(){
    			selected.push($(this).val());
    		})
    		if(selected == ""){
				alert("선택된 항목이 없습니다.");
			}else{
    		if(confirm("삭제하시겠습니까?")){
    			
	    		location.href="delete.fad?fno=" + selected;
    		}
			}
    	}
    </script>
</body>
</html>