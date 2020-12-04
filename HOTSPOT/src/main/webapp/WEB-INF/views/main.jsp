<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫스팟(main.hotspot)</title>
<!-- 메인화면 css -->
<link rel="stylesheet" href="resources/css/guest/main.css" type="text/css"/>
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="common/menubar.jsp"/>
    
    
    <!--여기서부터 메인화면-->
    <div id="spaceIcons">
        <div><img src="resources/images/party.png" onclick="goSearch('파티룸');"><Br><span class="half_background3">파티룸</span></div>
        <div><img src="resources/images/coworking.png" onclick="goSearch('회의실');"><Br><span class="half_background3">회의실</span></div>
        <div><img src="resources/images/studio.png" onclick="goSearch('촬영스튜디오');"><Br><span class="half_background3">촬영스튜디오</span></div>
        <div><img src="resources/images/coffee.png" onclick="goSearch('카페');"><Br><span class="half_background3">카페</span></div>
        <div><img src="resources/images/dancing.png" onclick="goSearch('공연장/연습실');"><Br><span class="half_background3">공연장/연습실</span></div>
        <div><img src="resources/images/rooftop.png" onclick="goSearch('루프탑');"><Br><span class="half_background3">루프탑</span></div>
        <div><img src="resources/images/hanok.png" onclick="goSearch('한옥');"><Br><span class="half_background3">한옥</span></div>
    </div>
    
    <script>
    	$(function(){
    		$("#spaceIcons>div").hover(function(){
    			$(this).css("cursor","pointer");
    		});
    	});
    	function goSearch(space){
    		location.href="search.hotspot?searchWord="+space;
    	}
    </script>

    <!--롤링배너-->
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="resources/images/bannerSample_1.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h2>"이런 공간은 어떠신가요?"</h2>
              <p>가구는 직접 들이셔야 합니다</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="resources/images/bannerSample_2.png" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h2 style="color: #37363D;">"고급진 사진을 구하고 싶은데 어디서 구할까요..?"</h2>
              <p style="color: #37363D;">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>

    <div id="todayBest">
        <div id="todayBestTitle">
            <h2>오늘의 공간 </h2>
            <span class="bottom-line half_background">오늘의 가장 인기있는 공간을 만나보세요.</span>
        </div>
        <div id="todaySpaceGroup">
        	<c:forEach var="today" items="${todayList }">
        		
        		<!-- 위치 자르기 (앞에서 두글자) -->
        		<c:set var="location" value="${today.location}" />
        		<c:set var="location2" value="${fn:substring(location,0,2)}" />
        		
		            <div class="todaySpace">        	
		                <img src="${today.spcChimg }" onclick="move(${today.spcNo})">	
		                <div style="font-weight: bold; font-size: 20px;">[${today.spcName }]</div>
		                <div style="color:gray;">${location2} | ${today.spcTag }</div>
		                <div>
		                    <span style="color: rebeccapurple; font-weight: bold;">${today.spcPrice }원/시간</span>
		                    <span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">후기 ${today.reviews }개</span>
		                    <span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">관심 ${today.wishes }개</span>
		                </div>
		            </div>
		            
        	</c:forEach>
        </div>
    </div>

    <div id="userReview">
        <div id="userReviewTitle">
            <h2>이용자 후기</h2>
            <span class="bottom-line half_background">이용자들의 생생한 후기를 읽어보세요.</span>
        </div>
        <div id="userReviewGroup">
        	<c:forEach var="review" items="${reviewList }">
       
        		<!-- 위치 자르기 (앞에서 두글자) -->
        		<c:set var="where" value="${review.location}" />
        		<c:set var="where2" value="${fn:substring(where,0,2)}" />
        	
		            <div class="spaceReview">
		                <img src="${review.spcChimg }" onclick="move(${review.spcNo})">
		                <div style="font-weight: bold; font-size: 20px;">[${review.spcName }]</div>
		                <div style="color:gray;">${where2} | ${review.spcTag }</div>
		                <div>
		                    <span style="color: rebeccapurple; font-weight: bold;">${review.spcPrice }원/시간</span>
		                </div>
		                	<div class="badge badge-pill badge-warning">
		                		<c:forEach var="i" begin="1" end="${review.reviewScore }" step="1"> 
		                			★
				                </c:forEach>
		                	</div>
		                	<br>
		                <c:choose>
		                	<c:when test="${fn:length(review.reviewCon) gt 30 }">
		                		<span class="half_background2" style="font-size:13px;">"${review.reviewCon }.."</span>
		                	</c:when>
		                	<c:otherwise>
		                		<span class="half_background2" style="font-size:13px;">"${review.reviewCon }"</span>
		                	</c:otherwise>
		            	</c:choose>
		            </div>
		            
        	</c:forEach>    
        </div>
    </div>
    
    <script>
    	function move(spcNo){
    		location.href="spaceDetail.guest?spcNo="+spcNo;
    	}
    	$(function(){
    		$(".todaySpace img, .spaceReview img").hover(function(){
    			$(this).css("cursor","pointer");
    		})
    	})
    	
    </script>
    
    
    <!-- 푸터 -->
    <jsp:include page="common/footer.jsp"/>

</body>
</html>