<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!--제이쿼리-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 메뉴바 css -->
<link rel="stylesheet" href="resources/css/guest/menubar.css" type="text/css"/>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify cdn -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="resources/js/summernote-ko-KR.js"></script>
</head>
<body>
	<c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/> <!-- session영역 지우기 -->
	</c:if>
	

	<div id="menubar">
        <div id="logoSpace"><a href="/hotspot"><img src="resources/images/logo_letter_1.png" width="100%" height="70%"></a></div>
        <div id="search">
            <form action="search.hotspot" id="spaceSearchForm" method="GET">
                <input id="searchWord" name="searchWord" type="search" placeholder="검색어를 입력하세요!">
                <div><a id="a_search"><img src="resources/images/serarch_icon.png" width="80%" height="90%"></a></div>
            </form>
        </div>
        <div id="menuOptions">
            <c:choose>
            	<c:when test="${ empty loginUser }">
		            <div><a></a></div>
		            <!-- 로그인 버튼 -->
		            <div><a id="loginBtn" style="cursor: pointer;">로그인</a></div>
		
			            <!-- 로그인 모달  -->
			            <div class="login_popup">
			                <div>
			                    <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em; float:right" title="닫기">X</span>
			                </div>
			                <form action="login.me" method="POST">
			                    <br>
			                    <img src="resources/images/hospot_logo.png" width="60px" height="60px">
			                    <label style="font-size: 25px; font-weight: bold;">로그인</label><br>
			                    <br>
			                        <input type="text" name="userId" id="userId" placeholder="아이디" style="width: 280px;"><br><br>
			                        <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" style="width: 280px;"><br>
								<br>
			                    	<button type="submit" id="loginInputBtn">로그인 하기</button> 
			                    <br><br>
			                    <div style="font-size: 12px;">
				                    <input type="checkbox" id="idSaveCheck">
				                    <label for="idSaveCheck">아이디 기억하기</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                    <a href="">비밀번호 찾기</a>
				                <br>
			                    </div>
			                </form>
			                <br><br>
			            </div>
			            
				        <div id="signUp"><a href="test.ho">회원가입</a></div>
				        
				        <div class="nav-item dropdown">
			                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                 	 고객센터
			                </a>
			                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			                  <a class="dropdown-item" href="notice.guest">공지사항조회</a>
			                  <a class="dropdown-item" href="faq.guest">자주묻는질문(챗봇,1:1문의)</a>
			                </div>
		            	</div>
			        </c:when>
			            
		       		<c:otherwise>
		            <div id="GoToHostPage"><a href="hostMain.ho">🏚&nbsp;호스트페이지</a></div>
		            <div><a id="myPageBtn" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</a></div>
		                       
		
		            <div class="myPage_popup" style=" width:300px; padding:30px; margin:20px;">
		            		<div>
		                    	<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em; float:right" title="닫기">X</span>
		                    </div>
		                <div id="myPage_Content">
		                    <img width="80px" height="80px" style="float:left; border-radius:100%;" src="<c:url value='resources/images/profile/${ loginUser.userProfile }'/>"> &nbsp;&nbsp;
		                    <span id="nickName">${ loginUser.userNickname } 님</span><br>
		                    <a href="myProfile.me" style="color: black; padding-left: 20px"><small>내 프로필 관리</small></a>
		                    <br><br><hr><br>
		                    <table id="myPageMenu">
		                    	<tr>
			                        <td>
			                            <img src="resources/images/Calendar.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
			                            <a href="myReserv.re"><span>나의 예약 리스트</span></a><br>
			                        </td>
		                        </tr>
		                        <tr>
			                        <td>
		                                <img src="resources/images/list.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
		                                <input type="hidden" name="reservNo" value="${ r.reservNo }">
		                                <a href="myReview.mg"><span>이용후기 / 문의관리</span></a> <br>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <img src="resources/images/heart.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
			                            <a href="myLike.lv"><span>찜한공간</span></a>
			                        </td>
			                     </tr>
		                    </table>    
		                </div>
		            </div>
		            
		            <div><a href="logout.me">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
		            <div class="nav-item dropdown">
		                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                 	 고객센터
		                </a>
		                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		                  <a class="dropdown-item" href="notice.guest">공지사항조회</a>
		                  <a class="dropdown-item" href="faq.guest">자주묻는질문(챗봇,1:1문의)</a>
		                </div>
		            </div>
		            
	        	</c:otherwise>
	         </c:choose>
	       </div>
  
        <script>
        function closeLayer( obj ) {
         $(obj).parent().parent().hide();
        }

         $(function(){

             $('#loginBtn').click(function(e)
             {
                 var sWidth = window.innerWidth;
                 var sHeight = window.innerHeight;

                 var oWidth = $('.login_popup').width();
                 var oHeight = $('.login_popup').height();

                 var divLeft = e.clientX + (-200);
                 var divTop = e.clientY + 30;

                 $('.login_popup').css({
                     "top": divTop,
                     "left": divLeft,
                     "position": "absolute"
                 }).show();
             });

         });
        </script>
  
        
         <script>
         function closeLayer( obj ) {
          $(obj).parent().parent().hide();
         }

          $(function(){

              $('#myPageBtn').click(function(e)
              {
                  var sWidth = window.innerWidth;
                  var sHeight = window.innerHeight;

                  var oWidth = $('.myPage_popup').width();
                  var oHeight = $('.myPage_popup').height();

                  var divLeft = e.clientX + (-150);
                  var divTop = e.clientY + 5;

                  $('.myPage_popup').css({
                      "top": divTop,
                      "left": divLeft,
                      "position": "absolute"
                  }).show();
              });

          });
          
          // 검색기능 (선경추가)
          $(function(){
        	  $("#a_search").click(function(){
        		  $("#spaceSearchForm").submit();
        	  });
          });
         </script>
    </div>

</body>
</html>