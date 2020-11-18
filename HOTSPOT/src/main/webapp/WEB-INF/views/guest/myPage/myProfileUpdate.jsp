<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #profile{
        position: absolute;
        top: 30%;
        left: 50%;
        margin: 100px;
        margin-left: -350px;
        margin-top: -80px;
        padding: 50px;
        width: 700px;
        /* background: rgba(209, 208, 208, 0.24); */
    }
    #profileImage{
        float: left;
        margin-left: 100px;
    }
    #mainProfile{
        font-weight: bold;
        font-size: 15px;
        color:rgb(80, 80, 80)
    }
    #mainProfile div{
        padding: 20px;
        margin-left: 300px;
    }
    #profileBtn button{
        width: 150px;
        height: 30px;
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px;
    }
    #profilePassword label{
        font-size: small;
        color: rgb(145, 37, 247);
    }
    #emailCode{
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px;
        width: 90px;
    }
</style>
</head>
<body>
     <jsp:include page="../../common/menubar.jsp"/>

     <div class="content">
         <div id="profile">
             <h1 align="center">내 프로필 관리</h1> 
 
             <br><hr><br><br>
             <form action="" method="POST" id="myProfile" enctype="multipart/form-data">
                 <div id="profileImage"><img src="../../resources/images/profileImage.png"><h2 align="center">USER01</h2></div>
 
                 <div id="mainProfile">
                    <div>
                        <label for="nickName">닉네임</label> &nbsp;&nbsp;&nbsp;
                        <input type="text" name ="nickName" id="nickName" value="동동이">
                    </div>
                    <div>
                        <label for="profileEmail">이메일</label> &nbsp;&nbsp;&nbsp;
                            <input type="text" name="profileEmail" id="profileEmail" value="user01@naver.com">
                            <button type="button" id="emailCode">이메일 인증</button><br><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                        <input type="text" name="emailConfirmCode" placeholder="인증코드를 입력하세요.">
                    </div>
                    <div>
                        <label for="profilePhone">연락처</label>&nbsp;&nbsp;&nbsp;
                        <input type="text" name ="profilePhone" id="profilePhone" value="010-1111-2222">
                    </div>

                    <div id="profilePassword">
                        <span>비밀번호 변경</span><br><br>
                        <label for="password_1">현재 비밀번호 <br>
                            <input type="password" name="profilePassword" id="password_1"><br><br>
                        </label>
                        <label for="password_2">새 비밀번호<br>
                            <input type="password" name="profilePasword_Update" id="password_2"><br><br>
                        </label>
                        <label for="password_3">새 비밀번호 확인 <br>
                            <input type="password" name="profilePasword_Check" id="password_3">
                        </label>
                    </div>
                    <div>마케팅 수신동의 : <br><br>

                                                    이메일   <input type="radio" name="updateEmail" value="yes"> 예
                             <input type="radio" name="updateEmail" value="no" checked> 아니오
                             <br>&nbsp;&nbsp;
                        SMS <input type="radio" name="updateSms" value="yes"> 예
                            <input type="radio" name="updateSms" value="no" checked > 아니오

                    </div>
                 </div>
                 <br><br><hr><br>
                 <div id="profileBtn" align="center"> 
                     <button type="submit">내 프로필 수정하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button">서비스 탈퇴하기</button>
                 </div>
             </form>
         </div>
     </div>
 
     <jsp:include page="../../common/footer.jsp"/>
</body>
</html>