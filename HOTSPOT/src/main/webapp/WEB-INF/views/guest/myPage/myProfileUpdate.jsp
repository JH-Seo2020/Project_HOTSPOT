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
	    top: 25%;
	    left: 50%;
	    margin: auto;
	    margin-right: 23%;
	    margin-top: 50px;
	    padding: 50px;
	    width: 750px;
	    background: rgb(243, 243, 243);
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
    #mainProfile div{margin-left: 300px;}
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
             <h2 align="center">내 프로필 관리</h2> 
 
             <br><hr><br><br>
             <form action="update.me" method="POST" id="myProfile" enctype="multipart/form-data">
                 <div id="profileImage">
                    
                    <img src="resources/images/profileImage.png" id="target_img"><h2 align="center">${ loginUser.userId }</h2>
	                <input type="file" name="userProfile" id="userProfile" style="display:none;" onchange="changeValue(this)">
	                <input type="hidden" name="target_url">
	                
                 </div>
 
                 <div id="mainProfile">
                    <div>
                        <label for="usernickName">닉네임</label> &nbsp;&nbsp;&nbsp;
                        <input type="text" name ="usernickName" id="nickName" value="${ loginUser.userNickname }"><br><br>
                        
                        <label for="userEmail">이메일</label> &nbsp;&nbsp;&nbsp;
                        <input type="text" name="userEmail" id="userEmail" value="${ loginUser.userEmail }">
                        <button type="button" id="emailCode">이메일 인증</button><br><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="emailConfirmCode" placeholder="인증코드를 입력하세요."><br><br>

                        <label for="userPhone">연락처</label>&nbsp;&nbsp;&nbsp;
                        <input type="text" name ="userPhone" id="profilePhone" value="${ loginUser.userPhone }">
                    </div>
					<br>
                    <div id="userPwd">
                        <span>비밀번호 변경</span><br><br>
                        <label for="password_1">현재 비밀번호 <br>
                            <input type="password" name="userPwd" id="password_1" style="width: 250px"><br><br>
                        </label>
                        <label for="password_2">새 비밀번호<br>
                            <input type="password" name="userPwd_Update" id="password_2" style="width: 250px"><br><br>
                        </label>
                        <label for="password_3">새 비밀번호 확인 <br>
                            <input type="password" name="userPwd_Check" id="password_3" style="width: 250px">
                        </label>
                    </div>
                    <br>
                    <div>마케팅 수신동의 : <br><br>

                                                    이메일   &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="yes"> 예
                             &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="no" checked> 아니오
                             <br>&nbsp;&nbsp;
                        SMS &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="yes"> 예
                            &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="no" checked > 아니오

                    </div>
                 </div>
                 <br><hr><br>
                 <div id="profileBtn" align="center"> 
                     <button type="button" onclick="location.href='update.me'">변경하기</button>
                 </div>
             </form>
         </div>
     </div>
     
     
    <script>
		$('#target_img').click(function(){
			$("input[name='userProfile']").click();
		})
		
		// 업로드된 파일체인지가 됐을경우 실행될 이벤트(userProfile은 hidden으로 넣어줌)
		$("input[name='userProfile']").change(function(e){
			
		})
    </script>
     
     <br clear="both"><br><br>
 
     <jsp:include page="../../common/footer.jsp"/>
</body>
</html>