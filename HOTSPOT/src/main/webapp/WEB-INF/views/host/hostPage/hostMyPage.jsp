<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>핫스팟 호스트페이지</title>
<link rel="icon" type="image/png" sizes="132x132" href="resources/images/host_images/logoIcon.png" />
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

</head>
<style>

    #MyPageForm{
        position: absolute;
        margin-top: 50px;
        margin-bottom: 50px;
        width: 100%;
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
	
	<div style="position: absolute; top:50px; left:50px">
    <div align="left" id="noticebar" style="margin-left: 300px;">
        <img src="resources/images/logo_letter_1.png">
        <label style="color: yellowgreen; font-size: large ;">MYPAGE</label><hr>
    </div>
    <div id="MyPageForm" style="margin-left: 290px;">
        <div id="ProfilePhoto" style="float: left; width: 30%; height: 100%;" align="center">
            <div id="ConfirmStatus"class="btn btn-primary">호스트 승인</div>
            <br>

            <img src="${loginUser.userProfileC}" style="width: 35px; height: 30px;" onError="javascript:this.src='resources/images/profileImage.png'">

            <br><br>
            <span style="font-size: larger; font-weight: bolder;">${loginUser.userId }</span>

            <br><br>

            




        </div>
        <div id="ProfileInfo" style="float: left; width: 70%; height: 100%;" >
            <table style="border-collapse: separate; border-spacing: 30px;">
                <tr>
                   <td>사업자 번호</td> 
                   <td>${ hostInfo.businessNo }</td>
                </tr>
                <tr>
                    <td>상호명</td> 
                    <td>${hostInfo.businessName }</td>
                 </tr>
                 <tr>
                    <td>사업자 등록증</td> 
                    <td><a>${hostInfo.businessLicense}</a></td> <!-- 클릭하면 이미지 보이도록 수정예정 -->
                 </tr>
                 <tr>
                    <td>사업장 소재지</td> 
                    <td>${hostInfo.businessLoc }</td>
                 </tr>
                 <tr>
                    <td>계좌 정보</td> 
                    <td>${hostInfo.businessAcc }</td>
                 </tr>
                 <tr>
                    <td>사업장 연락처</td> 
                    <td>${hostInfo.businessPhone }</td>
                 </tr>
                 <tr>
                    <td>담장자 이메일</td> 
                    <td>${hostInfo.businessEmail }</td>
                 </tr>
            </table>

        </div>
        <button class="btn btn-primary" id="Modify" style="margin-left: 700px;" onclick="location.href='modify.ho'">정보 변경</button>


    </div>
    </div>
    <br><br>
    
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>