<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                            <input type="text" name="reservDate" placeholder="정산연도" list="year" value="${ year }" required class="form-control">
                            <datalist id="year">
                                <option value="2020">2020</option>
                            </datalist>
                            <input type="text" name="reservDate" placeholder="월 별" list="month" required value="${ month }" class="form-control">
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
                        <input type="text" name="spcName" placeholder="공간을 선택해주세요"  required class="form-control"list="space">
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
                	<c:if test="${ list != null }">
                   		 <h5 style="font-size:18px;margin-top: 40px;margin-bottom:70px;"><p style="font-size:18px;">${date}월</p>의 정산내역 입니다.</h5>
                    </c:if>
                </div>
                <c:choose>
                    	<c:when test="${list!=null}">
			               
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
			                      <c:set var="total" value="0"/>
			                      <c:set var="fee" value="0"/>
			                      <c:set var="Allsuccess" value="0"/>
			                      <c:set var="cancel" value="0"/>
			                      <c:set var="Ctotal" value="0"/>
			                      <c:set var="Cfee" value="0"/>
			                      <c:set var="calcalte" value="0"/>
			                     <c:forEach var="li" items="${list }" varStatus="status">
			                         <tr>
			                            <td>${ status.count }</td>
			                            <td>${li.reservNo}</td>
			                            <td>${li.spcName }</td>
			                            <td class="payDate">${li.payDate }</td>
			                            <td class="paySum"><fmt:formatNumber  pattern="#.##" value="${li.paySum}" ></fmt:formatNumber><p>원</p></td>
			                            <td> <fmt:formatNumber  pattern="#.##" value="${li.paySum*0.1}" ></fmt:formatNumber><p>원</p></td>
			                            <td><fmt:formatNumber  pattern="#.##" value="${li.paySum- li.paySum/10}" ></fmt:formatNumber><p>원</p></td>
			                            <td class="reservStatus">${li.reservStatus }</td>
			                            
			                            
			                            <c:set var="Allsuccess" value="${ Allsuccess + 1 }"/>
			                            <c:if test="${li.reservStatus eq '이용완료' }">
			                            	 <c:set var="success" value="${ success + 1 }"/>
			                            </c:if>
			                            <c:if test="${ li.reservStatus eq '취소환불' }">
			                           		<c:set var="cancel" value="${ cancel + 1 }"/>
			                           		<c:set var="Ctotal" value="${ Ctotal + li.paySum}"/>
			                           		<c:set var="Cfee" value="${ Cfee + li.paySum*0.1}"/>
			                           		<c:set var="Cresult" value="${ Ctotal - Cfee}"/>
			                            </c:if>
			                         </tr>
			                        	<c:set var= "total" value="${total + li.paySum}"/>
			                        	<c:set var="fee" value="${fee + li.paySum*0.1 }"/>
			                        	
			                        </c:forEach>
			                         <tr class="resultHead">
			                             <th></th>
			                             <th></th>
			                             <th></th>
			                             <th></th>
			                             <th>총금액</th>
			                             <th>수수료</th>
			                             <th>정산금액</th>
			                             <th>총결제/취소</th>
			                         </tr>
			                         </tbody>
			                        
			                         <tr class="result">
			                            <td>합계</td>
			                            <td></td>
			                            <td></td>
			                            <td></td>
		                             	<td id="allPrice"><c:out value="${total - Ctotal}"/>원</td>
			                            <td id="fees"><fmt:formatNumber pattern="#.##"  value="${fee - Cfee}" ></fmt:formatNumber>원</td>
			                            <td id="price"><fmt:formatNumber pattern="#.##" value="${total - Cresult - fee}"/>원</td>
			                            <td id="count">총<c:out value="${Allsuccess }"/>건/ <c:out value="${cancel }"/>건</td>
			                         </tr>
			                         <tr>
			                       
			                         </tr>
				                   
			                 </table>
			                  <div class="payment">
			                     <div class="payment_clear">이용완료: <p><c:out value="${success }"/></p> </div>
			                     <div class="payment_cancel">취소 :  <c:out value="${cancel }"/></div>
			                 </div>
			                 <button class="btn btn-primary" onclick="excelSubmit();" id="excelBtn">엑셀파일 다운</button>
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
		$("#hiddenTable").hide();
		
	
	});
	function searchSubmit(){
		$("#calForm").attr("action","selectCalculate.ho").submit();
	}
	function excelSubmit(){
		$("#calForm").attr("action","exceldown.ho").submit();
	}
	
	</script>
</body>
</html>