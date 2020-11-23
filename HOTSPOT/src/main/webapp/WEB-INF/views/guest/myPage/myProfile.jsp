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
	    width: 770px;
	    background: rgb(243, 243, 243);
	}
	#profileImage{
        float: left;
        margin-left: 80px;
	}
	#mainProfile{
	    font-weight: bold;
	    font-size: 15px;
	    color:rgb(80, 80, 80)
	}
	#mainProfile div{
	    padding: 15px;
	    margin-left: 330px;
	}
	#profileBtn button{
	    width: 150px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	#serviceWithdrawal{
	    background: rgb(243, 243, 243);
	    padding: 15px;
	    margin: 19%;
	    margin-left: 40%;
	    width: 400px;
	    box-shadow: 3px 3px 3px 3px rgb(207, 207, 207);
	}
	#serviceInfo{
	    color: gray;
	    font-size: 14px;
	}
	.serviceBtn{
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
</style>
</head>
<body>
   <!--메뉴바 포함-->
    <jsp:include page="../../common/menubar.jsp"/>

    <div class="content">
        <div id="profile">
            <h2 align="center">내 프로필</h2> 

            <br><hr><br><br>
            <form action="myProfile.me" method="POST" id="myProfile" enctype="multipart/form-data">
                <div id="profileImage">
                
                <img src="resources/images/profileImage.png" id="target_img" width="150px" height="150px" onerror="">
                <h2 align="center">${ loginUser.userId }</h2>

                </div>

                <div id="mainProfile">
                    <div id="nickName">닉네임 : &nbsp;&nbsp;&nbsp;${ loginUser.userNickname }</div>
                    <div id="profileEmail">이메일 : &nbsp;&nbsp;&nbsp;${ loginUser.userEmail }</div>
                    <div id="profilePhone">연락처 : &nbsp;&nbsp;&nbsp;${ loginUser.userPhone }</div> <br>
                    <div>마케팅 수신동의 : <br><br>

                                                    이메일   &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="yes" disabled> 예
                             &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="no" checked> 아니오
                             <br>&nbsp;&nbsp;
                        SMS &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="yes" disabled> 예
                            &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="no" checked > 아니오

                    </div>
                </div>
                <br><br><hr><br>
                <div id="profileBtn" align="center"> 
                    <button type="button" onclick="location.href='profileUpdate.me'">내 프로필 변경하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="serviceBtn" data-toggle="modal" data-target="#deleteForm">서비스 탈퇴</button>
                </div>
            </form>
        </div>
    </div>
    <br><br>
    
 
     <!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                   	<br>
		            <h3><b>서비스 탈퇴하기 전에 꼭 확인하세요!</b></h3>
		            <br>
		            <p id="serviceInfo">
		            	서비스 탈퇴시 내 프로필, 예약내역의<br>
		              	 모든 정보가 삭제되며 이후 복구가 불가능합니다.
		            </p>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
	            	<form action="" method="POST">
		                <div>
		                    <label for="agreePwd">비밀번호 : </label>
		                    <input type="password" name="userPwd" id="agreePwd" required>
		                    <br><br>
		                    <input type="checkbox" name="agreeChecked" id="agreeChecked" required>
		                    <label for="agreeChecked">위의 내용을 숙지했으며 탈퇴에 동의합니다.</label><br>
		                    <span style="color: red;"><small>! 서비스 탈퇴동의는 필수항목입니다</small></span>
		                </div>
		                <br>
		               <button type="submit" class="btn btn-danger">탈퇴하기</button>
	            	</form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 
   	<div id="serviceWithdrawal">
   		<div align="center">
            <br>
            <h3><b>서비스 탈퇴하기 전에 꼭 확인하세요!</b></h3>
            <p id="serviceInfo">
            	서비스 탈퇴시 내 프로필, 예약내역의<br>
              	 모든 정보가 삭제되며 이후 복구가 불가능합니다.
            </p>
            <form action="" method="POST">
                <div>
                    <label for="agreePwd">비밀번호 : </label>
                    <input type="password" name="userPwd" id="agreePwd" required>
                    <br><br>
                    <input type="checkbox" name="agreeChecked" id="agreeChecked" required>
                    <label for="agreeChecked">위의 내용을 숙지했으며 탈퇴에 동의합니다.</label><br>
                    <span style="color: red;"><small>! 서비스 탈퇴동의는 필수항목입니다</small></span>
                </div>
                <br>
                <button type="button" class="serviceBtn" onclick="modal.hide()">취소하기</button>
                <button type="submit" class="btn btn-danger">탈퇴하기</button>
            </form>
        </div> <br>
   	</div>
     -->


    <br clear="both"><br><br>
    
    <!-- 푸터바 포함 -->
    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>