<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    /*여기서부터 상세정보 - css파일로 따로 뺄 예정..*/
        #infoWrapper{
            background-color: lavender;
            width: 100%;
            height: auto;
        }
        #infoTitle{
            margin: auto;
            text-align: left;
            padding: 5% 0 1% 0;
            width: 1200px;
            height: 11%;
        }
        #wishandlike{
            width: 680px; 
            height: 30px; 
            text-align: right;
        }

        #wishandlike>a>img{
            width: 6%;
            height: 90%;
            padding: 1px;
        }
        .infoClass{
            margin: 0 auto;
            width: 1200px;
            overflow: hidden;
        }
        #informations, #selections {
            float: left;
            margin: 0 1% 2% 0;
            padding:2% 2% 2% 2%;
            border: 2px indigo dashed ;
        }
        
        #informations{
            background-color: white;
            width: 690px;
        }
        #selections{
            background-color: white;
            width: 480px;
        }
        
        #titleImgOne>img{
            width: 100%;
            height: 80%;
        }
        #infoDetails{
            width: 1200px;
            height: 30%;
           padding: 3% 1% 1% 1%;
           margin: auto;
           text-align: left;
        }
        #infoDetails>h3>a{
            color: black;
            text-decoration: none;
        }
        /*QnA부분*/
        #detailQnA{ width: 1200px;}
        #detailQnA>h5{text-align: right;}

        .qnaContent{width: 1200px; }
        .qnaContent>div{display: inline-block; margin-left: 2%;}
        .personImgs{width: 150px; height: 150px;  vertical-align: top !important;}
        .personImgs>img{height: 100%; width: 100%; border-radius: 100%;}
        .qna{height: 100%;}

        #pagination{text-align: center !important; font-size: 20px;}
        #pagination>button{border: none;}
        
        /*호스트홈피소개부분*/
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
        #hostPhotoForIntro{width: 25%; height: 100%;}
        #hostPhotoForIntro>img{height: 80%; width: 80%; border-radius: 100%;}
	
</style>
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="../common/menubar.jsp"/>

    <!--여기서부터 상세정보 페이지-->
    <div id="infoWrapper">
        <div id="infoTitle">
            <div><h2>[경복궁역] 한옥카페 '그리다꿈'</h2></div>
            <h4><div  class="badge badge-light">종로구</div></h4>
            <h5><div  class="badge badge-light">#한옥카페 #그리다꿈#CSS노가다#부트스트랩그만쓰고싶다</div></h5>
            <div id="wishandlike">
                <a data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;">
                    <img src="resources/images/report.png">
                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href=""><img src="resources/images/heart_ready.png"></a>
            </div>
        </div>
        <div class="infoClass">
            <div id="informations">
                <div id="titleImgOne">
                    <span><h4>그리다꿈(최대 8명)</h4></span>
                    <span style="color: indigo; font-weight: bold;">￦20,000원 / 시간(인)</span>
                    <hr>
                    <h4><span class="badge badge-warning">대표 이미지</span></h4>
                    <img src="resources/images/space1.jpg">
                </div>
                <hr>
                <div>
                    <!--롤링배너-->
                    <h4><span class="badge badge-warning">상세 이미지</span></h4>
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="resources/images/space1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="resources/images/space1.jpg" class="d-block w-100" alt="...">
                        </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <hr>
                    <div>
                        <span class="badge badge-pill badge-dark">공간 유형</span> : 파티룸<br><hr>
                        <span class="badge badge-pill badge-dark">예약 시간</span> : 최소 1시간부터<br><hr>
                        <span class="badge badge-pill badge-dark">수용 인원</span> : 최대 8명<br><hr>
                        <span class="badge badge-pill badge-dark">장비 및 주의사항</span> : <br>
                        #의자 #테이블 #인쇄기 #노트북 #와이파이 <br><hr>
                        <span class="badge badge-pill badge-dark">제발 부탁드립니다!</span> <br>
                        1. 새벽에 노래하지 마세요 <br>
                        2. 새벽에 요리하지 마세요 <br>
                        3. 퇴실 시간 지켜주세요 <br>
                    </div>
                </div>
            </div>
            <div id="selections">
                <span style="color: rebeccapurple; font-weight: bold;">날짜를 선택해주세요</span>
                <hr>
                <p><input type="text" id="datepicker" class="form-control" placeholder="시작일"></p>
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect01">
                        <option selected>시작시간</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <p><input type="text" id="datepicker" class="form-control" placeholder="종료일"></p>
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect01">
                        <option selected>종료시간</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <br>
                <span style="color: rebeccapurple; font-weight: bold;">인원을 선택해주세요</span>
                <hr>
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect01">
                        <option selected>인원수</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <button type="button" class="btn btn-warning btn-lg btn-block" style="background-color: lavender; border: none;">예상금액 확인</button>
                <br><br>
                <span style="color: rebeccapurple; font-weight: bold;">결제정보</span>
                <hr>
                <table class="table table-borderless">
                    <tbody>
                      <tr>
                        <th scope="row">공간명</th>
                        <td>그리다꿈</td>
                      </tr>
                      <tr>
                        <th scope="row">날짜</th>
                        <td>2020.02.02 16:00 - 2020.02.03 15:00</td>
                      </tr>
                      <tr>
                        <th scope="row">시간</th>
                        <td>23시간</td>
                      </tr>
                      <tr>
                        <th scope="row">인원</th>
                        <td>4명</td>
                      </tr>
                      <tr>
                        <th scope="row" style="color: rebeccapurple">총금액</th>
                        <td >1000000원</td>
                      </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-warning btn-lg btn-block" style="background-color: rebeccapurple; color:white; border: none;">예약하기</button>  
            </div>
        </div>

        <script>
            $( function() {
              $( "#datepicker" ).datepicker({
                showButtonPanel: true
              });
            } );
        </script>

        <div id="infoDetails">
            <h1><span class="badge badge-pill badge-dark">Details</span></h1><br>
            <h3><a href="">유의사항</a>&nbsp;|&nbsp;
                <a href="">환불정책</a>&nbsp;|&nbsp;
                <a href="">오시는길</a>&nbsp;|&nbsp;
                <a href="">Q&A</a>&nbsp;|&nbsp;
                <a href="">이용후기</a>&nbsp;
            </h3>
            <hr>
            <div id="detailQnA">
                <br>
                <h4><span class="badge badge-pill badge-dark">#QnA 5개</span></h4>
                <h5><a class="badge badge-pill badge-warning" data-toggle="modal" data-target="#questionToHost" style="cursor: pointer;">✏호스트에게 질문하기</a></h5>
                <br>
                <div class="qnaContent">
                    <div class="personImgs">
                        <img src="resources/images/bannerSample_1.jpg" >
                    </div>
                    <div class="qna">
                        <span><h4>painkiller</h4></span> <span>😀후기에서 별점들어갈위치</span> <br>
                        <span><h4>이용하고싶은데 방법이뭐죠</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                        <a class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;"><h8>신고하기</h8></a>
                        <br><Br>
                    </div>
                </div>
                <div class="qnaContent" >
                    <div class="personImgs"></div>
                    <div class="qna">
                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
                        <span><h4>일주일 뒤에 답변 드리겠습니다</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                    </div>
                </div>
                <hr>
                <div class="qnaContent">
                    <div class="personImgs">
                        <img src="resources/images/bannerSample_1.jpg" >
                    </div>
                    <div class="qna">
                        <span><h4>painkiller</h4></span> <span>😀😀😀😀</span><br>
                        <span><h4>이용하고싶은데 방법이뭐죠</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                        <a class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;"><h8>신고하기</h8></a>
                        <br><Br>
                    </div>
                </div>
                <div class="qnaContent" >
                    <div class="personImgs"></div>
                    <div class="qna">
                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
                        <span><h4>일주일 뒤에 답변 드리겠습니다</h4></span>
                        <span style="color: gray;"><h6>00월00일00시00초</h6></span>
                    </div>
                </div>
            </div>
            <div id="pagination">
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">이전</button>
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">1</button>
                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">2</button>
            </div>
        </div>
    </div>

    <div id="whoishost">
        <h2>호스트 소개</h2>
        <br>
        <div id="hostIntroducingSpace">
            <div id="hostPhotoForIntro">
                <img src="resources/images/bannerSample_1.jpg" >
            </div>
            <div id="goToHostPage">
                <span style="color: indigo; font-weight: bold;">HOST</span>
                <span><h4>호스트A</h4></span> <br>
                <span><h4>"경복궁 옆에서 카페를 운영중인 호스트입니다"</h4></span> <br>
                <h4><a href="#" class="badge badge-pill badge-warning">호스트의 홈피로 이동</a></h4>
        	</div>
    	</div>
    </div>
    
    
    

    <!--신고모달-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form method="" action="">
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
                        <tbody>
                          <tr>
                            <th scope="row">신고유형</th>
                            <td>
                                <select class="custom-select">
                                    <option>공간신고</option>
                                </select>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row">신고 상세유형</th>
                            <td>
                                <select class="custom-select">
                                    <option>광고</option>
                                </select>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row">신고대상</th>
                            <td><input type="text" class="form-control"></td>
                          </tr>
                          <tr>
                            <th scope="row">신고자</th>
                            <td><input type="text" class="form-control"></td>
                          </tr>
                          <tr>
                            <th scope="row">신고 내용</th>
                            <td ><input type="text" class="form-control" placeholder="신고내용을 적어주세요"></td>
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

    <!--질문하기 모달-->
    <div class="modal fade" id="questionToHost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form method="" action="">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: slateblue; color: white;">
                    <h5 class="modal-title" id="exampleModalLabel">호스트에게 질문하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h3><span class="badge badge-pill badge-dark">질문</span></h3><hr>
                    <textarea class="form-control" placeholder="질문을 남겨주세요"></textarea>
                    <br>
                    <input type="checkbox"> &nbsp;&nbsp;비공개
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" style="background-color: slateblue; border: none;">신고하기</button>
                </div>
            </div>
            </div>
        </form>
    </div>



    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>