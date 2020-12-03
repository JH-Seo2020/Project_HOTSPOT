<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
            <input type="hidden" name="reviewNo" value="${ rv.reviewNo }">
            <h2 align="center"><b>이용후기 작성</b></h2>
            <br><hr><br>
            <div id="reviewHeader" style="border: 2px solid rgb(145, 37, 247);">
                <dl>
                    <dt><b> 예약번호 : 22345622</b></dt><br>
                    <dd>
                        <b style="color: rgb(145, 37, 247);">공간명 : [카페][경복궁역] 그리다꿈</b><br>
                        <small> 이용날짜 : 2020.10.23</small>
                    </dd>
                </dl>
            </div>
            <br><br>
            <form method="POST">
                <label for="reviewTitle"><b>제목</b></label>
                <input type="text" name="reviewTitle" id="reviewTitle" placeholder="제목을 입력하세요" maxlength="80" size="80" required> &nbsp;&nbsp;
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
                    <textarea id="summernote" name="reviewContent" required></textarea><br><br><br><br>
                    <div class="forMiddle">
                        <button type="submit" class="reviewBtn">후기등록</button> &nbsp;&nbsp;&nbsp;
                        <button type="button" class="reviewBtn">취소하기</button>
                    </div>
                </div>
            </form>
        </div>
        <br><br>
        
        
		<script>
		$(document).ready(function() {
			  $('#summernote').summernote({
		 	    	placeholder: 'content',
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