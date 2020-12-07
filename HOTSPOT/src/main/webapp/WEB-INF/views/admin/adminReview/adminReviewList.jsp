<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="resources/css/admin/adminReviewList.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="outer">
    <%@ include file="../../common/menubar.jsp"%>
    	<%@ include file="../sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>후기관리</span>
            </div>

            <!-- <form action="reviewList.ad" method="post" id="form_reviewList"> -->
            <div id="reviewList">
                <select id="select_reviewSearchSelect" name="reviewSearchSelect" class="custom-select custom-select-sm mb-3">
                    <option selected disabled>선택</option>
                    <option value="review_writer">작성자</option>
                    <option value="spc_no">공간번호</option>
                </select>
                <input type="text" id="input_reviewSearch" class="form-control" name="reviewSearch">
                <button class="btn" id="btn_reviewSearch">검색</button>
                <select id="select_reviewStatus" name="reviewStatus" class="custom-select custom-select-sm mb-3">
                    <option value="Y">Y</option>
                    <option value="N">N</option>
                </select>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th width="30px">후기번호</th>
                        <th width="30px">공간번호</th>
                        <th width="70px">작성자</th>
                        <th width="200px">제목</th>
                        <th width="20px">별점</th>
                        <th width="70px">작성일</th>
                        <th width="45px">후기상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="re" items="${ list }">
	                        <tr>
	                            <td>${ re.reviewNo }</td>
	                            <td>${ re.spcNo }</td>
	                            <td>${ re.reviewWriter }</td>
	                            <td>${ re.reviewTitle }</td>
	                            <td>${ re.reviewScore }</td>
	                            <td>${ re.reviewDate }</td>
	                            <td>${ re.reviewStatus }</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                  </table>
                  <ul class="pagination pagination-sm">
                  	<c:choose>
                  		<c:when test="${ pageInfo.currentPage eq 1 }">
                  			<li class="page-item disabled"><a class="page-link">Previous</a></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li class="page-item"><a class="page-link" href="reviewList.adsearchOption=?currentPage=${ pageInfo.currentPage-1 }">Previous</a></li>
                  		</c:otherwise>
                  	</c:choose>
                    
                    <c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
	                    <li class="page-item">
	                    <a class="page-link" href="reviewList.ad?currentPage=${ page }">${ page }</a>
	                    </li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
                    		<li class="page-item disabled"><a class="page-link">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="reviewList.ad?currentPage=${ pageInfo.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                  </ul>
            </div>
            <!-- </form> -->
        </div>
    </div>
    <script>
    	$(function(){
    		// 테이블 행 누를경우
    		$(".table tbody>tr").click(function(){
    			// 후기번호 넘기면서 상세화면요청
    			var reviewNo = $(this).children().eq(0).text();
    			location.href = "reviewDetail.ad?reviewNo=" + reviewNo; 
    		});
    		// 검색버튼누를경우
    		$("#btn_reviewSearch").click(function(){
			var searchOption = $("#select_reviewSearchSelect").val();		// ''/'작성자'/'공간번호'	
			var searchWord = $("#input_reviewSearch").val();				// ''/검색내용			
			var status = $("#select_reviewStatus").val();					// 'Y'/'N'
    			location.href = "reviewList.ad?searchOption=" + searchOption + "&searchWord=" + searchWord + "&status=" + status;	
    		});
    	});
    </script>
</body>
</html>