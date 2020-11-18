<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #hostSiteWrap{
        width: 1200px;
        height: auto;
        margin: auto;
        margin-bottom: 3%;
    }
    #whoishost{
        width: 1200px;
        margin: auto;
        height: 300px;
        padding: 3% 1% 1% 1%;
    }
    #hostIntroducingSpace{
        width: 100%;
        height: 270px;
    }
    #hostIntroducingSpace>div{float: left;}
    #hostPhotoForIntro{width: 20%; height: 80%;}
    #hostPhotoForIntro>img{height: 70%; width: 70%; border-radius: 100%;}
    /*호스트의공간*/
    #todayBest{
        width: 100%;
        height: auto;
    }
    #todayBestTitle{
        padding: 1% 0 0 1%;
        width: 100%;
        height: 20%;
    }
    #todaySpaceGroup{
        width: 1200px;
        height: 90%;
        padding-top: 6%;
        text-align: left;
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

    #infoDetails>h3>a{
        color: black;
        text-decoration: none;
    }
    /*이용후기*/
    #detailQnA{ width: 1200px;}
    #detailQnA>h5{text-align: right;}

    .qnaContent{width: 1200px; }
    .qnaContent>div{display: inline-block; margin-left: 2%;}
    .personImgs{width: 150px; height: 150px;  vertical-align: top !important;}
    .personImgs>img{height: 100%; width: 100%; border-radius: 100%;}
    .qna{height: 100%;}

    #pagination{text-align: center !important; font-size: 20px;}
    #pagination>button{border: none;}
</style>
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
                    <img src="bannerSample_1.jpg" >
                </div>
                <div id="goToHostPage">
                    <span style="color: indigo; font-weight: bold;">HOST</span>
                    <span><h4>호스트A</h4></span> <br>
                    <span><h4>"경복궁 옆에서 카페를 운영중인 호스트입니다"</h4></span> <br>
                    <h4><a href="#" class="badge badge-pill badge-warning">호스트의 홈피로 이동</a></h4>
                </div>
            </div>
        </div>
        <hr>
        <div id="todayBest">
            <div id="todayBestTitle">
                <h2>호스트의 공간 2개</h2>
            </div>
            <div id="todaySpaceGroup">
                <div class="todaySpace">
                    <img src="space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                    </div>
                </div>
                <div class="todaySpace">
                    <img src="space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                    </div>
                </div>
                <div class="todaySpace">
                    <img src="space1.jpg">
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
        <hr>
        <div id="infoDetails">
            <div id="detailQnA">
                <br>
                <h2>이용후기 5개</h2>
                <br>
                <div class="qnaContent">
                    <div class="personImgs">
                        <img src="bannerSample_1.jpg" >
                    </div>
                    <div class="qna">
                        <span><h4>painkiller</h4></span> 
                        <span class="badge badge-pill badge-warning">★★★★★</span> <br>
                        <span><h4>여기 한번 이용해봣는데 괜찮앗어요 다음에 또 빌릴듯?
                        </h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                        <a class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;"><h8>신고하기</h8></a>
                        <br><Br>
                    </div>
                </div>
                <div class="qnaContent" >
                    <div class="personImgs"></div>
                    <div class="qna">
                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
                        <span><h4>아이고 감사합니다</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                    </div>
                </div>
                <hr>
                <div class="qnaContent">
                    <div class="personImgs">
                        <img src="bannerSample_1.jpg" >
                    </div>
                    <div class="qna">
                        <span><h4>painkiller</h4></span> 
                        <span class="badge badge-pill badge-warning">★★★★★</span> <br>
                        <span><h4>여기 한번 이용해봣는데 괜찮앗어요 다음에 또 빌릴듯?
                        </h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                        <a class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;"><h8>신고하기</h8></a>
                        <br><Br>
                    </div>
                </div>
                <div class="qnaContent" >
                    <div class="personImgs"></div>
                    <div class="qna">
                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
                        <span><h4>아이고 감사합니다</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                    </div>
                </div>
                <hr>
            </div>
            <div id="pagination">
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">이전</button>
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">1</button>
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">2</button>
            </div>
        </div>

    </div>
	
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
	
</body>
</html>