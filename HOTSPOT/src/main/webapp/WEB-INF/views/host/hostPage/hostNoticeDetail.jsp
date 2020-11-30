<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #noticeWrap{
        width: 100%;
        height: auto;
        margin: auto;
    }
    #noticeWrap div{
        width: 1200px;
        margin: auto;
    }
    #noticeTheme{
        text-align: center;
        font-weight: bold;
        font-size: 30px;
    }
    #notice{
        height: auto;
        padding: 3% 0;
    }
    #noticeTitle{
        width: 100%;
        height: 20%;
    }
    #noticeContent{
        width: 100%;
        height: 80%;
        padding: 3% 0;
    }
    .title{
        font-size: 25px;
    }
    .forRight{
        float: right;
    }
    /*페이지버튼*/
    #pagination{
        text-align: center;
        padding: 4% 0;
    }
    /*기타 css*/
    .purple{
        background-color: rebeccapurple !important;
        color: white !important;
        border: white;
    }
    .black{
        color: black !important;
        text-decoration: none !important;
        font-weight: lighter;
    }
</style>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../common/hostMenubar.jsp" />
	<jsp:include page="../common/subMenubar.jsp"/>


	<div style="position: absolute; top: 50px; left: 300px">
    

    <div id="noticeWrap">
        <div id="noticeTheme">
            <p>공지사항</p>
            <hr>
        </div>
        <div id="notice">
            <div id="noticeTitle">
                <span class="title">${vn.noticeTitle }</span>
                <span class="forRight">작성일 : ${vn.modifyDate }, 조회수 : ${vn.count }</span>
            </div>
            <div id="noticeContent">
                ${vn.noticeCon }
            </div>
            <hr>
        </div>
        <div id="pagination">
            <button class="btn purple" type="button">목록으로</button>
        </div>
    </div>
    
    <script>
    	$(function(){
    		$("#pagination").click(function(){
    			location.href="notice.ho";
    		})
    	})
    </script>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>