<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<style>

    #EnrollForm{
        width: 100%;
        height: 400px;
        position: relative;

    }
    #EnrollData1, #EnrollData2{
        float: left;
        box-sizing: border-box;
        
    }

    input[type=text], input[type=password]{
        width: 230px;
        height: 35px;
    }
</style>
<body>
	
    <div align="left" id="noticebar">
        <img src="resources/images/logo_letter_1.png" width="100px" height="25px" >
        <label style="color: yellowgreen; font-size: large ;">회원가입을 환영합니다</label><hr>
    </div>
    <div id="EnrollForm"> 
        <form method="POST" action="insert.me">
            <div id="EnrollData1" style="height: 400px; width: 30%;'">
                
                    <label for="userId"> 아이디 입력</label><br>
                    <input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요" required>
                    <div id="idCheckResult" style="font-size:0.8em"></div>
                    <br><br>
                    <label for="userPwd">비밀번호 입력</label><br>
                    <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요" required>
                    <div id="pwdCheckResult" style="font-size:0.8em"></div>
                    
                    <br><br>
                   <label for="userPwdCheck">비밀번호 확인</label><br>
                    <input type="password" id="userPwdCheck" placeholder="비밀번호를 확인해주세요" required>
                    <br>
                    <br><br>
                    <label for="userPhone">전화번호(선택)</label><br>
                    <input type="text" name="userPhone" placeholder="전화번호를 입력해주세요">
                
            </div>
            <div id="EnrollData2" style="height: 400px; width: 70%;">
                
                    <label for="userEmail">이메일 입력</label><br>
                    <input type="text" name="userEmail" placeholder="인증절차를 거쳐주세요" required> 
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    					이메일 인증
  					</button>
                    <br><br>
                    <label for="userNickname">닉네임 입력</label><br>
                    <input type="text" name="userNickname" id="userNickname" placeholder="사용할 닉네임을 입력해주세요" required>
                    <div id="nickCheckResult" style="font-size:0.8em"></div>
                
            </div>
            <div align="right">
                <a id="cancle" class="btn btn-danger" style=" width: 100px; height: 40px; margin-right: 50px;">취소</a>
                <a id="confirm" class="btn btn-primary" style=" width: 100px; height: 40px; margin-right: 50px;" href="insert.me">회원가입</a>
            </div>
        </form>
            
            <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
  
        
        <div class="modal-header">
          <h4 class="modal-title">이메일 인증</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
       
        <div class="modal-body">
            <input type="text" id="emailText">
            <button id="emailCheck" onclick="emailSend()" class="btn btn-primary" >인증번호 받기</button>
            <br><br>
            <input type="text" id="certificationNumber" style="width: 150px;">
            <button id="certificationBtn" onclick="emailCertification()" class="btn btn-primary" >인증하기</button>
        
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
  
      </div>
    </div>
  </div>

  <script>
  	$(function(){
  	
  	var $idInput = $("#EnrollData1 input[name=userId]");
  	
  	$idInput.keyup(function(){
  	
  		console.log($idInput.val());
  	if($idInput.val().length >= 5){
  		console.log($idInput.val());
      	$.ajax({
          	url :"checkId.me",
          	data: {userId : $idInput.val()},
          	dataType: "text",
          	success:function(result){
              if(result != ""){
            	  	console.log(result);
            	  
					$("#idCheckResult").show();
					$("#idCheckResult").css("color", "green").text("사용가능한 아이디입니다.");
					$("#confirm").removeAttr("disabled");
              }else if(result == 0){
					$("#idCheckResult").show();
					$("#idCheckResult").css("color", "red").text("중복된 아이디가 존재합니다. 다시입력해주세요.");
					$("#confirm").prop("disabled", true);
					
              }
            },error:function(){
          		console.log("아이디 중복체크용 ajax 통신 실패");
          		}
      	})
  	}else{
				$("#idCheckResult").hide();
  		}
      
  	})
  	})
  	</script>
  	<script>
  	/*
  	let $pwdInput =$("#EnrollData1 input[name=userPwd]");
  	
  	$pwdInput.keyup(function(){
  		if($pwdInput.val().lenght >= 3){
  			
  			var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

  			if(!refExpPw.test($("#userPwd"))){
  				$("#pwdCheckResult").css("color", "red").text("숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력해주세요");
  				$("#confirm").prop("disabled", true);
  			}else{
  				$("#confirm").removeAttr("disabled");
  			}
  		}
  	});
  			
  			
  	let $nickInput = $("#EnrollData1 input[name=userNickname]");
  		  	
  	$idInput.keyup(function(){
  		  	
  	if($nickInput.val().length >=5){
  		      	$.ajax({
  		          	url :"checkNick.me",
  		          	type:"POST",
  		          	dataType: "json",
  		          	data: {"userNickname": $("#userNickname").val()},
  		          	success:function(data){
  		              if(date == 1){
  							$("#nickCheckResult").show();
  							$("#nickCheckResult").css("color", "green").text("사용가능한 닉네임입니다.");
  							$("#confirm").removeAttr("disabled");
  		              }else if(data == 0){
  							$("#nickCheckResult").show();
  							$("#nickCheckResult").css("color", "red").text("중복된 닉네임이 존재합니다. 다시입력해주세요.");
  							$("#confirm").prop("disabled", true);
  							
  		              }
  		            },error:function(){
  		          		console.log("아이디 중복체크용 ajax 통신 실패");
  		          		}
  		      	})
  		  	}else{
  						$("#nickCheckResult").hide();
  		  		}
  		      
  		  	});  	
  	
  	
  	
  	
  	
  	
  	*/
  	
  
  
      function emailSend(){
          let clientEmail = $("#emailText").val();
          let emailYN = isEmail(clientEmail);

          if(emailYN == true){
              alert('이메일 형식입니다.');

              $.ajax({
                  type:"POST",
                  url:"email.certify",
                  data:{userEmailCheck:clientEmail},
                  success : function(data){
					  alert('메일이 전송되었습니다.')
                  },error : function(e){
                      alert('오류입니다. 다시 시도해주십시오.')
                  }
              });
          }else{
              alert('이메일 형식에 알맞게 입력해주세요 ex)xxxx@xxx.com')
          }
      }

      function isEmail(asValue){
          var regExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          return regExp.test(asValue);
      }
      
      function emailCertification(){
          let clientEmail = document.getElementById('emailText').value;
          let inputCode = document.getElementById('certificationNumber').value;

          console.log('이메일'+clientEmail);
          console.log('인증코드'+inputCode);

          $.ajax({
              type:"POST",
              url:"certificationNumber.check",
              data:{userEmailCheck:clientEmail, inputCode:inputCode},
              success:function(result){
                console.log(result);
                if(result=true){
                  alert('인증 완료');
                  document.getElementById('certificationYN').value ="true";
                  clientEmail.onchange = function(){
                    document.getElementById('certificationYN').value="false";
                  };
                  
                  $("#userEmail").attr("text", clientEmail);
                }else{
                  alert('다시 한번 시도해주시기 바랍니다.')
                }
              }
          })
      }
      
  </script>



    </div>
    <br><br><br><br><br><br><br><br>
    
    <jsp:include page="footer.jsp"/>



</body>
</html>