<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #content{
        margin-top: 32px;
    }
    #reviewContent{
        padding: 100px;
        margin: auto;
        margin-top: -50px;
        width: 70%;
    }
    #reviewHeader{
        padding: 15px;;
    }
    .forMiddle{
        text-align: center;
        margin-top: 3%;
    }
    .reviewBtn{
        width: 100px;
        height: 30px;
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px
    }
</style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="reviewContent">
            <input type="hidden" name="userId" value="${ loginUser.userId }">
            <input type="hidden" name="reservNo" value="${ r.reservNo }">
            <h2 align="center"><b>이용후기 작성</b></h2>
            <br><hr><br>
            <div id="reviewHeader" style="border: 2px solid rgb(145, 37, 247);">
                <dl>
                    <dt><b> 예약번호 : ${ r.reservNo }</b></dt><br>
                    <dd>
                        <b style="color: rgb(145, 37, 247);">공간명 : [${ r.spcType }][${ r.location }] ${ r.spcName }</b><br>
                        <small> 이용날짜 : ${ rv.useDate }</small>
                    </dd>
                </dl>
            </div>
            <br><br>
            <form method="POST">
                <label for="reviewTitle"><b>제목</b></label> &nbsp;&nbsp;
                <input type="text" name="reviewTitle" id="reviewTitle" placeholder="제목을 입력하세요" maxlength="80" size="80" required> &nbsp;&nbsp;&nbsp;
                <label for="reviewStar"><b>별점</b></label>
                <select name="reviewStar" id="reviewStar" required>
                    <option value="5">5점</option>
                    <option value="4">4점</option>
                    <option value="3">3점</option>
                    <option value="2">2점</option>
                    <option value="1">1점</option>
                </select>
                <br><br>
                <div method="post" id="reviewEnrollCotent">
                    <textarea id="summernote" name="reviewContent" style="resize:none" required ></textarea><br><br>
                    <div class="forMiddle">
                        <button type="submit" class="reviewBtn">후기등록</button> &nbsp;&nbsp;&nbsp;
                        <button type="button" class="reviewBtn">취소하기</button>
                    </div>
                </div>
            </form>
        </div>
        <br><br>
        
        <!-- 
        	썸머노트 사용시 주의 ! 
        	메뉴바를 포함하고 있으면 썸머노트 스크립트(src경로)는 메뉴바에 갖다붙이자! 계속 이 페이지에서 붙일려고 하니까 적용 1도안됨
          -->
		<script>
		$(document).ready(function() {
			  $('#summernote').summernote({
		 	    	placeholder: '내용을 입력하세요',
                    maxHeight : 500,
                    minHeight: 500,
			        focus: true, 
			        lang : 'ko-KR'
			  });
			});
		</script>
    </div>
    <br><br>



    <!--푸터-->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>