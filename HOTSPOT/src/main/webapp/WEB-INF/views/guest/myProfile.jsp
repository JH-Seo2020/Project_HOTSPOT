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
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <div id="profile">
            <h1 align="center">내 프로필 관리</h1> 

            <br><hr><br><br>
            <form action="" method="POST" id="myProfile" enctype="multipart/form-data">
                <div id="profileImage"><img src="../../resources/images/profileImage.png"><h2 align="center">USER01</h2></div>
	                <div id="mainProfile">
	                    <div id="nickName">닉네임 : &nbsp;&nbsp;&nbsp;동동이</div>
	                    <div id="profileEmail">이메일 : &nbsp;&nbsp;&nbsp;user01@naver.com</div>
	                    <div id="profilePhone">연락처 : &nbsp;&nbsp;&nbsp;010-1111-2222</div> <br>
	                    <div id="switch">마케팅 수신동의 : <br><br>
	
	                       	 이메일 <input type="checkbox" name="marketingEmail" value="yes" disabled> 예
	                               <input type="checkbox" name="marketingEmail" value="no" checked> 아니오
	                               <br>&nbsp;&nbsp;
	                        SMS <input type="checkbox" name="marketingSms" value="yes" disabled> 예
	                              <input type="checkbox" name="marketingSms" value="no" checked > 아니오
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

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>