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
	.inquiry{
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
	.inputBtn{
	    float: right;
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	.qnaDate{color: rgb(177, 177, 177)}
 </style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="qnaArea">
            <br><br><br>
            <h2 align="center"><b>1:1문의 관리</b></h2>
            <br><br>
            <div class="ManageBtn" data-example-id="simple-button-group"  align="center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);" onclick="location.href='myReview.mg'">이용후기</button>
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);" onclick="location.href='myQna.mg'">Q & A</button>
                    <button class="btn btn-primary" style="background: rgb(145, 37, 247);" onclick="location.href='myInquiry.mg'">1:1문의</button>
                </div>
            </div>
            <br><br><br>
            <div id="inputInquiry">
            <c:forEach var="vi" items="${ viList }">
	            <div class="inquiry">
	                <input type="hidden" name="userId" value="${ loginUser.userId }">
	                <input type="hidden" name="inquiryNo" value="${ vi.inquiryNo }">
	                    <div class="inquiryInfo">
	                        <dl>
	                            <dt><b>제목 : ${ vi.inquiryTitle }</b></dt><br>
	                            <dd>
	                                <span> ${ vi.inquiryContent }</span><br>
	                                <span class="qnaDate"><small>${ vi.inquiryDate }</small></span>
	                                <button type="button" class="inputBtn" onclick="">삭제</button>
	                            </dd>
	                        </dl>
	                    </div><hr>
	                    <div class="inquiryReply">
	                        <dl>
	                            <dt><b>관리자 답변 :</b></dt><br>
	                            <dd>
	                                <span>${ vi.inquiryReply }</span><br>
	                                <span  class="qnaDate"><small>${ vi.inquiryDate }</small></span>
	                            </dd>
	                            <dd></dd>
	                        </dl>
	                    </div>
	                </div> 
                </c:forEach>
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
                    	<li class="page-item"><a class="page-link" href="myInquiry.mg?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<input type="hidden" name="userId" value="${ loginUser.userId }"> 
                   	<li class="page-item"><a class="page-link" href="myInquiry.mg?currentPage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myInquiry.mg?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                    </c:otherwise>
               	</c:choose>
            </ul>
        </div><br><br><br>
        
    </div>
    
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>