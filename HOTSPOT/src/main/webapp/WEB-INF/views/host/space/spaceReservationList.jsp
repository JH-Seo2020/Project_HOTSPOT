<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/host/hostcalculate.css" type="text/css"/>
<link rel="icon" type="image/png" sizes="132x132" href="resources/images/host_images/logoIcon.png" />

<style>
.result {
	color: red;
}

.payments {
	width: 175px;
	height: 40px;
	text-align: center;
	font-size: 15px;
	position: absolute;
	top: 142px;
	left: 1px;
}

#calculate_containers {
	width: 1200px;
	/* background-color: lightgrey; */
	position: absolute;
	top: 130px;
	left: 400px;
}

.container12 {
	width: 1200px;
	margin: auto;
	margin-bottom: 60px;
}
</style>
</head>
<body>
	<jsp:include page="../common/hostMenubar.jsp" />


	<jsp:include page="../common/subMenubar.jsp" />
	<div id="calculate_containers">
		<div class="container12">
			<div class="container1_head">
				<p style="color: white; font-size: 17px;">호스트 공간 예약 내역</p>
			</div>
			<div class="container2" style="height: 700px">
				<!--스크롤 테스트 삭제예정-->
				<div class="container2_title">
					<c:if test="${ list != null }">
						<h5
							style="font-size: 18px; margin-top: 40px; margin-bottom: 70px;">최근
							10건의 예약내역 입니다.</h5>
						<span>그 이후 내역들은 정산기능을 이용해 주세요</span>
					</c:if>
				</div>
				<c:choose>
					<c:when test="${list!=null}">

						<table id="paymentList" class="table table-hover">
							<thead>
								<tr>
									<th>구분</th>
									<th>결제번호</th>
									<th>공간명</th>
									<th>회원 아이디</th>
									<th>거래일자</th>
									<th>총금액</th>
									<th>수수료</th>
									<th>정산금액</th>
									<th>결재 상태</th>
									<th>결제 방법</th>
									<th>환불 계좌</th>
									<th>결제 취소</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="total" value="0" />
								<c:set var="fee" value="0" />
								<c:set var="Allsuccess" value="0" />
								<c:set var="cancel" value="0" />
								<c:set var="Ctotal" value="0" />
								<c:set var="Cfee" value="0" />
								<c:set var="calcalte" value="0" />
								<c:forEach var="li" items="${list }" varStatus="status">
									<tr>
										<td>${ status.count }</td>
										<td>${li.reservNo}</td>
										<td>${li.spcName }</td>
										<td>${li.userId }</td>
										<td class="payDate">${li.payDate }</td>
										<td class="paySum"><fmt:formatNumber pattern="#.##"
												value="${li.paySum}"></fmt:formatNumber>
											<p>원</p></td>
										<td><fmt:formatNumber pattern="#.##"
												value="${li.paySum*0.1}"></fmt:formatNumber>
											<p>원</p></td>
										<td><fmt:formatNumber pattern="#.##"
												value="${li.paySum- li.paySum/10}"></fmt:formatNumber>
											<p>원</p></td>
										<td class="reservStatus">${li.reservStatus }</td>
										<td>${li.payMethod }</td>
										<td>${li.refund }</td>
										<c:choose>
											<c:when test="${li.reservStatus eq '예약확정' }">
												<c:if test="${li.payMethod eq '무통장입금' }">
													<td><button class="btn btn-primary"
															id="reservationCancle" data-toggle="modal"
															data-target="#myModal">결제 취소</button></td>
												</c:if>
											</c:when>
											<c:otherwise>
												<td></td>
											</c:otherwise>
										</c:choose>
										<c:set var="Allsuccess" value="${ Allsuccess + 1 }" />
										<c:if test="${li.reservStatus eq '이용완료' }">
											<c:set var="success" value="${ success + 1 }" />
										</c:if>
										<c:if test="${ li.reservStatus eq '취소환불' }">
											<c:set var="cancel" value="${ cancel + 1 }" />
											<c:set var="Ctotal" value="${ Ctotal + li.paySum}" />
											<c:set var="Cfee" value="${ Cfee + li.paySum*0.1}" />
											<c:set var="Cresult" value="${ Ctotal - Cfee}" />
										</c:if>
									</tr>
									<c:set var="total" value="${total + li.paySum}" />
									<c:set var="fee" value="${fee + li.paySum*0.1 }" />

									<script>
										function emailSend() {
											$.ajax({
												type : "POST",
												url : "cancle.reservation",
												data : {
													guestId : "${li.userId}",
													spcName : "${li.spcName}"
												},
												success : function(data) {
													alert('메일이 전송되었습니다.')
												},
												error : function(e) {
													alert('오류입니다. 다시 시도해주십시오.')
												}

											});
										}
									</script>
								</c:forEach>
								<tr class="resultHead">
									<th></th>
									<th></th>
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
								<td></td>
								<td></td>
								<td id="allPrice"><c:out value="${total - Ctotal}" />원</td>
								<td id="fees"><fmt:formatNumber pattern="#.##"
										value="${fee - Cfee}"></fmt:formatNumber>원</td>
								<td id="price"><fmt:formatNumber pattern="#.##"
										value="${total - Cresult - fee}" />원</td>
								<td id="count">총<c:out value="${Allsuccess }" />건/ <c:out
										value="${cancel }" />건
								</td>
							</tr>
							<tr>

							</tr>

						</table>

						<div class="payments">
							<div class="payment_clear">
								이용완료:
								<p>
									<c:out value="${success }" />
								</p>
							</div>
							<div class="payment_cancel">
								취소 :
								<c:out value="${cancel }" />
							</div>
						</div>

					</c:when>
					<c:otherwise>
						<tr>
							<td>예약내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">


				<div class="modal-header">
					<h4 class="modal-title">취소 이메일 전송</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>


				<div class="modal-body">
					<p>주의!</p>
					정말로 결제를 취소하시겠습니까? 확인 버튼을 누르시면 자동으로 결제 취소 이메일이 사용자에게 전송됩니다.
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" onclick="emailSend()">결제취소</button>
				</div>

			</div>
		</div>
	</div>


	<script>
		$(function() {
			$("#hiddenTable").hide();

		});
		function searchSubmit() {
			$("#calForm").attr("action", "selectCalculate.ho").submit();
		}
	</script>
</body>
</html>