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
         #adminNotice tbody tr{
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
            <div style="font-size:20px; margin-left:20px; margin-top:11px;">예약관리</div>
            <hr style="background:ligthgrey;">
            <br><br>
            <div id="answerArray" style="width:1000px; margin:auto"> 
                <select name="head" id="head" style="height:30px;">
                	<option value="전체">전체</option>
                    <option value="예약확정">예약확정</option>
                    <option value="결제대기">결제대기</option>
                    <option value="취소환불">취소환불</option>
                    <option value="이용완료">이용완료</option>
                </select>
            </div>
            <script>
				$(function(){
					$("#head").change(function(){
						location.href="list.rad?head="+$("#head").val()
					})
					 $("#head option[value=${ head }]").attr("selected", true); 
				})
            </script>
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
            	<thead>
	                <tr>
	                    <th>예약번호</th>
	                    <th>공간번호</th>
	                    <th>결제방법</th>
	                    <th>호스트 아이디</th>
	                    <th>게스트아이디</th>
	                    <th>결제한 날짜</th>
	                    <th>예약상태</th>
	                </tr>
               </thead>
               <tbody>
	            	<c:forEach var="r" items="${ list }">
		                <tr>		                 
		                    <td>${ r.reNo }</td>
		                    <td>${ r.spcNo }</td>
		                    <td>${ r.payMethod }</td>
		                    <td>${ r.reHost }</td>
		                    <td>${ r.reGuest }</td>
		                    <td>${ r.payDate }</td>
		                    <td>${ r.reStatus }</td>
		                </tr>
					</c:forEach>                
               </tbody> 
            </table>
          	<script>
          		$(function(){
          			$("#adminNotice tbody tr").click(function(){
          				location.href="detail.rad?rno="+$(this).children().eq(0).text();
          			})
          		})
          	</script>
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="list.rad">
                    <select name="search" id="" style="height:34px;">
                    <option value="reNo">예약번호</option>
                    <option value="guest">게스트</option>
                    <option value="host">호스트</option>
                    </select>
                    <input type="hidden" name="head" value="${head }">
                    <input type="text" name="keyword" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
                <c:choose>
                	<c:when test="${ pi.currentPage ne 1  }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage -1}&head=${ head }'"><</button>
                			</c:when>
                			<c:otherwise>
                				<button style="margin-left:90px;" class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage -1}&search=${search }&keyword=${keyword }&head=${ head }'"><</button>
                			</c:otherwise>
                		</c:choose>
                	</c:when>
                	<c:otherwise>
                		<button style="margin-left:90px;" class="btn btn-secondary" disabled><</button>
                	</c:otherwise>
                </c:choose>
                	<c:choose>
                		<c:when test="${empty sc }">
           				 	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
           				 		<c:choose>
			                		<c:when test="${ pi.currentPage eq p }">
			                			<button class="btn btn-secondary" disabled>${ p }</button>
			                		</c:when>
			                		<c:otherwise>
                						<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${p}&head=${ head }'">${ p }</button>
                					</c:otherwise>
               					</c:choose>	
               				 </c:forEach>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                				<c:choose>
			                		<c:when test="${ pi.currentPage eq p }">
			                			<button class="btn btn-secondary" disabled>${ p }</button>
			                		</c:when>
			                		<c:otherwise>
                						<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${p}&search=${search }&keyword=${keyword }&head=${ head }'">${ p }</button>
                					</c:otherwise>
                				</c:choose>		
                			 </c:forEach>
                		</c:otherwise>
                	</c:choose>
                <c:choose>
                	<c:when test="${ pi.currentPage ne pi.maxPage }">
                		<c:choose>
                			<c:when test="${ empty sc }">
                				<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage +1}&head=${ head }'">></button>
                			</c:when>
                			<c:otherwise>
                				<button class="btn btn-secondary" onclick="location.href='list.rad?currentPage=${ pi.currentPage +1}&search=${search }&keyword=${keyword }&head=${ head }'">></button>
                			</c:otherwise>
                		</c:choose>	
                	</c:when>
                	<c:otherwise>
                		<button class="btn btn-secondary" disabled>></button>
                	</c:otherwise>
                </c:choose>

                       
            </div>
        </div>    
    </div>
</body>
</html>