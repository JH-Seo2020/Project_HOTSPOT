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
	.reviewDeleteBtn{
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
	    padding: 20px;
	    padding-inline: 30px;
	    margin: auto;
	    margin-bottom: 15px;
	    width: 60%;
	}
	#reviewAlert{
		position: relative;
	    background: rgb(243, 243, 243);
	    padding: 15px;
	    margin-top: 35%;
	}
	.updateBtn{
	    width: 70px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px
	}
	.reSubmitBtn{
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
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
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">최신순</button>
                <div class="dropdown-menu">
                <a class="dropdown-item" href="#">예약번호순</a>
                </div>
            </div>
            <br>
            <div id="inputReview">
            <input type="hidden" name="userId" value="${ loginUser.userId }">
           	<c:forEach var="rv" items="${ rvList }">
                <div class="review">
                    <div class="reviewInfo">
                        <dl>
                        	<dt id="reservNo">예약번호 : ${ rv.reservNo }</dt><br>
                            <dd style="margin-bottom: 15px">
                                <span><b>제목 : ${ rv.reviewTitle }</b></span> &nbsp;
                                <span class="useDate"><small>작성일 : ${ rv.reviewDate }</small></span>
                                <button type="button" id="updateBtn" onclick="location.href='updateReviewForm.mg?reservNo='+ ${rv.reservNo} + '&reviewNo=' + ${rv.reviewNo} + '&spcNo=' + ${rv.spcNo} ">수정</button> <br clear="both">
                                <button type="button" class="reviewDeleteBtn" value="${ rv.reviewNo }" data-toggle="modal" data-target="#reviewModal">삭제</button>
                            </dd>
                        </dl>
                    </div>
                    <c:choose>
	                    <c:when test="${ rv.reviewReply != null }">
		                    <div class="reviewReply"><hr>
		                        <dl>
		                            <dt><b>호스트님의 답글 :</b></dt><br>
		                            <dd>
		                                <span>${ rv.reviewReply }</span><br>
		                            </dd>
		                        </dl>
		                    </div>
	                    </c:when>
	                    <c:otherwise>
	                    
	                    </c:otherwise>
                    </c:choose>
               	</div>
               </c:forEach>
            </div>
        </div>
        <br><br>
        
        <script>
        $()
        </script>

        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <c:choose>
                   	<c:when test="${ pi.currentPage eq 1}">
                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ pi.currentPage-1 }&userId=${loginUser.userId}">&lt;</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<input type="hidden" name="userId" value="${ loginUser.userId }"> 
                   	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ p }&userId=${loginUser.userId}">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myReview.mg?currentPage=${ pi.currentPage+1 }&userId=${loginUser.userId}">&gt;</a></li>
                    </c:otherwise>
               	</c:choose>
            </ul>
        </div><br><br><br>
    </div>

    
	    <script>
	    $(function(){
	        $(".reviewDeleteBtn").click(function(){
	           var reviewNo = $(this).val();
	           $("input[name=reviewNo]").attr("value", reviewNo);
	        });
	     });
	    </script>
    
	    
	    <!-- 리뷰삭제하기 모달 -->
		<div class="modal" id="reviewModal">
		   <div class="modal-dialog">
		        <div id="reviewAlert" class="modal-content">
		        	<form action="deleteReview.mg" method="post">
		        	<input type="hidden" name="reviewNo" value="">
		        <div align="center">
		            <br>
		            <h6><b>정말로 삭제하시겠습니까?</b></h6>
		            <div>
		                <span><b>삭제하시면 모든 내용은 삭제됩니다.</b></span><br><br>
		                <button type="submit" class="reSubmitBtn">확인</button> &nbsp;
		                <button type="button" class="reSubmitBtn" class="close" data-dismiss="modal">취소</button>
		            </div>
		        </div>
		       </form>
		     </div>
		   </div>
		 </div>
    
    

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>