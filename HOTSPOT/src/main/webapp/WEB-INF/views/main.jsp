<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            height: 100%;
            width: 100%;
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
            height: 500px;
            background-color: lavender;
        }
        #todayBestTitle{
            text-align: center;
            padding-top: 3%;
            width: 100%;
            height: 10%;
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
            height: 100%;
            border: 5px solid tan;
        }
        /*이용자 후기*/
        #userReview{
            width: 100%;
            height: 1500px;
        }
        #userReviewTitle{
            text-align: center;
            padding-top: 3%;
            width: 100%;
            height: 50px;
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
            padding: 0 0 4% 4%;
            width: 30%; 
            height: 500px;
        }
        .spaceReview>img{
            width: 100%;
            height: 65%;
            border: 5px solid rebeccapurple;
        }
</style>
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="common/menubar.jsp"/>
    
    
    <!--여기서부터 메인화면-->
    <div id="spaceIcons">
        <div><img src="resources/images/party.png"><div class="badge badge-pill badge-warning">파티룸</div></div>
        <div><img src="resources/images/meeting.png"><div class="badge badge-pill badge-warning">회의실</div></div>
        <div><img src="resources/images/camera.png"><div class="badge badge-pill badge-warning">촬영스튜디오</div></div>
        <div><img src="resources/images/cafe.png"><div class="badge badge-pill badge-warning">카페</div></div>
        <div><img src="resources/images/dance.png"><div class="badge badge-pill badge-warning">공연장/연습실</div></div>
        <div><img src="resources/images/rooftop.png" ><div class="badge badge-pill badge-warning">루프탑</div></div>
        <div><img src="resources/images/hanok.png" ><div class="badge badge-pill badge-warning">한옥</div></div>
    </div>

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
              <h5>"이런 공간은 어떠신가요?"</h5>
              <p>가구는 직접 들이셔야 합니다</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="resources/images/bannerSample_2.png" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5 style="color: gray;">"줌배경사진을 가져와봤어요"</h5>
              <p style="color: gray;">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
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
            <h1>오늘의 공간</h1>
        </div>
        <div id="todaySpaceGroup">
            <div class="todaySpace">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                    <span class="badge badge-pill badge-warning">후기 10개</span>
                    <span class="badge badge-pill badge-warning">관심 7개</span>
                </div>
            </div>
            <div class="todaySpace">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                    <span class="badge badge-pill badge-warning">후기 10개</span>
                    <span class="badge badge-pill badge-warning">관심 7개</span>
                </div>
            </div>
            <div class="todaySpace">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                    <span class="badge badge-pill badge-warning">후기 10개</span>
                    <span class="badge badge-pill badge-warning">관심 7개</span>
                </div>
            </div>
        </div>
    </div>

    <div id="userReview">
        <div id="userReviewTitle">
            <h1>이용자 후기</h1>
        </div>
        <div id="userReviewGroup">
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
            <div class="spaceReview">
                <img src="resources/images/space1.jpg">
                <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                <div>종로구 | #한옥카페 #그리다꿈</div>
                <div>
                    <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                </div>
                <div class="badge badge-pill badge-warning">★★★★★</div>
                <div class="badge badge-light">아주 좋았어요! 어쩌구 저쩌구 40자에서 자를거야...</div>
            </div>
        </div>
    </div>
    
    
    
    <!-- 푸터 -->
    <jsp:include page="common/footer.jsp"/>

</body>
</html>