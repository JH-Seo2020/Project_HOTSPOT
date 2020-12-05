<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 호스트홈피 CSS -->
<link rel="stylesheet" href="resources/css/guest/hostHmpView.css" type="text/css"/>
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="hostSiteWrap">
        <div id="whoishost">
                <h2>호스트 소개</h2>
            <br>
            <div id="hostIntroducingSpace">
                <div id="hostPhotoForIntro">
                    <img src="${mm.profilePath}${mm.userProfileC }">
                </div>
                <div id="goToHostPage">
                    <span style="color: indigo; font-weight: bold;">HOST</span>
                    <span><h4>${mm.userNickname }</h4></span> <br>
                    <span><h4>"안녕하세요, 호스트 ${mm.userNickname }입니다."</h4></span> <br>
                </div>
            </div>
        </div>
        <hr>
        <div id="todayBest">
            <div id="todayBestTitle">
                <h2>호스트의 공간 ${hs.size() }개</h2>
            </div>
            <div id="todaySpaceGroup">
            <c:forEach var="hs" items="${hs }">
                <div class="todaySpace">
                    <img src="${hs.spcChimg }">
                    <div style="font-weight: bold; font-size: 20px;">${hs.spcName }</div>
                    
                    <!-- 위치 자르기 (앞에서 두글자) -->
	        		<c:set var="spaceLoca" value="${hs.location}" />
	        		<c:set var="spaceLoca2" value="${fn:substring(spaceLoca,0,6)}" />
	        		
	        		<!-- 키워드 잘라서 넣기 -->
                    <c:set var="tags" value="${fn:split(hs.spcTag,',') }" />
                    
                    <div>${spaceLoca2 } | 
	                    <c:forEach var="tag" items="${tags }">
	                    	${tag }
	                    </c:forEach>                    
                    </div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">${hs.spcPrice }원/시간</span>
                        <span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">후기 ${hs.reviews }개</span>
                        <span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">관심 ${hs.wishes }개</span>
                    </div>
                </div>
			</c:forEach>
            </div>
        </div>
        <hr>
        <div id="infoDetails">
            <div id="detailQnA">
                <br>
                <h2>이용후기 ${listCount}개</h2>
                <br>
 				<c:forEach var="r" items="${rv }" >
	                <div class="qnaContent">
	                    <div class="personImgs">
	                        <img src="${r.profilePath }${r.userProfileCh}" >
	                    </div>
	                    <div class="qna">
	                        <span><h4>${r.userNickname }</h4></span> 
	                        <span class="badge badge-pill badge-warning">
	                        	<c:forEach var="star" begin="1" end="${r.reviewScore }">
	                        		★
	                        	</c:forEach>
	                        </span> <br>
	                        <span><h4>${r.reviewCon }
	                        </h4></span>
	                        <span style="color: gray;"><h6>${r.reviewDate }</h6></span>
	                        <c:if test="${loginUser != null }">
	                        	<a id="reportModal" class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;"><h8>신고하기</h8></a>
	                        </c:if>
	                        <br><Br>
	                    </div>
	                </div>
	                <div class="qnaContent" >
	                    <div class="qna">
	                        
	                        <c:choose>
		                        <c:when test="${r.reviewReply eq null }">
		                        	
		                        </c:when>
		                        <c:otherwise>
		                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
			                        <span><h5>${r.reviewReply }</h5></span>
		                        </c:otherwise>
		                    </c:choose>
	                        <span style="color: gray;"><h6>${r.reviewReplyDate }</h6></span>
	                    </div>
	                </div>
	                <hr>
            	</div>
            	
    <script>
    	var loginUser = '${loginUser}';
    	$(function(){
    		if(loginUser == ''){
    			$("#reportModal").css("display","none");
    		}else{
    			$("#reportModal").css("display",true);
    		}
    	})
    </script>
            	
			    <!--신고모달-->
			    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			        <form method="post" action="report.guest">
			            <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header" style="background-color: slateblue;">
			                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                        <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <div class="modal-body">
			                    <table class="table table-borderless">
			                    <input type="hidden" name="hostUserId" value="${hostUserId }" />
			                    <input type="hidden" name="spcNo" value="<%=0 %>" />
			                    <input type="hidden" name="reviewNo" value="${r.reviewNo }"/>
			                        <tbody>
			                          <tr>
			                            <th scope="row">신고유형</th>
			                            <td>
			                                <select name="reportType1" class="custom-select">
			                                    <option>공간신고</option>
			                                    <option>후기신고</option>
			                                    <option>게스트신고</option>
			                                    <option>호스트신고</option>
			                                </select>
			                            </td>
			                          </tr>
			                          <tr>
			                            <th scope="row">신고 상세유형</th>
			                            <td>
			                                <select name="reportType2"  class="custom-select">
			                                    <option>기물파손</option>
			                                    <option>태도불량</option>
			                                    <option>서비스불만족</option>
			                                    <option>허위내용</option>
			                                    <option>광고</option>
			                                    <option>기타</option>
			                                </select>
			                            </td>
			                          </tr>
			                          <tr>
			                            <th scope="row">신고자</th>
			                            <td><input type="text" name="reportWriter" value="${loginUser.userId }" class="form-control"></td>
			                          </tr>
			                          <tr>
			                            <th scope="row">신고대상</th>
			                            <c:set var="hostId" value="${r.reviewWriter }" />
			                            <td><input type="text" name="reportTarget" value="${hostId}" class="form-control"></td>
			                          </tr>
			                          <tr>
			                            <th scope="row">신고 내용</th>
			                            <td ><input type="text" name="reportContent" class="form-control" placeholder="신고내용을 적어주세요"></td>
			                          </tr>
			                        </tbody>
			                    </table>
			                </div>
			                <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			                <button type="submit" class="btn btn-primary" style="background-color: slateblue; border: none;">신고하기</button>
			                </div>
			            </div>
			            </div>
			        </form>
			    </div>
 
				</c:forEach>

            <div id="pagination">

        	<c:choose>
        		<c:when test="${pi.currentPage eq 1 }">
		            <a class="badge badge-pill purple disabled ">이전</a>
		        </c:when>
		        <c:otherwise>
		        	<a href="hostHpg.guest?currentPage=${pi.currentPage-1}&userId=${hostUserId}" class="badge badge-pill purple">이전</a>
		        </c:otherwise>
		    </c:choose>
		    
		    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
		            <a href="hostHpg.guest?currentPage=${p }&userId=${hostUserId}" class="badge badge-pill purple">${p }</a>
		    </c:forEach>
		            
		    <c:choose>
		    	<c:when test="${pi.currentPage eq pi.maxPage}" >
		    		<a class="badge badge-pill purple disabled ">다음</a>
		    	</c:when>
		    	<c:otherwise>
		    		<a href="hostHpg.guest?currentPage=${pi.currentPage +1 }&userId=${hostUserId}" class="badge badge-pill purple">다음</a>
		    	</c:otherwise>
		    </c:choose> 
			<br><Br>
            </div>
        </div>

    </div>
	
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
    
	<script>
		/*주소창 파라미터 없애기*/
		/*history.replaceState({}, null, location.pathname);*/
	</script>


	
</body>
</html>