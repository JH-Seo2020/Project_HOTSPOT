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
    #noticeWrap div,form{
        margin: auto;
    }
    #noticeTitle{
        text-align: center;
        font-weight: bold;
        font-size: 30px;
        padding-top:3%;
    }
    /*공지사항 검색*/
    #noticeSearch{
        width: 1200px;
        height: auto;
        margin-top: 4%;
        margin-bottom: 4%;
    }
    /*공지사항 테이블*/
    #noticeSpace{
        width: 1200px;
        height: auto;
        padding: 2% 2%;
        background-color: white;
    }
    /*페이지버튼*/
    #pagination{
        text-align: center;
        padding: 4% 0;
    }
    #pagination>button{
        border: none;
        background-color: rebeccapurple;
        color: white;
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
        <div id="noticeTitle">
            <p>공지사항</p>
        </div>
        <form id="noticeSearch">
            <div class="input-group mb-3">
                <span style="font-size: 20px;">공지사항 검색 |</span>&nbsp;&nbsp;
                <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                  <button type="submit" class="input-group-text purple" id="basic-addon2">검색</button>
                </div>
            </div>
        </form>
        <div id="noticeSpace">
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col" >제목</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">
                        <a href="" class="black">코로나 확산으로 인한 공간대여 안내드립니다</a>
                    </th>
                    <td>2020-10-10</td>
                  </tr>
                  <tr>
                    <th scope="row">
                        <a href="" class="black">코로나 확산으로 인한 공간대여 안내드립니다</a>
                    </th>
                    <td>2020-10-10</td>
                  </tr>
                  <tr>
                    <th scope="row">
                        <a href="" class="black">코로나 확산으로 인한 공간대여 안내드립니다</a>
                    </th>
                    <td>2020-10-10</td>
                  </tr>
                  <tr>
                    <th scope="row">
                        <a href="" class="black">코로나 확산으로 인한 공간대여 안내드립니다</a>
                    </th>
                    <td>2020-10-10</td>
                  </tr>                  <tr>
                    <th scope="row">
                        <a href="" class="black">코로나 확산으로 인한 공간대여 안내드립니다</a>
                    </th>
                    <td>2020-10-10</td>
                  </tr>
                </tbody>
              </table>
        </div>
        <div id="pagination">
            <button class="badge badge-pill badge-warning">이전</button>
            <button class="badge badge-pill badge-warning">1</button>
            <button class="badge badge-pill badge-warning">2</button>
        </div>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>