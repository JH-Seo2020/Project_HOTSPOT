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
        background-color: rebeccapurple;
        color: white;
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
                <span class="title">코로나 확산으로 인한 공간 대여 이용 안내드립니다.</span>
                <span class="forRight">작성일 : 2020-10-10, 조회수 : 3</span>
            </div>
            <div id="noticeContent">
                코로나 확산으로 인한 공간 대여 이용 안내입니다. <br>
                시간대가 아래와 같이 바뀔 예정이니 참고바랍니다. <br>
                또한 방역 수칙을 지켜주시길 바랍니다. <br>
                본사는 코로나 감염에 대한 일체의 책임을 지지 않습니다. <br>
                코로나 확산으로 인한 공간 대여 이용 안내입니다. <br>
                시간대가 아래와 같이 바뀔 예정이니 참고바랍니다. <br>
                또한 방역 수칙을 지켜주시길 바랍니다. <br>
                본사는 코로나 감염에 대한 일체의 책임을 지지 않습니다. <br>
                코로나 확산으로 인한 공간 대여 이용 안내입니다. <br>
                시간대가 아래와 같이 바뀔 예정이니 참고바랍니다. <br>
                또한 방역 수칙을 지켜주시길 바랍니다. <br>
                본사는 코로나 감염에 대한 일체의 책임을 지지 않습니다. <br>
            </div>
            <hr>
        </div>
        <div id="pagination">
            <button class="btn purple" type="button">목록으로</button>
        </div>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>