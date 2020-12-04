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

<script>
$(function(){
	deleteReservation();
})


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