<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫스팟(main.hotspot)</title>
<style>
        /*여기서부터 메인화면 스타일*/
        #spaceIcons{
            width: 1200px;
            height: 150px;
            margin: auto;
            text-align: center; /*아이콘 중앙정렬용*/
        }
        #spaceIcons>div{
            margin : 2% 0 0 5%;
            width: 80px;
            height: 80px;
            display: inline-block;
        }
        #spaceIcons>div>img{
            height: 70%;
            width: 70%;
            margin-bottom: 10%;
        }
        /*롤링배너 사이즈*/
        #carouselExampleCaptions{
            width: 100%;
            height: 400px;
            border: 2px solid lavender;
        }
        .carousel-item>img{
            width: 100%;
            height: 400px;
        }
        /*오늘의공간(투데이베스트)*/
        #todayBest{
            width: 100%;
            height: 550px;
            background-color: lavender;
        }
        #todayBestTitle{
            text-align: center;
            padding-top: 3%;
            width: 100%;
            height: 12%;
        }
        #todaySpaceGroup{
            width: 1200px;
            height: 90%;
            padding-top: 6%;
            text-align: center;
            margin: auto;
        }
        .todaySpace{
            display: inline-block;
            padding: 0 0 4% 4%;
            width: 30%; 
            height: 80%;
        }
        .todaySpace>img{
            width: 100%;
            height: 90%;
            border: 5px solid lightgray;
           -webkit-transition: all 1s ease;
		   -moz-transition: all 1s ease;
		   -o-transition: all 1s ease;
		   -ms-transition: all 1s ease;
		   transition: all 1s ease;
		   margin-bottom:5%;
        }
        .todaySpace>img:hover{
		   -webkit-filter: brightness(50%);
		   filter: brightness(50%);
		    transform: scale(1.03);
        }
        /*이용자 후기*/
        #userReview{
            width: 100%;
            height: 1350px;
        }
        #userReviewTitle{
            text-align: center;
            padding-top: 3%;
            width: 100%;
            height: 60px;
        }
        #userReviewGroup{
            width: 1200px;
            height: 100%;
            padding-top: 6%;
            text-align: center;
            margin: auto;
        }
        .spaceReview{
            display: inline-block;
            padding: 0 0 1% 3%;
            width: 30%; 
            height: 400px;
            
        }
        .spaceReview>img{
            width: 100%;
            height: 55%;
            border: 5px solid lightgray;
           -webkit-transition: all 1s ease;
		   -moz-transition: all 1s ease;
		   -o-transition: all 1s ease;
		   -ms-transition: all 1s ease;
		   transition: all 1s ease;
		   margin-bottom:5%;
        }
        .spaceReview>img:hover{
		   -webkit-filter: brightness(50%);
		   filter: brightness(50%);
		   transform: scale(1.03);
        }
        .bottom-line{
        	border-bottom : 1px solid #FCE205;
        	box-shadow: inset 0 -2px 0 #FCE205;
        }
        .half_background{background: linear-gradient(to top, #FCE205 50%, transparent 50%);}
        .half_background2{background: linear-gradient(to top, #DCD0FF 50%, transparent 50%);}
        .half_background3{background: linear-gradient(to top, #DCD0FF 50%, transparent 50%); font-size:13px;}
		.img_hotspotLogo{
			width: 15px;
			height: 15px;
			margin-right: 5px;
		}
</style>
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
    		location.href="";
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
		                <img src="${today.spcChimg }">	
		                <div style="font-weight: bold; font-size: 20px;">[${today.spcName }]</div>
		                <div style="color:gray;">${location2} | #${today.spcTag }</div>
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
		                <img src="${review.spcChimg }">
		                <div style="font-weight: bold; font-size: 20px;">[${review.spcName }]</div>
		                <div style="color:gray;">${where2} | #${review.spcTag }</div>
		                <div>
		                    <span style="color: rebeccapurple; font-weight: bold;">${review.spcPrice }원/시간</span>
		                </div>
		                	<div class="badge badge-pill badge-warning">
		                		<c:forEach var="i" begin="1" end="${review.reviewScore }" step="1"> 
		                			★
				                </c:forEach>
		                	</div>
		                	<br>
		                <span class="half_background2">${review.reviewCon }</span>
		            </div>
		            
        	</c:forEach>    
        </div>
    </div>
    
    
    
    <!-- 푸터 -->
    <jsp:include page="common/footer.jsp"/>

</body>
</html>