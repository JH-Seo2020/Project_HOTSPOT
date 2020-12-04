<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #content{
        background: rgb(243, 243, 243);
	    margin-top: 40px;
    }
    .reservation_thumbnail{
    	width: 160px;
        height:120px; 
        float: left;
    	margin:auto;
        padding: 10px;
        padding-right: 30px;
    }
    .listInfo1 a{
        color: rgb(145, 37, 247);
        font-size: 16px;
        font-weight: bold;
    }
    .listInfo2{font-size: 15px}
    
    #reservation_listArea{
        padding: 100px;
        margin: auto;
        margin-top: -30px;
        width: 70%;
    }
    #reservation_listArea div{
        background: white;
        border-radius: 3px;
        padding: 10px;
    }
    #reservation_listArea>div:hover{
        box-shadow: 3px 3px 3px 3px rgb(207, 207, 207);
        cursor:pointer;
    }
    .reserveInfo{
        border: 1px solid rgb(218, 218, 218);
        margin-bottom: -8px;
    }
    #paging-area li>a{color: rgb(139, 138, 138)}
    .selectArray{
        float: right;
        margin-right: 22%;
        box-sizing: border-box;
    }
	#reservation_listArea .statusRable{
		background: #ffe714;
		text-align: center;
		width: 90px; 
		height: 30px; 
		font-size: 15px; 
		float: right;
		margin-top: -38px;
		margin-right: 110px;
		border-radius: 30px;
	}
	#reviewBtn{
		float: right;
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	    margin-top: -38px;
	    margin-right: 7px;
		border-radius: 30px;
	}
</style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="reservation_list" >
            <br><br><br>
            <h2 align="center"><b>예약 내역 리스트</b></h2>
            <br><br>
            <div class="selectArray">
                <select name="reservAlign" id="reservAlign">
                    <option value="이용날짜순" selected>이용날짜순</option>
                    <option value="예약번호순" >예약번호순</option>
                </select>
                <select name="reservStatus" id="reservStatus">
                    <option value="total" selected>전체</option>
                    <option value="reservfix">예약확정</option>
                    <option value="paywait">결제대기</option>
                    <option value="cancel">취소환불</option>
                    <option value="usecomplete">이용완료</option>
                </select>
            </div>
            	<div id="reservation_listArea">
		            <input type="hidden" name="userId" value="${ loginUser.userId }">
	            	<c:forEach var="r" items="${ list }">
		                <div class="reserveInfo">
		                    <input type="hidden" name="reservNo" id="reservNo" value="${ r.reservNo }">
						<c:choose>
			                <c:when test="${ r.reSpcImg != null}">
			                	<img class="reservation_thumbnail" src="<c:url value='resources/images/spaces/${ r.reSpcImg }'/>">
							</c:when>
							<c:otherwise>
								<img class="reservation_thumbnail" src="resources/images/spaces/space1.jpg" >
							</c:otherwise>
			            </c:choose>
		                    <div>
		                        <span class="listInfo1">[${ r.reSpcType }][${ r.location }] ${ r.reSpcName }</span><br>
	                        	<span class="listInfo2">${ r. reservDate } ${ r.useTime }시 ~ ${ r.endTime }시, ${ r.totalTime }시간, ${ r.reservTotal }명</span><br><br>
		                        <c:choose>
			                        <c:when test="${ r.reservStatus eq '취소환불'}">
			                        	<span class="listInfo2">0원</span>
			                        	<span class="listInfo2">취소환불 완료</span>
			                        </c:when>
			                        <c:otherwise>
			                        	<span class="listInfo2">${ r.paySum }원</span>
			                        </c:otherwise>
		                        </c:choose>
		                        <span class="statusRable">${ r.reservStatus }</span>
		                        <c:if test="${ r.reservStatus eq '이용완료' }">
		                        	<button type="button" id="reviewBtn">후기 작성</button>
		                        </c:if>
		                    </div>
		                </div><br>
		         	</c:forEach>
	           	</div>
	       </div>
	       
	       
	       <script>
	       	$(function(){
	       		$("#reservAlign").change(function(){
	       			location.href="align.re?align=" + $("#reservAlign option:selected").val(); // selected옵션으로 선택한 value값을 요청
	       		})
	       	});
	       </script>
	       
	       <!-- 
	       <script>
	       	$(function(){
	       		$("#reservStatus").change(function(){
	       			location.href="myReserv.re?reservStatus" + 
	       		})
	       	});
	       </script>
	        -->
	       
	       <script>
	       	$(function(){
	       		$(".reserveInfo").click(function(){
	       			location.href="reservDetail.re?reservNo=" + $(this).children("#reservNo").val();
	       		})
	       	});
	       	
	       	$("#reviewBtn").click(function(e){
	       		e.stopPropagation();  // '후기작성'버튼에 이벤트 버블링 주기
	       		location.href="enrollReview.mg?reservNo=" + $(".reserveInfo").children("#reservNo").val();
	       	})
	       </script>
	       
	       
	       
	       

        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <c:choose>
                   	<c:when test="${ pi.currentPage eq 1}">
                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReserv.re?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<input type="hidden" name="userId" value="${ loginUser.userId }"> 
                   	<li class="page-item"><a class="page-link" href="myReserv.re?currentPage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReserv.re?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                    </c:otherwise>
               	</c:choose>
            </ul>
        </div><br><br><br>
        
        
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>