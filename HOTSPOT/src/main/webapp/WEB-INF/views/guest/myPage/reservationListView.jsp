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
        background: rgb(243, 243, 243);
	    margin-top: 50px;
    }
    .reservation_thumbnail{
        height:120px; 
        float: left;
    	margin:auto;
        padding: 10px;
        padding-right: 30px;
    }
    .listInfo1 a{
        color: rgb(145, 37, 247);
        font-size: 16px;
        font-weight: bold;
    }
    .listInfo2{font-size: 15px}
    
    #reservation_listArea{
        padding: 100px;
        margin: auto;
        margin-top: -30px;
        width: 70%;
    }
    #reservation_listArea div{
        background: white;
        border-radius: 3px;
        padding: 10px;
    }
    #reservation_listArea>div:hover{
        box-shadow: 3px 3px 3px 3px rgb(207, 207, 207);
        cursor:pointer;
    }
    .reserveInfo{
        border: 1px solid rgb(218, 218, 218);
        margin-bottom: -8px;
    }
    #paging-area li>a{color: rgb(139, 138, 138)}
    .selectArray{
        float: right;
        margin-right: 22%;
        box-sizing: border-box;
    }
	#reservation_listArea .statusRable{
		background: #ffe714;
		text-align: center;
		width: 90px; 
		height: 30px; 
		font-size: 15px; 
		float: right;
		margin-top: -38px;
		margin-right: 65px;
		border-radius: 30px;
	}
</style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="reservation_list" >
            <br><br><br>
            <h2 align="center"><b>예약 내역 리스트</b></h2>
            <br><br>
            <form action="reservList.re" class="selectArray">
                <select name="reservationAlign">
                    <option value="useDate" selected>이용날짜순 정렬</option>
                    <option value="reservNo" >예약번호순 정렬</option>
                </select>
                <select name="reservationStatus">
                    <option value="total" selected>전체</option>
                    <option value="reservfix">예약확정</option>
                    <option value="paywait">결제대기</option>
                    <option value="cancel">취소환불</option>
                    <option value="usecomplete">이용완료</option>
                </select>
            </form>
            <div id="reservation_listArea">
                <div class="reserveInfo" onclick="location.href='reservDetail.re'">
                    <input type="hidden" value="">
                    <img src="resources/images/space1.jpg" class="reservation_thumbnail">
                    <div>
                        <span class="listInfo1"><a href="">[카페][경복궁역] 그리다</a></span><br>
                        <span class="listInfo2">2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span class="listInfo2">20,000원</span>
                        <span class="statusRable">예약확정</span>
                    </div>
                </div>
                <br>
                <div class="reserveInfo" onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span class="listInfo1"><a href="">[카페][경복궁역] 그리다</a></span><br>
                        <span class="listInfo2">2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span class="listInfo2">20,000원</span>
                        <span class="badge badge-pill badge-warning" style="background: #49adff; width: 80px; height: 30px; float: right;">
                            	결제대기
                        </span>
                    </div>
                </div>
                <br>
                <div class="reserveInfo" onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span class="listInfo1"><a href="">[카페][경복궁역] 그리다</a></span><br>
                        <span class="listInfo2">2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span class="listInfo2">20,000원</span>
                        <span class="badge badge-pill badge-warning" style="background: #ff4931; width: 80px; height: 30px; float: right;">
                            	취소환불
                        </span>
                    </div>
                </div>
                <br>
                <div class="listArea" onclick="location.href">
                    <input type="hidden" value="">
                    <img src="../../resources/images/cafe_1.jpg" class="reservation_thumbnail">
                    <div>
                        <span class="listInfo1"><a href="">[카페][경복궁역] 그리다</a></span><br>
                        <span class="listInfo2">2020.11.19(목) 11시~13시 2시간 8명</span><br><br>
                        <span class="listInfo2">20,000원</span>
                        <span class="badge badge-pill badge-warning" style="background: #b6b6b6; width: 80px; height: 30px; float: right;">
                           	 이용완료
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt</a></li>
            </ul>
        </div><br><br><br>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>