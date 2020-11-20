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
                <p style="color: white;">정산내역</p>
            </div>
            <form>
                <div class="container1_box" style="margin-top: 30px;">
                    <div class="box_1">
                        <p>정산기간</p>
                            <input type="text" name="year" placeholder="정산연도" list="year">
                            <datalist id="year">
                                <option value="2020">2020년</option>
                            </datalist>
                            <input type="text" name="month" placeholder="월 별" list="month">
                            <datalist id="month">
                                <option >12월</option>
                                <option >11월</option>
                                <option >10월</option>
                                <option >9월</option>
                                <option >8월</option>
                                <option >7월</option>
                                <option >6월</option>
                                <option >5월</option>
                                <option >4월</option>
                                <option >3월</option>
                                <option>2월</option>
                                <option>1월</option>
                            </datalist>
                    </div>
                    <div class="box_2">
                        <p style="display: block;">공간선택</p>
                        <input type="text" name="space_choice" placeholder="공간을 선택해주세요" list="space">
                                <datalist id="space">
                                    <option>따뜻한 한옥 카페</option>
                                    <option>테라스가 있는 카페</option>
                                </datalist>
                        <input type="image" img src="resources/images/host_images/search.png" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                    </div>
                </div>
            </form>
            <div class="container2" style="height:700px"> <!--스크롤 테스트 삭제예정-->
                <div class="container2_title">
                    <h5 style="font-size:16px;margin-top: 20px;"><p>2020년1월</p>의 정산내역입니다.</h5>
                </div>
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
                         <tr>
                            <td>5</td>
                            <td>1005</td>
                            <td>따듯한 한옥 카페</td>
                            <td>2020-11-17</td>
                            <td>28000원</td>
                            <td>2800원</td>
                            <td>25200원</td>
                            <td>완료</td>
                         </tr>
                         <tr>
                             <td>4</td>
                             <td>1004</td>
                             <td>테라스가있는 카페</td>
                             <td>2020-11-14</td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td>3</td>
                             <td>1003</td>
                             <td>테라스가있는 카페</td>
                             <td>2020-11-07</td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td>2</td>
                             <td>1002</td>
                             <td>따듯한 한옥 카페</td>
                             <td>2020-11-01</td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                            <td>1</td>
                            <td>1001</td>
                            <td>따듯한 한옥 카페</td>
                            <td>2020-10-17</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                         </tr>
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
                            <td></td>
                            <td>2000원</td>
                            <td>20000원</td>
                            <td>3건</td>
                         </tr>
                     </tbody>
                 </table>
             </div>
        </div>
    </div>

</body>
</html>