<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<link rel="stylesheet" href="resources/css/host/hostinquiry.css" type="text/css"/>


</head>
<body>
<jsp:include page="../common/hostMenubar.jsp" />
	

<jsp:include page="../common/subMenubar.jsp" />
   
   <div id="inquiryContainer">
   		<div class="inquiry_head">
   			<p style="color: white; font-size:18px;">1:1 문의 </p>
   			<div class="inquiryTitleBox">
	   			<div class="myinquiry">
	   				<h4 class="title">나의 문의 내역 </h4>
	   			</div>
				<button id="writeBtn"class="btn btn-warning"><a href="hostInquiryForm.ho" style="text-decoration:none;color:white;">글쓰기</a></button>
			</div>
   		</div>
   		<div class="inquiry_body" style="background-color:#f5f5f5; margin-top: 150px; border-radius:10px; padding:4px">
   			
   			<div class="inq_1">
   				   <div class="question">
	                    <h4>제목 : 호스트등록 정보 수정문의</h4><Br>
	                    <h5 style="margin-right: 200px;">Q. 상호명수정어디서하나요</h5><br>
	                    <p class="qdate"style="margin-right: 200px !important;">2020-01-01</p>
	                    <button id="deleteBtn"class="btn btn-primary">삭제</button>
	                </div><hr>
	                <div class="answer">
	                    <h4>관리자 답글</h4><br>
	                   	<h5>A. 호스트페이지 공간정보관리 에서 하면 됩니다.</h5><br>
	                   	<p class="qdate"style="margin-right: 200px !important;">2020-01-01</p> 	
	                   	<!--	<h5>답변이 작성되지 않았습니다.</h5> -->
	                </div>
   			</div>
   				<div class="inq_1">
   				   <div class="question">
	                    <h4>제목 : 호스트등록 정보 수정문의</h4><Br>
	                    <h5 style="margin-right: 200px;">Q. 상호명수정어디서하나요</h5><br>
	                    <p class="qdate"style="margin-right: 200px !important;">2020-01-01</p>
	                    <button id="deleteBtn"class="btn btn-primary">삭제</button>
	                </div><hr>
	                <div class="answer">
	                    <h4>관리자 답글</h4><br>
	                   	<h5>A. 호스트페이지 공간정보관리 에서 하면 됩니다.</h5><br>
	                   	<p class="qdate"style="margin-right: 200px !important;">2020-01-01</p> 	
	                   	<!--	<h5>답변이 작성되지 않았습니다.</h5> -->
	                </div>
   			</div>
   				<div class="inq_1">
   				   <div class="question">
	                    <h4>제목 : 호스트등록 정보 수정문의</h4><Br>
	                    <h5 style="margin-right: 200px;">Q. 상호명수정어디서하나요</h5><br>
	                    <p class="qdate"style="margin-right: 200px !important;">2020-01-01</p>
	                    <button id="deleteBtn"class="btn btn-primary">삭제</button>
	                </div><hr>
	                <div class="answer">
	                    <h4>관리자 답글</h4><br>
	                   	<h5>A. 호스트페이지 공간정보관리 에서 하면 됩니다.</h5><br>
	                   	<p class="qdate"style="margin-right: 200px !important;">2020-01-01</p> 	
	                   	<!--	<h5>답변이 작성되지 않았습니다.</h5> -->
	                </div>
   			</div>
   		
   		</div>
   		<!-- 페이징 처리 -->
   		 <div id="pagingArea">
          <ul class="pagination" style="margin-top:100px;margin-left:700px;">
          	<c:choose>
          		<c:when test="${ pi.currentPage eq 1 }">
               	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
               </c:when>
               <c:otherwise>
               	<li class="page-item"><a class="page-link" href="selectQnaList.ho?currentPage=${ pi.currentPage-1 }">Previous</a></li>
               </c:otherwise>
              </c:choose>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item"><a class="page-link" href="selectQnaList.ho?currentPage=${ p }">${ p }</a></li>
              </c:forEach>
              
              <c:choose>
              	<c:when test="${ pi.currentPage eq pi.maxPage }">
               	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
               </c:when>
               <c:otherwise>
               	<li class="page-item"><a class="page-link" href="selectQnaList.ho??currentPage=${ pi.currentPage+1 }">Next</a></li>
               </c:otherwise>
              </c:choose>
              
          </ul>
      </div>
   </div>
</body>
</html>