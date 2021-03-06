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
        margin-left: 60px;
    }
    #mainProfile{
        font-weight: bold;
        font-size: 15px;
        color:rgb(80, 80, 80)
    }
    #mainProfile div{margin-left: 300px;}
    #emailCode:hover{background: rgb(184, 108, 255);}
    #profileBtn button{
        width: 150px;
        height: 30px;
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px;
    }
    #profileBtn button:hover{background: rgb(184, 108, 255);}
    #userPwdArea label{
        font-size: small;
        color: rgb(145, 37, 247);
    }
    #emailCode{
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px;
        width: 130px;
    }
   	.serviceBtn{
    width: 120px;
    height: 30px;
    background:  rgb(145, 37, 247);
    color:white;
    border: none;
    border-radius: 3px;
	}
	.serviceBtn:hover{background: rgb(184, 108, 255);}
	#profileImage .target_img{border-radius:100%}
</style>
</head>
<body>
     <jsp:include page="../../common/menubar.jsp"/>

     <div class="content">
         <div id="profile">
             <h2 align="center">내 프로필 관리</h2><br><hr><br><br>
             <form action="update.me" method="POST" id="myProfile" enctype="multipart/form-data">
                 <div id="profileImage">
                 	<input type="hidden" name="userId" value=${ loginUser.userId }>
	                <c:choose>
		                <c:when test="${ loginUser.userProfile != null}">
		                	<img class="target_img" width="160px" height="160px" src="<c:url value='resources/images/profile/${ loginUser.userProfile }'/>">
						</c:when>
						<c:otherwise>
							<img class="target_img" width="160px" height="160px" src="resources/images/profileImage.png" >
						</c:otherwise>
		            </c:choose>  
                    <h2 align="center">${ loginUser.userId }</h2>
	                <input type="file" name="upfile" id="upfile" style="display:none;">
                 </div>
                 <div id="mainProfile">
                    <div>
                        <label for="userNickName">닉네임</label> &nbsp;&nbsp;&nbsp;
                        <input type="text" name ="userNickname" id="userNickname" value="${ loginUser.userNickname }" required><br>
                        <span id="checkNickname" style="font-size:0.8em"></span><br>

                        <label for="userEmail">이메일</label> &nbsp;&nbsp;&nbsp;
                        <input type="email" name="userEmail" id="userEmail" value="${ loginUser.userEmail }">
                        <!-- <button type="submit" class="serviceBtn" class="btn btn-primary" data-toggle="modal" data-target="#emailModal">이메일 인증받기</button>--><br><br>

                        <label for="userPhone">연락처</label>&nbsp;&nbsp;&nbsp;
                        <input type="text" name ="userPhone" id="profilePhone" value="${ loginUser.userPhone }"><br>
                    </div>
					<br><br>
                    <div id="userPwdArea">
                        <span>비밀번호 변경</span><br><br>
                        <label for="userPwd">현재 비밀번호 <br>
                        	<input type="password" name="userPwd" id="userPwd" style="width: 250px" required><br><br>
                        </label>
                        <label for="newUserPwd">새 비밀번호<br>
                        	<!-- <span id="checkUpdatePwd" style="font-size:0.8em; color:rgb(145, 37, 247)">
                        	(숫자, 특문 각 1회 이상,영문은 2개 이상 사용하여<br> 8자리 이상 입력해주세요.)</span><br> -->
                        	<input type="password" name="newUserPwd" id="newUserPwd" style="width: 250px" required><br>
                        </label><br>
                        <br>

                        <label for="newUserPwdCheck">새 비밀번호 확인 <br>
                        	<input type="password" id="newUserPwdCheck" style="width: 250px" required><br>
                        	<span id="checkResult" style="font-size:0.9em"></span><br><br>
                        </label>             
                    </div>
                    <div>마케팅 수신동의 : <br><br>

                                          이메일   &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="yes"> 예
                             &nbsp;&nbsp;&nbsp;<input type="radio" name="updateEmail" value="no" checked> 아니오
                             <br>&nbsp;&nbsp;
                        SMS &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="yes"> 예
                            &nbsp;&nbsp;&nbsp;<input type="radio" name="updateSms" value="no" checked > 아니오

                  	</div><br><hr><br>
             	  	</div>	
	                <div id="profileBtn" align="center"> 
	                    <button type="submit">수정하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <button type="button" onclick="location.href='myProfile.me'">취소하기</button>
	                </div>
             </form>
         </div>
     </div>
     
     <!-- 프로필사진 첨부파일 클릭이벤트 -->
	 <script>
			$('.target_img').click(function(){
				$("input[name='upfile']").click();
			})
			
			$(function(){
				$("#upfile").on('change', function(){
					readURL(this);
				});
			});
			function readURL(img){
				if(img.files && img.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$('.target_img').attr('src', e.target.result);
					}
					
					reader.readAsDataURL(img.files[0]);
				}
			}
	    </script>
	    
	    <!-- 닉네임 중복체크 -->
	    <script>
	    	$(function(){
	    		var $idInput = $("#myProfile input[name=userNickname]");
	    		
	    		$idInput.keyup(function(){
	    			
	    			if($idInput.val().length >= 2){
	    				
	    				$.ajax({
	    					url:"updateCheckNickname.me",
	    					data:{"userNickname":$("#userNickname").val()},
	    					success:function(result){
	    						
	    						if(result == 'success'){
	    							$("#checkNickname").show();
	    							$("#checkNickname").css("color", "rgb(145, 37, 247)").text("사용가능한 닉네임입니다.");
	    						
	    						}else{
	    							$("#checkNickname").show();
	    							$("#checkNickname").css("color", "red").text("중복된 닉네임이 존재합니다.");
	    							
	    						}
	    					},error:function(){
	    						console.log("닉네임 중복체크용 ajax 통신실패")
	    						
	    					}
	    				})
	    			}else{
	    				$("#checkNickname").hide();
	    			}
	    		})
	    	})
	    </script>
	    
	    
	    <!-- 새 비밀번호 확인체크 -->
	    <script>
	    	$(function(){
	    		$("#checkResult").hide();
		    		
	    			$("#newUserPwdCheck").keyup(function(){
	    				
		    			var pwd1=$("#newUserPwd").val();
		    			var pwd2=$("#newUserPwdCheck").val();
		    			
	    			if(pwd1 == "" || pwd2 != ""){
	    				if(pwd1 == pwd2){
	    					$("#checkResult").show();
	    					$("#checkResult").css("color", "rgb(145, 37, 247)").text("새 비밀번호와 일치합니다.");
	    				}else{
	    					$("#checkResult").show();
	    					$("#checkResult").css("color", "red").text("새 비밀번호와 일치하지 않습니다.");
	    				}
	    			}
		    	})
	    	})
	    </script>
	    
	    
	    
      <!-- 이메일 인증모달 -->
	  <div class="modal" id="emailModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header" style="color: rgb(145, 37, 247)">
	          <h4 align="center">이메일 인증받기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <br>
	        <!-- Modal body -->
	        <div class="modal-body" align="center">
		        <form action="emailCode.me${ code }" method="POST">
                     <input type="number" name="emailInjeung" placeholder="인증코드를 입력하세요.">
             		 <button type="submit" class="serviceBtn">인증하기</button><br><br>
	          	</form>
	        </div>
	      </div>
	    </div>
	  </div>
	    

     
     <br clear="both"><br><br>
 
     <jsp:include page="../../common/footer.jsp"/>
</body>
</html>