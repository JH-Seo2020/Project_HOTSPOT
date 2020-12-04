<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>

<h1 style="text-align:center;">결제중</h1>

<c:choose>
	<c:when test="${r.payMethod eq '신용카드' }">
		<c:set var="method" value="card" />
	</c:when>
	<c:otherwise>
		<c:set var="method" value="vbank" />
	</c:otherwise>
</c:choose>

<script>


IMP.init("imp89701275"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

  // IMP.request_pay(param, callback) 호출
  IMP.request_pay({ // param
    pg: "inicis",
    pay_method: "${method}",
    merchant_uid: "${rno}",
    name: "${r.spcName}",		
    amount: ${r.paySum},
    buyer_email: "${r.reservEmail}",
    buyer_name: "${r.reservName}",
    buyer_tel: "${r.reservPhone}"
  }, function (rsp) { // callback
	    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	
	    	//결제여부, 날짜 업데이트용 ajax 호출
	    		updatePaymentDate();
	    	
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        alert(msg);
	        location.href = "paySuccess.guest";
	        
	      } else { //결제 실패 시
	    	  //예약내역 삭제함
	    	  deleteReservation();
	    	  
	    	  var msg = '결제에 실패하였습니다.';
	          msg += '에러내용 : ' + rsp.error_msg;
	          alert(msg);
	          location.href = "payError.guest";
	      }
	    });



//결제상태, 결제일 업데이트용 함수 
function updatePaymentDate(){
	$.ajax({
		url : "payUpdate.guest",
		type:"post",
		data:{
			"reservNo" : ${rno},
			"payMethod" : '${r.payMethod}'
		},success : function(result){
			console.log(result);
			if(result == 1){
				alert("결제 업데이트 성공");			
			}
		}, error : function(){
			console.log('결제 업데이트 통신실패!');
		}
		
	});
}

//결제 실패 시 예약내역 삭제함수
function deleteReservation(){
	$.ajax({
		url : "deleteReserv.guest",
		type:"post",
		data:{
			"reservNo" : ${rno}
		},success : function(result){
			console.log(result);
			alert("예약삭제성공");
		}, error : function(){
			console.log('예약삭제 통신실패!');
		}
		
	});
}

</script>

</body>
</html>