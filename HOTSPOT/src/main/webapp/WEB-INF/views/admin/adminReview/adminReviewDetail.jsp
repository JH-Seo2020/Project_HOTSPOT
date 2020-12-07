<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="outer">
        <%@ include file="../../common/menubar.jsp"%>
        <!-- CSS -->
		<link href="resources/css/admin/adminReviewDetail.css" rel="stylesheet" type="text/css">
    	<%@ include file="../sidebarSunkyung.jsp"%>
        <div id="rightSpace">
            <div id="categoryName">
                <span>후기관리</span>
            </div>

            <!-- 후기상세 -->
            <div id="reviewDetailSpace">
                <table id="table_reviewInfo1">
                    <tr>
                        <th width="60px">후기번호</th>
                        <td width="90px">${ review.reviewNo }</td>
                        <th width="60px">공간번호</th>
                        <td width="90px">${ review.spcNo }</td>
                        <th width="60px">작성자</th>
                        <td width="330px">${ review.reviewWriter }</td>
                        <th width="47px">작성일</th>
                        <td width="100px">${ review.reviewDate }</td>
                    </tr>
                </table>
                <table id="table_reviewInfo2">
                    <tr>
                        <th width="540px">후기제목</th>
                        <th>별점</th>
                    </tr>
                    <tr>
                        <td>
                            <div id="selectUserId">${ review.reviewTitle }</div>
                        </td>
                        <td>
                            <div id="selectScore">
                             	<c:forEach var="i" begin="1" end="${ review.reviewScore }" step="1">
								       <img class="img_scoreIcon" src="resources/images/admin/scoreIcon1.png">
								</c:forEach>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">후기내용</th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="selectReviewContent">${ review.reviewContent }</div>
                        </td>
                    </tr>
                </table>
                <c:choose>
                	<c:when test="${ review.reviewStatus eq 'Y'}">
                		<button class="btn" value="${ review.reviewNo }">숨기기</button>
                	</c:when>
                	<c:otherwise>
                		<span style="color:red; float:right; margin-right: 25px; margin-top: 388px;">숨겨진 후기입니다.</span>
                	</c:otherwise> 
                </c:choose> 
            </div>
        </div>
    </div>
    <script>
    	$(function(){
    		// 숨기기버튼 선택시
    		$(".btn").click(function(){
    			var question = confirm("블라인드처리 하시겠습니까?");
    			if(question){
    				$.ajax({
    					url: "updateStatus.ad",
    					data: {
    						reviewNo:$(this).val()
    						}, 
    					success: function(result){
    						location.href="reviewList.ad";
    						alert("해당 리뷰가 블라인드처리 되었습니다.");
    					},
    					error: function(){
    						alert("해당 리뷰가 블라인드처리에 실패되었습니다.");
    					}
    				});   	
    			}
    		});
    	});
    </script>
</body>
</html>