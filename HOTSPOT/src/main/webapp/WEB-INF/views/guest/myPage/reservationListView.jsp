<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
	    background: rgba(228, 228, 228, 0.623);
	    position: absolute;
	    top: 30%;
	    left: 50%;
	    margin: 100px;
	    margin-left: -350px;
	    margin-top: -80px;
	    padding: 50px;
	    /* width: 100%; */
	}
	#reservation_listArea{
	    border: 1px soild black;
	}
	#reservation_listArea td{
	    width: 700px;
	    padding: 20px;
	}
	.reservation_thumbnail{
	    width:130px;
	    height:120px; 
	    float: left;
	    padding: 10px;
	    padding-right: 20px;
	}
	#reservation_listArea{
	    display: inline-block;
	    width: 700px;
	}
	#reservation_listArea div{
	    background: white;
	    border-radius: 4px;
	    padding: 10px;
	}
	#reservation_listArea>div:hover{
	    box-shadow: 3px 3px 3px 3px rgb(207, 207, 207);
	    cursor:pointer;
	}
</style>
</head>
<body>
<jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="reservation_list">
            <br>
            <h2 align="center"><b>예약 내역 리스트</b></h2>
            <br><br>
            <form action="" align="right">
                <select name="reservationAlign">
                    <option value="" selected>예약번호순 정렬</option>
                    <option value="">이용날짜순 정렬</option>
                </select>
                <select name="reservationStatus">
                    <option value="" selected>전체</option>
                    <option value="">예약확정</option>
                    <option value="">결제대기</option>
                    <option value="">취소환불</option>
                    <option value="">이용완료</option>
                </select>
            </form>
            <br>
            <div id="reservation_listArea">
                <div onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span><b style="font-size: 18px;">[카페][경복궁역] 그리다</b></span><br>
                        <span>2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span>20,000원</span>
                    </div>
                </div>
                <br>
                <div onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span><b style="font-size: 18px;">[카페][경복궁역] 그리다</b></span><br>
                        <span>2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span>20,000원</span>
                    </div>
                </div>
                <br>
                <div onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span><b style="font-size: 18px;">[카페][경복궁역] 그리다</b></span><br>
                        <span>2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span>20,000원</span>
                    </div>
                </div>
                <br>
                <div onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <b style="font-size: 18px;">[카페][경복궁역] 그리다</b><br>
                        2020.11.19(목) 11시~13시 2시간 8명<br><br>
                        20,000원
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>

        <div id="paging-area" align="center" >
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">이전</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">다음</a></li>
            </ul>
        </div>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>