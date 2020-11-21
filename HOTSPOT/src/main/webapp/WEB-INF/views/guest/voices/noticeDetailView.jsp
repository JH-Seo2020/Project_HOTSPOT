<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
    <jsp:include page="../../common/menubar.jsp"/>    

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
    			location.href="notice.guest";
    		})
    	})
    </script>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>