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
<!-- moment js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
</head>
<body>

	<!-- 메뉴바 -->
    <jsp:include page="../../common/menubar.jsp"/>

    <!--여기서부터 상세정보 페이지-->
    
    <!-- 위치 자르기 (앞에서 두글자) -->
    <c:set var="location" value="${si.location}" />
    <c:set var="location2" value="${fn:substring(location,0,7)}" />
    
    <div id="infoWrapper">
        <div id="infoTitle">
            <div><h2>[${location2 }] &nbsp; ${si.spcName }</h2></div>
            <h4><div  class="badge badge-light">${si.spcInt }</div></h4>
            
            <!-- 키워드 잘라서 넣기 -->
            <c:set var="tags" value="${fn:split(si.spcTag,',') }" />
            <c:forEach var="tag" items="${tags }">        	
            	<h5><div  class="badge badge-light">${tag }</div></h5>
	        </c:forEach> 
	        
            <div id="wishandlike">
                <a data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;">
                    <img src="resources/images/report.png">
                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a><img id="likeImg" src="resources/images/heart_ready.png"></a>
            </div>
        </div>
        
        <script>
        	$(function(){
        		$("#likeImg").hover(function(){
        			$(this).css("cursor","pointer");
        		})
        	})
        </script>

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
            <form id="selections" action="reservation.guest" method="post">
            	<input type="hidden" name="userId" value="${loginUser.userId }" />
            	<input type="hidden" name="spcName" value="${si.spcName }"/>
            	<input type="hidden" name="spcNo" value="${si.spcNo }"	/>
            	<input type="hidden" name="userIdHost" value="${si.userId }" />
            	<input type="hidden" name="amountTime" value="${si.spcPrice }" />
            	
                <span style="color: rebeccapurple; font-weight: bold;">날짜를 선택해주세요</span>
                <hr>
                <p><input type="text" id="useDate" name="useDate" class="datepicker form-control" placeholder="시작일" required></p>
                <div class="input-group mb-3">
                    
                    <!-- 영업시간 잘라서 넣기 -->
                    <c:set var="Hours" value="${fn:split(si.spcHours,',') }" />
                    <c:set var="startHour" value="${fn:substring(Hours[0],0,2) }" />
                    <c:set var="endHour" value="${fn:substring(Hours[1],0,2) }" />
                    
                    <select class="custom-select" id="useTime" name="useTime">
                    	<option value="" disabled selected>시작시간</option>
                    	<c:forEach var="h" begin="${startHour }" end="${endHour-1 }" >
                        	<option value="${h }">${h}:00</option>
                        </c:forEach>
                    </select>
                </div>
                <p><input type="text" id="endDate" name="endDate" class="datepicker form-control" placeholder="종료일" required></p>
                <div class="input-group mb-3">
                    <select class="custom-select" id="endTime" name="endTime">
                       <option value="" disabled selected>종료시간</option>
                       <!-- 제이쿼리로 추가함! -->
                    </select>
                </div>
                <br>
                <span style="color: rebeccapurple; font-weight: bold;" >인원을 선택해주세요</span>
                <hr>
                <div class="input-group mb-3">
                    <select class="custom-select" id="reservTotal" name="reservTotal" required>
                        <option value="" disabled selected>인원수</option>
                        <c:forEach var="max" begin="${si.spcMin }" end="${si.spcMax }">
                        	<option value="${max }">${max }</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="button" id="payCheck" class="btn btn-warning btn-lg btn-block" style="background-color: lavender; border: none;">예상금액 확인</button><br>
                <button type="button" id="chatToHost" class="btn btn-warning btn-lg btn-block" style="background-color: orange; border: none;">호스트에게 문의채팅</button>
                <br><br>
                <span style="color: rebeccapurple; font-weight: bold;">결제정보</span>
                <hr>
                <table class="table table-borderless">
                    <tbody>
                      <tr>
                        <th scope="row">공간명</th>
                        <td id="checkName"></td>
                      </tr>
                      <tr>
                        <th scope="row">날짜</th>
                        <td id="checkDate"></td>
                      </tr>
                      <tr>
                        <th scope="row">시간</th>
                        <td id="totalTime_view" ></td>
                        <input id="totalTime" type="hidden" name="totalTime" value="" />
                      </tr>
                      <tr>
                        <th scope="row">인원</th>
                        <td id="checkPeople"></td>
                      </tr>
                      <tr>
                        <th scope="row" style="color: rebeccapurple">총금액</th>
                        <td id="checkTotalpay"></td>
                      </tr>
                    </tbody>
                </table>
                <button id="reservBtn" type="submit" class="btn btn-warning btn-lg btn-block" style="background-color: rebeccapurple; color:white; border: none;">예약하기</button>  
            </form>
        </div>

        <script>
        var loginUser = '${loginUser}';
            $( function() {
              
            	$( ".datepicker" ).datepicker({
            		dateFormat: 'yy-mm-dd',
                	showButtonPanel: true
              	});
            	
            	$("#payCheck").on('click',function(){
					if($("#useDate").val() == null || $("#endDate").val() == null || $("#useTime").val() == null || $("#endTime").val() == null || $("#reservTotal").val() == null){
						//alert("선택해주세요");
						//console.log(${si.spcPrice} * $("#reservTotal").val());
					}else{
	            		$("#checkName").text("${si.spcName }");
	            		$("#checkDate").text(
	            			$('#useDate').val()+'   '+$('#useTime').val()+':00'+'  '+'~'+'  '+$('#endDate').val()+'   '+$('#endTime').val()+':00'
	            		);
	            		$("#totalTime_view").text($("#endTime").val()-$("#useTime").val());
	            		$("#totalTime").val($("#endTime").val()-$("#useTime").val());
	            		$("#checkPeople").text($('#reservTotal').val());
	            		$("#checkTotalpay").text(${si.spcPrice} * $("#totalTime_view").text());
					}
            	});
            	
            	$("#reservBtn").on('click',function(){
            		if(loginUser == ''){
            			alert("로그인 후 이용하세요");
            			$("#reservBtn").prop('disabled',true);
            		}else{
            			$("#reservBtn").prop('disabled',false);
            		}
            	});
            	
            	/*종료시간 option 추가 쿼리*/
            	$("#useTime").on("change",function(){
            		$('#endTime').children('option:not(:first)').remove();
            		
            		var s= parseInt($('#useTime').val());
            		var etime="";
            		for(var et = s+1; et <= ${endHour}; et++ ){
            			etime += "<option value="+(et) +">"+et+":00</option>";
            		}
            		$("#endTime").append(etime);
            	});
              
            } );
           
        </script>
        
        <script> <!-- Details 관련 -->
        	$(function(){
        		$("#infoDetails>h3").hover(function(){
        			$(this).css("cursor","pointer");
        		})
        		$("#d1").on("click",function(){$("#detailReviews").css("display","block"); $("#detailReviews").siblings("div").css("display","none");});
        		$("#d2").on("click",function(){$("#notices").css("display","block"); $("#notices").siblings("div").css("display","none");});
        		$("#d3").on("click",function(){$("#refundNotice").css("display","block"); $("#refundNotice").siblings("div").css("display","none");});
        		$("#d4").on("click",function(){$("#way").css("display","block"); $("#way").siblings("div").css("display","none");});
        		$("#d5").on("click",function(){
        			$("#detailQnA").css("display","block"); 
        			$("#detailQnA").siblings("div").css("display","none");
        			selectQnaList(1);
        		});
        	})
        </script>

	    <script>
	    	var loginUser = '${loginUser}';
	    	$(function(){
	    		if(loginUser == ''){
	    			$("#qtohost").css("display","none");
	    			$("#wishandlike").css("display","none");
	    			$("#reportModal").css("display","none");
	    		}else{
	    			$("#qtohost").css("display",true);
	    			$("#wishandlike").css("display",true);
	    			$("#reportModal").css("display",true);
	    		}
	    	})
	    </script>

        <div id="infoDetails">
            <h1><span class="badge badge-pill badge-dark">Details</span></h1><br>
            <h3><a id="d1">이용후기</a>&nbsp;|&nbsp;
                <a id="d2">유의사항</a>&nbsp;|&nbsp;
                <a id="d3">환불정책</a>&nbsp;|&nbsp;
                <a id="d4">오시는길</a>&nbsp;|&nbsp;
                <a id="d5">Q&A</a>&nbsp;
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
                <h4><span class="badge badge-pill badge-dark">#QnA</span></h4>
                <h5><a id="qtohost" class="badge badge-pill badge-warning" data-toggle="modal" data-target="#questionToHost" style="cursor: pointer;">✏호스트에게 질문하기</a></h5>
                <br>
                <div id="qnaSpace">
		            <table class="table table-hover" id="qna">
		                <thead>
		                  <tr>
		                    <th scope="col" class="type">작성자</th>
		                    <th scope="col">자주묻는질문</th>
		                    <th scope="col">날짜</th>
		                  </tr>
		                </thead>
		                <tbody id="tbodyArea">
		                    
		                </tbody>
		              </table>
		        </div>
		        <br>
		        <div id="qnaPagination" style="text-align:center;">
		        </div>
		        <br>
            </div>

        <script>
	        $(function(){
	            $(".answers").click(function(){
	                $("#qna .answers").hide(100);   //괄호안의 숫자는 duration-시간-
	                $("#qna tr[class=on]").attr("class","off");
	            })
	            
	        });
	        
	        //질문클릭시 구동되는 함수 
	        function fnAnswer(no){
	            no = no+1;  //몇번째 tr을 내려줄 것인지 파악하기 위해서 매개변수로 no가 필요함!!
	            $(".answers").slideUp(100);
	            $("#qna .on").attr("class","off").css("color","black").css("font-weight","400");
	            $("#qna tr:eq("+(no*2)+")").slideDown(100);
	            $("#qna tr:eq("+(no*2-1)+")").attr("class","on").css("color","rebeccapurple").css("font-weight","800");
	            if($(".answerArea").text() == 'undefined'){
	            	$(".hostname").text("");
	            	$(".answerArea").text("답변이 등록되지 않았습니다.");
	            	$(".answerDateArea").text("");
	            }
	        }
	        
	        //ajax로 큐앤에이 리스트불러오기
	        function selectQnaList(currentPage){
	        	$.ajax({
	        		url : "question.guest",
	        		data : {
	        			"spcNo" : ${si.spcNo},
	        			"currentPage" : currentPage
	        		},
	        		success:function(result){
	        			
	        			if(result.qna.length >=1){
	        				
	        				var qnaList = "";
	        				for (var i in result.qna){
	        					qnaList += "<tr onclick='fnAnswer("+i+");' class='off'>"
			       					     + "<th scope='row'>"
			    					     + "<a class='black'>"+result.qna[i].qaWriter+"</a>"
			    					     + "</th>"
			    					     + "<td>"+result.qna[i].qaContent+"</td>"
			    					     + "<td>"+result.qna[i].qaDate+"</td>"
			    					     + "</tr>"
			    					     + "<tr class='answers'>"
			    					     + "<td class='hostname'>👾호스트</td>"
			    					     + "<td class='answerArea'>"+result.qna[i].qaAnswer+"</td>"
			    					     + "<td class='answerDateArea'>"+result.qna[i].qaAnswerDate+"</td>"
			    					     + "</tr>"; 
	        				}
	        					                    
	                    	$("#tbodyArea").html(qnaList);
	        				
	        				var $startPage = result.pi.startPage;
	        				var $endPage = result.pi.endPage;
	        				var $currentPage = result.pi.currentPage;
	        				var $maxPage = result.pi.maxPage;
	        				
	        				var $btns = "";
                            for(var $p = $startPage; $p <= $endPage; $p++ ){
                         	   if($p != $currentPage){
                         		   $btns += "<button class='badge badge-pill purple' onclick='selectQnaList(" + $p + ");'>" + $p + "</button>"+"&nbsp;";                       		  
    	                       	  }else{
    	                       		$btns += "<button class='badge badge-pill purple disabled' onclick='selectQnaList(" + $p + ");'>" + $p + "</button>"+"&nbsp;";
    	                       	  }  
                            }
                            
                            var $firstBtn = "<button class='badge badge-pill purple' onclick='selectQnaList(" + 1 + ");'>" + "&lt;&lt;" + "</button>"+"&nbsp;";
                           	var $prevBtn = "<button class='badge badge-pill purple' onclick='selectQnaList(" + ($currentPage - 1) + ");'>" + "&lt;" + "</button>"+"&nbsp;";
                           	var $nextBtn = "<button class='badge badge-pill purple' onclick='selectQnaList(" + ($currentPage + 1) + ");'>" + "&gt;" + "</button>"+"&nbsp;";
                           	var $endBtn = "<button class='badge badge-pill purple' onclick='selectQnaList(" + $maxPage + ");'>" + "&gt;&gt;" + "</button>"+"&nbsp;";
	        				
                           	var $buttons = $firstBtn +"&nbsp;"+ $prevBtn +"&nbsp;"+ $btns +"&nbsp;"+ $nextBtn +"&nbsp;"+ $endBtn ;
		                    var $buttons0 = $firstBtn +"&nbsp;"+ $btns +"&nbsp;"+ $endBtn ;
	                    	var $buttons1 = $firstBtn + "&nbsp;"+ $btns +"&nbsp;"+ $nextBtn +"&nbsp;"+ $endBtn ;
	                    	var $buttons2 = $firstBtn +"&nbsp;"+ $prevBtn +"&nbsp;"+ $btns +"&nbsp;" + $endBtn ;

	                    	
	                    	if(currentPage == "1" && currentPage == $maxPage){
   		                    	$("#qnaPagination").html($buttons0);
   		                    }else if(currentPage == "1" && currentPage != $maxPage) {
   		                    	$("#qnaPagination").html($buttons1);
                            }else if(currentPage != "1" && currentPage != $maxPage){
                               	$("#qnaPagination").html($buttons);
                            }else if (currentPage != "1" && currentPage == $maxPage){
                               	$("#qnaPagination").html($buttons2);
                            }  
                           	
	        			}else{
	        				 $("#tbodyArea").html('보여드릴 질문이 없습니다.');
	        			}
	        			
	        		},error:function(){
	        			console.log('질문답변 목록불러오기 실패');
	        		}
	        	})
	        }
	        
	    </script>

            
	        <div id="detailReviews">
                <br>
                <h4><span class="badge badge-pill badge-dark">#이용후기 ${fn:length(userReviews)}개</span></h4>                
                <br>
	                <c:forEach var="ur" items="${userReviews}">
		                <div class="reviewContent">
		                    <div class="personImgs">
		                        <img src="${ur.profilePath }${ur.userProfileCh}" >
		                    </div>
		                    <div class="review">
		                        <span><h4>${ur.userNickname }</h4></span> 
		                        <span>
		                        	<c:forEach var="star" begin="1" end="${ur.reviewScore }">
		                        		★
		                        	</c:forEach>
		                        </span>
		                        <br>
		                        <span><h4>${ur.reviewCon}</h4></span>
		                        <span style="color: gray;"><h6>${ur.reviewDate }</h6></span>
		                        <c:if test="${loginUser != null }" >
			                        <a id="reportModal" class="badge badge-pill badge-danger" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;" onclick="reviewReportSetting('${ur.reviewWriter},${ur.reviewNo }');">
			                        <h8>신고하기</h8></a>
		                        </c:if>
		                        <br><Br>
		                    </div>
		                </div>
		                <div class="reviewContent" >
		                    <div class="review">
		                        <span style="color: indigo;"><h4>👾호스트의 답변</h4></span> <br>
		                        <span><h4>${ur.reviewReply }</h4></span>
		                        <span style="color: gray;"><h6>${ur.reviewReplyDate }</h6></span>
		                    </div>
		                </div>
		                <hr>
		                <c:set var="target" value="${ur.reviewWriter}"/>
		                
					</c:forEach>

				
                <script> /*후기 신고 시 기본세팅*/
                	function reviewReportSetting(result){
                		console.log(result);
                		var resultSplit = result.split(',');
                		$("#reportSpcNo").val('${si.spcNo}');
                		$("#reportTarget").val(resultSplit[0]);
                		$("#reportReviewNo").val(resultSplit[1]);
                	}
                </script>
				
            <div id="pagination">
            <c:choose>
	            <c:when test="${userReviews.size() eq 0 }">
	            	<p>보여드릴 후기가 없습니다.</p>
	            </c:when>
	            <c:otherwise>
		        	<c:choose>
		        		<c:when test="${pi.currentPage eq 1 }">
				            <a class="badge badge-pill purple disabled ">이전</a>
				        </c:when>
				        <c:otherwise>
				        	<a href="spaceDetail.guest?currentPage=${pi.currentPage-1}&spcNo=${si.spcNo}" class="badge badge-pill purple">이전</a>
				        </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
				            <a href="spaceDetail.guest?currentPage=${p }&spcNo=${si.spcNo}" class="badge badge-pill purple">${p }</a>
				    </c:forEach>
				            
				    <c:choose>
				    	<c:when test="${pi.currentPage eq pi.maxPage}" >
				    		<a class="badge badge-pill purple disabled ">다음</a>
				    	</c:when>
				    	<c:otherwise>
				    		<a href="spaceDetail.guest?currentPage=${pi.currentPage +1 }&spcNo=${si.spcNo}" class="badge badge-pill purple">다음</a>
				    	</c:otherwise>
				    </c:choose> 

	            </c:otherwise>
	        </c:choose>
            </div>
	            
        </div>
    </div>
            

	    <div id="whoishost">
	        <h2>호스트 소개</h2>
	        <br>
	        <div id="hostIntroducingSpace">
	            <div id="hostPhotoForIntro">
	                <img src="${host.profilePath }${host.userProfileC}" >
	            </div>
	            <div id="goToHostPage">
	                <span style="color: indigo; font-weight: bold;">HOST</span>
	                <span><h5>${host.userNickname }</h5></span> <br>
	                <span><h5>"안녕하세요, 호스트 ${host.userNickname } 입니다."</h5></span> <br>
	                <form action="hostHpg.guest" method="post" >
	                	<input type="hidden" value="${si.userId }" name="userId" />
	                	<!-- <input type="hidden" value="${si.spcNo }" name="spcNo" /> -->
	                	<h4><button class="badge badge-pill badge-warning">호스트의 홈피로 이동</button></h4>
	        		</form>
	        	</div>
	    	</div>
	    </div>

    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
    
    <script>
    <!--찜하기-->

    var loginUser = '${loginUser}';

    $(function(){
    	changeImg();
    	
    	$("#likeImg").click(function(){
    		if(loginUser!=null){
    			if( $(this).attr("src") === "resources/images/heart_ready.png" ){
    				$(this).attr("src","resources/images/heart_go.png");
    				insertWish();
    			}else{
    				$(this).attr("src","resources/images/heart_ready.png");
    				deletewish();
    			}
    		}else{
    			alert("로그인 후 이용해주세요!");
    		}
    	});
    });


    function changeImg(){
    	if(loginUser!=null){
    		$.ajax({
    			url : "checkImg.guest",
    			type : "post",
    			data : {
    				"spcNo" : ${si.spcNo},
    				"userId" : '${loginUser.userId}'
    			},success : function(result){
    				console.log(result);
    				
    				if(result>0){
    					$("#likeImg").attr("src","resources/images/heart_go.png");
    				}else{
    					$("#likeImg").attr("src","resources/images/heart_ready.png");
    				}
    				
    			},error : function(){
    				console.log('like 상태체크 실패');
    			}
    			
    		});	
    	
    	}else{
    		$('#likeImg').attr("src","resources/images/heart_ready.png");
    	}
    }

    function insertWish(){
 		$.ajax({
 			url:"wishIn.guest",
 			type:"post",
 			data:{
				"spcNo" : ${si.spcNo},
				"userId" : '${loginUser.userId}'
 			},success: function(result){
 				alert('관심등록성공!');
 			},
 			error: function(){
 				console.log('관심등록 실패');
 			}
 				
 		});
 	}
     
     function deletewish(){
     	$.ajax({
 			url:"wishDelete.guest",
 			type:"post",
 			data:{
				"spcNo" : ${si.spcNo},
				"userId" : '${loginUser.userId}'
 			},success: function(result){
 				alert('관심등록삭제!');
 				changeImg();
 			},
 			error: function(){
 				console.log('관심목록 삭제실패');
 			}
 				
 		});
     }


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
                    <c:set var="spcNo" value="${si.spcNo }" />
                    <input type="hidden" name="spcNo" id="reportSpcNo" value="${spcNo }" />
                    <input type="hidden" name="reviewNo" id="reportReviewNo" value="<%=0%>"/>
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
                            <c:set var="hostId" value="${si.userId }" />
                            <td><input type="text" name="reportTarget" id="reportTarget" value="${hostId}" class="form-control"></td>
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

    <!--질문하기 모달-->
    <div class="modal fade" id="questionToHost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form method="post" action="ask.guest">
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
                    <textarea  name="qaContent" class="form-control" placeholder="질문을 남겨주세요" required></textarea> <!-- 내용 -->
                    <br>
                    <input type="checkbox" name="qaSecret" value="N"> &nbsp;&nbsp;비공개	<!-- 공개여부 -->
                    <input type="hidden" name="qaWriter" value="${loginUser.userNickname }" />	<!-- 닉네임 -->
                    <input type="hidden" name="userId" value="${loginUser.userId }" />	<!-- 아이디 -->
                    <input type="hidden" name="spaceNo" value="${si.spcNo }" />	<!-- 공간번호 -->
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" style="background-color: slateblue; border: none;">질문하기</button>
                </div>
            </div>
            </div>
        </form>
    </div>

</body>
</html>