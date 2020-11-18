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
          margin-top: 10%;
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
          width: 70px;
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
            <h2 align="center"><b>이용후기 작성하기</b></h2>
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
                <input type="text" name="inquiryTitle" id="reviewTitle" placeholder="제목을 입력하세요" maxlength="80" size="80" required> &nbsp;&nbsp;
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
                    <textarea id="reviewSummernote" name="editordata" required></textarea><br><br>
                    <div class="forMiddle">
                        <button type="submit" class="reviewBtn">등록</button>
                        <button type="button" class="reviewBtn">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        $(function(){
            $('#reviewSummernote').summernote({
            placeholder: '내용을 입력하세요',
            tabsize: 2,
            height:600,
            focus: true
            });
        });
    </script>

    <!--푸터-->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>