<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmain.css" type="text/css"/>
</head>
<body>

<jsp:include page="hostMenubar.jsp"/>
	<c:if test="${ !empty alertMsg }">
		<script>
		alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
   <!--호스트 메인화면 -->
   <section id="hostMain">
       <div id="host_container">
           <img src="resources/images/host_images/HostLogo1.png" style="width: 190px;height: 50px; margin-bottom: 15px;">
       </div>
       <div id="hostMainContent">
           <h2 style="margin-bottom: 18px;">지금 바로 공간을 공유 해보세요 !</h2>
           <p>파티룸, 카페, 회의실 등 다양한 모임&업무 공간을 핫스팟을 통해 공유 해보세요:)</p>
           <h6 class="clickChat">궁금한 점이 있으신가요? 1:1 문의하기</h6>
       </div>
       <div id="hostMainBtn">
       <c:choose>
	       	<c:when test="${ loginUser.userType eq 'Host' or hostInfo.hostStatus eq 'W'}">	
	           <button id="hostBtn" class="btn btn-warning btn-lg" onClick="enrollFail()">호스트등록</button>
	            <button id="spaceBtn" class="btn btn-primary btn-lg" onClick="location.href='spaceEnrollForm.ho'">공간등록</button>
	     	 </c:when>
	     	 <c:otherwise>
	   		   <button id="hostBtn" class="btn btn-warning btn-lg" onClick="location.href='hostEnrollForm.ho'">호스트등록</button>
	           <button id="spaceBtn" class="btn btn-primary btn-lg" onClick="location.href='spaceEnrollForm.ho'">공간등록</button>
             </c:otherwise>
       </c:choose>
       </div>
   </section>
   <section id="calculator">
           <div class="calitem" id="calculator_1">
               <h5 class="calitem1">공간공유<br>예상수익계산기</h5>
               <p class="calitem2">간단한 공간공유 예상수익 계산기 입니다.<br>
                                   실제 지급액과 차이가 있을 수 있습니다.</p>
               <img src="resources/images/host_images/calculator-solid.png" style="width:40px; height:50px;">
           </div>
           <div class="calitem" id="calculator_input">
               <table class="calculator_input_table">
                   <tr>
                       <td>예약단위</td>
                       <td colspan="2"><input type="radio" checked >
                           <label class="timeRadio">시간단위</label>
                       </td>
                   </tr>
                 	<tr>
                        <td>공간 수</td>
                        <td colspan="2"><input type="text" name="spaceCount" id="spaceConunt" class="form-control" placeholder="공간 개수를 입력해주세요   예시) 2"></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td colspan="2"><input type="text" class="form-control" id="price" placeholder="시간당 가격을 입력해주세요   예시) 5000"></td>
                    </tr>
                    <tr>
                        <td>공유</td>
                        <td><input type="text"class="form-control" id="dayHours"placeholder="하루 총 공유 시간  예시) 4"></td>
                        <td><input type="text"class="form-control" id="totalHours"placeholder="일주일 총 공유 시간  예시) 8"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2"> <button class="btn btn-warning" id="calculatorBtn" onclick="printSpace();"style="margin-top:10px; width:440px">예상수익 계산하기</button></td>
                    </tr>
               </table>
              </div>
   </section>
   <br><br><Br>
    <div id="calculator_result" >
        <img src="resources/images/host_images/close.png" class="closePng">
        <h3 class="result_title" style="color: white; margin: 25px;">월 예상 수익은?</h3>
           <span><strong id="resultCount">1개 </strong>의 공간을 한시간에 <strong id="resultPrice">200원</strong>에 주 <strong id="resultTotalHours">4회</strong>, <strong id="resultDayHours">2시간씩</strong> 대관시!</span>
            <hr>
        <div class="result_value"><span class="text">월 예상 수익<br></span><span ><strong class="total">￦5,760</strong></span>원<br>(서비스 수수료 ￦<strong class="commission"></strong>)</div>
    </div>
   <script>
       $(function(){
           $("#calculator_result").hide();
           $("#calculatorBtn").click(function(){
               $("#calculator_result").show();
           }); 
           $(".closePng").click(function(){
               $("#calculator_result").hide();
           });
       })
       function printSpace(){
                var $space = Number($('#spaceConunt').val());
                var $price = Number($('#price').val());
                var $totalHours = Number($("#totalHours").val());
                var $dayHours = Number($("#dayHours").val());

                $("#resultCount").text($space+'개');
                $('#resultPrice').text($price+'원')
                $('#resultTotalHours').text($totalHours+'회')
                $('#resultDayHours').text($dayHours+'시간씩')
                $(".total").text($space*$price*$totalHours*$dayHours)
                $(".commission").text($space*$price*$totalHours*$dayHours/10)
            }
		function enrollFail(){
			alert('이미 호스트 등록 하셨습니다!')
		}
   </script>
 


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>