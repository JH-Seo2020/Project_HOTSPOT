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
	.btn-group{
	    width: 60%;
	    height: 45px;
	}
	.reviewDropdown{
	    margin-left: 72%;
	}
	.reviewDropdown button{
	    background: white;
	    border: 1px solid black;
	    color: black;
	    width: 28%;
	}
	.inputBtn{
	    float: right;
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	#updateBtn{
		float: right;
	    width: 90px;
	    height: 30px;
	    margin-right: 100px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	#deleteBtn{
		float: right;
	    width: 90px;
	    height: 30px;
	    margin-top: -30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	#inputReview{
	    position: relative;
	    left: auto;
	}
	.review{
	    border: 1px solid rgb(218, 218, 218);
	    background: white;
	    padding: 17px;
	    padding-inline: 30px;
	    margin: auto;
	    margin-bottom: 15px;
	    width: 60%;
	}
	.updateBtn{
	    width: 70px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px
	}
	#paging-area li>a{color: rgb(139, 138, 138)}
	.useDate{color: rgb(177, 177, 177)}
</style>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="reviewArea">
            <br><br><br>
            <h2 align="center"><b>이용후기 관리</b></h2>
            <br><br>
            <div class="ManageBtn" data-example-id="simple-button-group" align="center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button class="btn btn-primary" id="review" style="background: rgb(145, 37, 247);" onclick="location.href='myReview.mg'">이용후기</button>
                    <button class="btn btn-default" id="qna" style="background: rgb(212, 212, 212);" onclick="location.href='myQna.mg'">Q & A</button>
                    <button class="btn btn-default" id="inquiry" style="background: rgb(212, 212, 212);" onclick="location.href='myInquiry.mg'">1:1문의</button>
                </div>
            </div>
            <br><br>
            <div class="reviewDropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                	예약번호순
                </button>
                <div class="dropdown-menu">
                <a class="dropdown-item" href="#">최신순</a>
                </div>
            </div>
            <br>
            <div id="inputReview">
            <input type="hidden" name="userId" value="${ loginUser.userId }">
            <input type="hidden" name="reviewNo" value="${ rv.reviewNo }">
            <c:choose>
            <c:when test="${ !empty spcName }">
			      <c:forEach var="rv" items="${ rvList }">
			            <div class="review">
			                    <div class="reviewInfo">
			                        <dl>
			                            <dt><b> 예약번호 : ${ rv.reservNo }</b></dt><br>
			                            <dd>
			                                <a href="spaceDetail.guest?spcNo=${ rv.spcNo }"><b>공간명 : [${ rv.spcType }][${ rv.location }] ${ rv.spcName }</b></a><br>
			                                <small class="useDate"> 이용날짜 : ${ rv.useDate }</small> 
			                                <button type="button" class="inputBtn" onclick="location.href='enrollReview.mg?reservNo=' + ${ rv.reservNo }">후기 작성</button>
			                            </dd>
			                        </dl>
			                    </div>
			               </div>
		             </c:forEach>
		            </c:when>
		            
		            <c:otherwise>
		            	<c:forEach var="rv" items="${ rvList }">
			                <div class="review">
			                    <div class="reviewInfo">
			                        <dl>
			                        	<dt><b> 예약번호 : ${ rv.reservNo }</b></dt><br>
			                            <dd>
			                                <span><b>제목 : ${ rv.reviewTitle }</b></span> &nbsp;
			                                <span class="useDate"><small>작성일 : ${ rv.reviewDate }</small></span>
			                                <button type="button" id="updateBtn" onclick="">수정</button> <br clear="both">
			                                <button type="button" id="deleteBtn" onclick="" >삭제</button>
			                            </dd>
			                        </dl>
			                    </div>
			                    <c:if test="${ !empty rv.reviewReply }"><hr>
				                    <div class="reviewReply">
				                        <dl>
				                            <dt><b>호스트님의 답글 :</b></dt><br>
				                            <dd>
				                                <span>${ rv.reviewReply }</span><br>
				                            </dd>
				                        </dl>
				                    </div>
				                 </c:if>
			               	</div>
		                </c:forEach>
               		</c:otherwise>
               </c:choose>
            </div>
        </div>
        <br><br>



        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <c:choose>
                   	<c:when test="${ pi.currentPage eq 1}">
                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<input type="hidden" name="userId" value="${ loginUser.userId }"> 
                   	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                    </c:otherwise>
               	</c:choose>
            </ul>
        </div><br><br><br>
        
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>