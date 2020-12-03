<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<link rel="stylesheet" href="resources/css/host/hostcalculate.css" type="text/css"/>

<style>
.result{
	color:red;
}
</style>
</head>
<body>
<jsp:include page="../common/hostMenubar.jsp" />
	

<jsp:include page="../common/subMenubar.jsp" />
	 <div id="calculate_container">
        <div class="container1">
            <div class="container1_head" >
                <p style="color: white; font-size:17px;">정산내역</p>
            </div>
            <form action="" method="post" id="calForm">
            	<input type="hidden" name="userId" value="${loginUser.userId }">
                <div class="container1_box" style="margin-top: 30px;">
                    <div class="box_1">
                        <p style="font-size:16px;">정산기간</p>
                            <input type="text" name="reservDate" placeholder="정산연도" list="year" required class="form-control">
                            <datalist id="year">
                                <option value="2020">2020</option>
                            </datalist>
                            <input type="text" name="reservDate" placeholder="월 별" list="month" required class="form-control">
                            <datalist id="month">
                                <option value="12">12</option>
                                <option value="11">11</option>
                                <option value="10">10</option>
                                <option value="9">9</option>
                                <option value="8">8</option>
                                <option value="7">7</option>
                                <option value="6">6</option>
                                <option value="5">5</option>
                                <option value="4" >4</option>
                                <option value="3" >3</option>
                                <option value="2">2</option>
                                <option value="1">1</option>
                            </datalist>
                    </div>
                    <div class="box_2">
                        <p style="display: block;font-size:16px;">공간선택</p>
                        <input type="text" name="spcName" placeholder="공간을 선택해주세요" required class="form-control"list="space">
                                <datalist id="space">
                                		<option>전체 공간 선택</option>
                                	<c:forEach var="sp" items="${ space }">
                                		 <option value="${sp.spcName }"></option>
                                	</c:forEach>
                                    
                                </datalist>
                        <input type="image" img src="resources/images/host_images/search.png" onclick="searchSubmit();" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                    </div>
                </div>
            </form>
            <div class="container2" style="height:700px"> <!--스크롤 테스트 삭제예정-->
                <div class="container2_title">
                    <h5 style="font-size:18px;margin-top: 40px;margin-bottom:40px;"><p style="font-size:18px;">2020년1월</p>의 정산내역 입니다.</h5>
                </div>
                <c:choose>
                    	<c:when test="${list!=null}">
			                <div class="payment">
			                     <div class="payment_clear">이용완료: 3 </div>
			                     <div class="payment_cancel">취소 : 1</div>
			                </div>
			                 <table id="paymentList" class="table table-hover" align="center">
			                     <thead>
			                       <tr>
			                         <th>구분</th>
			                         <th>결제번호</th>
			                         <th>공간명</th>
			                         <th>거래일자</th>
			                         <th>총금액</th>
			                         <th>수수료</th>
			                         <th>정산금액</th>
			                         <th>승인</th>
			                       </tr>
			                     </thead>
			                     <tbody>
			                     <c:forEach var="li" items="${list }" varStatus="status">
			                         <tr>
			                            <td>${ status.count }</td>
			                            <td>${li.reservNo}</td>
			                            <td>${li.spcName }</td>
			                            <td>${li.payDate }</td>
			                            <td class="paySum">${li.paySum}</td>
			                            <td>${li.paySum*0.1}</td>
			                            <td>${li.paySum- li.paySum/10}</td>
			                            <td class="reservStatus">${li.reservStatus }</td>
			                         </tr>
			                        </c:forEach>
			                         <tr class="result">
			                             <th></th>
			                             <th></th>
			                             <th></th>
			                             <th></th>
			                             <th>총금액</th>
			                             <th>수수료</th>
			                             <th>정산금액</th>
			                             <th>총결제</th>
			                             
			                         </tr>
			                         <tr>
			                            <td></td>
			                            <td></td>
			                            <td></td>
			                            <td></td>
		                             	<td id="allPrice"></td>
			                            <td id="fees">2000원</td>
			                            <td id="price">20000원</td>
			                            <td id="count">3건</td>
			                         </tr>
			                     </tbody>
			                 </table>
			                 <button class="btn btn-primary" id="excelBtn">엑셀파일 다운</button>
	                	 </c:when>
	                   <c:otherwise>
		                          <tr>
		                          	<td>정산내역이 존재하지 않습니다. </td>
		                          </tr>
		               </c:otherwise>
	              </c:choose>
	          </div>
        </div>
    </div>
	<script>
	$(function(){
		
		if("${list}" != ""){
			$("#year").prop("selected",true);
		}
	
	});
	function searchSubmit(){
		$("#calForm").attr("action","selectCalculate.ho").submit();
	}
	
	</script>
</body>
</html>