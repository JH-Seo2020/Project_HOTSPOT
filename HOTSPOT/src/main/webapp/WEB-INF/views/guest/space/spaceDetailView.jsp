<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 디테일페이지 css -->
<link rel="stylesheet" href="resources/css/guest/spaceDetailView.css" type="text/css"/>
<!-- 카카오지도 API -->
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="../../common/menubar.jsp"/>

    <!--여기서부터 상세정보 페이지-->
    
    <!-- 위치 자르기 (앞에서 두글자) -->
    <c:set var="location" value="${si.location}" />
    <c:set var="location2" value="${fn:substring(location,0,8)}" />
    
    <div id="infoWrapper">
        <div id="infoTitle">
            <div><h2>[${location2 }] &nbsp; ${si.spcName }</h2></div>
            <h4><div  class="badge badge-light">${si.spcInt }</div></h4>
            <h5><div  class="badge badge-light">#${si.spcTag }</div></h5>
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
                    <span><h4>${si.spcName }(최대 ${si.spcMax}명)</h4></span>
                    <span style="color: indigo; font-weight: bold;">￦${si.spcPrice }원 / 시간(인)</span>
                    <hr>
                    <h4><span class="badge badge-warning">대표 이미지</span></h4>
                    <img src="${si.spcChimg }">
                </div>
                <hr>
                <div>
                    <!--롤링배너-->
                    <h4><span class="badge badge-warning">상세 이미지</span></h4>
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                        	<div class="carousel-item active">
		                        	<img src="${si.spcChimg }" class="d-block w-100" alt="...">
	                        </div>
	                        <c:forEach var="imgs" items="${simg }">
		                        <div class="carousel-item">
		                        	<img src="${imgs.imgChimg }" class="d-block w-100" alt="...">
	                        	</div>
	                        </c:forEach>
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
                        <span class="badge badge-pill badge-dark">공간 유형</span>  ${si.spcType }<br><hr>
                        <span class="badge badge-pill badge-dark">예약 시간</span>  최소 1시간부터<br><hr>
                        <span class="badge badge-pill badge-dark">수용 인원</span>  최대 ${si.spcMax }명<br><hr>
                        <span class="badge badge-pill badge-dark">장비 및 주의사항</span>  <br>
                        <!-- 키워드 잘라서 넣기 -->
                        <c:set var="equip" value="${fn:split(si.spcConvn,',') }" />
                        <c:forEach var="e" items="${equip }">
                        	#${e }
                        </c:forEach>
                        
                        <br><hr>
                        <span class="badge badge-pill badge-dark">공간소개</span> <br>
                        ${si.spcLong }<br>
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
                        <c:forEach var="max" begin='1' end="${si.spcMax }">
                        	<option value="${max }">${max }</option>
                        </c:forEach>
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
        
        <script> <!-- Details 관련 -->
        	$(function(){
        		$("#infoDetails>h3").hover(function(){
        			$(this).css("cursor","pointer");
        		})
        		$("#d1").on("click",function(){$("#notices").css("display","block"); $("#notices").siblings("div").css("display","none");});
        		$("#d2").on("click",function(){$("#refundNotice").css("display","block"); $("#refundNotice").siblings("div").css("display","none");});
        		$("#d3").on("click",function(){$("#way").css("display","block"); $("#way").siblings("div").css("display","none");});
        		$("#d4").on("click",function(){$("#detailQnA").css("display","block"); $("#detailQnA").siblings("div").css("display","none");});
        		$("#d5").on("click",function(){$("#detailReviews").css("display","block"); $("#detailReviews").siblings("div").css("display","none");});
        	})
        </script>

        <div id="infoDetails">
            <h1><span class="badge badge-pill badge-dark">Details</span></h1><br>
            <h3><a id="d1">유의사항</a>&nbsp;|&nbsp;
                <a id="d2">환불정책</a>&nbsp;|&nbsp;
                <a id="d3">오시는길</a>&nbsp;|&nbsp;
                <a id="d4">Q&A</a>&nbsp;|&nbsp;
                <a id="d5">이용후기</a>&nbsp;
            </h3>
            <hr>
            <div id="notices">
            	<br>
                <h4><span class="badge badge-pill badge-dark">#유의사항</span></h4>
                <br>
                <div style="font-size:18px; padding:2%;">
                	<c:forEach var="n" items="${snotes }" varStatus="count">
                		${count.count} | ${n.notesContent }<hr>
                	</c:forEach>
                	<br>
                </div>
            </div>
            <div id="refundNotice">
                <br>
                <h4><span class="badge badge-pill badge-dark">#환불정책</span></h4>
                <br>
                <div style="font-size:18px; padding:2%;">
						1. 주문 취소 및 반품<br>
						일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 
						그 청약철회 및 계약해제의 기간(통상 7일) 내에는 청약철회 등을 자유롭게 할 수 있습니다
						(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항). <hr>
						2. 주문 취소 및 반품 가능 기간<br>
						인터넷에서 물품을 주문한 후 7일 이내에는 주문을 취소하거나 반품을 할 수 있습니다
						(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항). <hr>
                	<br>
                </div>
            </div>
            <div id="way">
                <br>
                <h4><span class="badge badge-pill badge-dark">#오시는길</span></h4>
                <br>
            	<p style="font-size:20px;"> 위치 : ${si.location }
            	<br>
            	<div id="map" style="width:1100px;height:400px;"></div>
            	<br>
            	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=590a097d538fbc24341f63791cee314f"></script>
            </div>
            
            <script>
	            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	            var options = { //지도를 생성할 때 필요한 기본 옵션
	            	center: new kakao.maps.LatLng('${si.latitude}', '${si.longitude}'), //지도의 중심좌표.
	            	level: 3 //지도의 레벨(확대, 축소 정도)
	            };
	
	            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
            </script>
            
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
	            <div id="pagination">
	                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">이전</button>
	                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">1</button>
	                <button class="badge badge-pill badge-warning" style="background-color: rebeccapurple; color: white;">2</button>
	            </div>
            </div>
            <div id="detailReviews">
                <br>
                <h4><span class="badge badge-pill badge-dark">#이용후기</span></h4>
            <!-- 리뷰 추가할거야 -->
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
                <span><h5>호스트A</h5></span> <br>
                <span><h5>"경복궁 옆에서 카페를 운영중인 호스트입니다"</h5></span> <br>
                <form action="hostHpg.guest" method="post" >
                	<input type="hidden" value="${si.userId }" name="userId" />
                	<input type="hidden" value="${si.spcNo }" name="spcNo" />
                	<h4><button class="badge badge-pill badge-warning">호스트의 홈피로 이동</button></h4>
        		</form>
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
                <button type="submit" class="btn btn-primary" style="background-color: slateblue; border: none;">질문하기</button>
                </div>
            </div>
            </div>
        </form>
    </div>



    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>