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

    input[type=text], input[type=password]{
        width: 230px;
        height: 35px;
    }
</style>
<body>
	<jsp:include page="hostmenubar.jsp"/>
    <div align="left" id="noticebar">
        <img src="">
        <label style="color: yellowgreen; font-size: large ;">MYPAGE</label><hr>
    </div>
    <form action="" method="POST">
    <div id="MyPageForm">
        <div id="ProfilePhoto" style="float: left; width: 30%; height: 100%;" align="center">
            <div id="ConfirmStatus"class="btn btn-primary">호스트 승인</div>
            <br>

            <img src="프로필.PNG">

            <br><br>
            <span style="font-size: larger; font-weight: bolder;">user01</span>

            <br><br>

            <button type="button" class="btn btn-secondary">프로필 사진 수정</button>




        </div>
        <div id="ProfileInfo" style="float: left; width: 70%; height: 100%;" >
            <table style="border-collapse: separate; border-spacing: 30px;">
                <tr>
                   <td>사업자 번호</td> 
                   <td><input type="text" placeholder="사업자 번호를 입력해주세요" required> </td>
                </tr>
                <tr>
                    <td>상호명</td> 
                    <td><input type="text" placeholder="상호명을 입력해주세요" required></td>
                 </tr>
                 <tr>
                    <td>사업자 등록증</td> 
                    <td><input type="text" placeholder="" required style="width: 150px;"> <button class="btn btn-primary">파일 첨부</button></td>
                 </tr>
                 <tr>
                    <td>사업장 소재지</td> 
                    <td><input type="text" placeholder="주소를 입력해주세요." required></td>
                 </tr>
                 <tr>
                    <td>계좌 정보</td> 
                    <td><select style="height: 35px;">
                        <option>신한</option>
                        <option>우리</option>
                    </select>
                    <input type="number" style="height: 35px; width: 200px;" required> 
                    <input type="text" style="width: 80px;" placeholder="예금주명" required>
                
                    </td>
                 </tr>
                 <tr>
                    <td>사업장 연락처</td> 
                    <td><input type="text" placeholder="전화번호를 입력해주세요" required></td>
                 </tr>
                 <tr>
                    <td>담장자 이메일</td> 
                    <td><input type="text" placeholder="이메일을 입력해주세요" required></td>
                 </tr>
            </table>

        </div>
        </div>
        </form>

        
    
    
    <button class="btn btn-danger" id="Modify" style="margin-left: 600px;">취소</button>
    <button class="btn btn-primary" id="Modify"style="margin: 10px;">수정 완료</button>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>