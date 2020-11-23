<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>


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

    <div align="left" id="noticebar" style="margin-left: 300px;">
        <img src="resources/images/logo_letter_1.png">
        <label style="color: yellowgreen; font-size: large ;">MYPAGE</label><hr>
    </div>
    <div id="MyPageForm" style="margin-left: 290px;">
        <div id="ProfilePhoto" style="float: left; width: 30%; height: 100%;" align="center">
            <div id="ConfirmStatus"class="btn btn-primary">호스트 승인</div>
            <br>

            <img src="resources/images/host_images/person.png" style="width: 35px; height: 30px;">

            <br><br>
            <span style="font-size: larger; font-weight: bolder;">${loginUser.userId }</span>

            <br><br>

            <button type="button" class="btn btn-secondary">프로필 사진 수정</button>




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
                    <td>${hostInfo.businessLicense }</td>
                 </tr>
                 <tr>
                    <td>사업장 소재지</td> 
                    <td>${hostInfo.bisinessLoc }</td>
                 </tr>
                 <tr>
                    <td>계좌 정보</td> 
                    <td>${hostInfo.businessAcc }</td>
                 </tr>
                 <tr>
                    <td>사업장 연락처</td> 
                    <td>${hostInfo.bisinessPhone }</td>
                 </tr>
                 <tr>
                    <td>담장자 이메일</td> 
                    <td>${hostInfo.bisinessEmail }</td>
                 </tr>
            </table>

        </div>
        <button class="btn btn-primary" id="Modify" style="margin-left: 700px;" onclick="location.href='modify.ho'">정보 변경</button>


    </div>
    <br><br><br><br><br><br><br>
    
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>