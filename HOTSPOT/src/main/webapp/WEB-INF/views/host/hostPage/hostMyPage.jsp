<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css외부 파일 연결 -->
<link rel="stylesheet" href="resources/css/hostmenubar.css" type="text/css"/>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<style>

    #MyPageForm{
        width: 100%;
        height: 500px;
        
    }
    #ConfirmStatus{
        margin-top: 30px;
        margin-bottom: 50px;
    }

    table{
        margin: 10px;
        margin-top: 30px; 

    }



    table tr td:first-child{
        font-size: larger;
        font-weight: bolder;
    }
</style>
<body>
	<jsp:include page="../common/hostMenubar.jsp"/>
	<jsp:include page="../common/subMenubar.jsp"/>

    <div align="left" id="noticebar">
        <img src="resources/images/logo_letter_1.png">
        <label style="color: yellowgreen; font-size: large ;">MYPAGE</label><hr>
    </div>
    <div id="MyPageForm">
        <div id="ProfilePhoto" style="float: left; width: 30%; height: 100%;" align="center">
            <div id="ConfirmStatus"class="btn btn-primary">호스트 승인</div>
            <br>

            <img src="resources/images/host_images/person.png">

            <br><br>
            <span style="font-size: larger; font-weight: bolder;">user01</span>

            <br><br>

            <button type="button" class="btn btn-secondary">프로필 사진 수정</button>




        </div>
        <div id="ProfileInfo" style="float: left; width: 70%; height: 100%;" >
            <table style="border-collapse: separate; border-spacing: 30px;">
                <tr>
                   <td>사업자 번호</td> 
                   <td>${ businessNo }</td>
                </tr>
                <tr>
                    <td>상호명</td> 
                    <td>${businessName }</td>
                 </tr>
                 <tr>
                    <td>사업자 등록증</td> 
                    <td>${bisinessLicense }</td>
                 </tr>
                 <tr>
                    <td>사업장 소재지</td> 
                    <td>#{bisinessLoc }</td>
                 </tr>
                 <tr>
                    <td>계좌 정보</td> 
                    <td>${businessAcc }</td>
                 </tr>
                 <tr>
                    <td>사업장 연락처</td> 
                    <td>${bisinessPhone }</td>
                 </tr>
                 <tr>
                    <td>담장자 이메일</td> 
                    <td>${bisinessEmail }</td>
                 </tr>
            </table>

        </div>
        <button class="btn btn-primary" id="Modify" style="margin-left: 700px;" onclick="location.href='modify.ho'">정보 변경</button>


    </div>
    
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>