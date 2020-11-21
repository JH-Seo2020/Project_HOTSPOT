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
    .disabled{
    	disabled:true;
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
                	<!-- 글번호를 만드는게 낫겠다 -->
                	<c:forEach var="v" items="${list }">
		                  <tr>
		                    <th scope="row">
		                        <a href="" class="black">${v.noticeTitle }</a>
		                    </th>
		                    <td>${v.createDate }</td>
		                  </tr>
                	</c:forEach>  
                	
                </tbody>
              </table>
        </div>
        <div id="pagination">
        	<!-- 아직 링크연결 안했음. -->
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1 }">
		            <button class="badge badge-pill badge-warning disabled">이전</button>
		        </c:when>
		        <c:otherwise>
		        	<button class="badge badge-pill badge-warning">이전</button>
		        </c:otherwise>
		    </c:choose>
		    
		    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
		            <button class="badge badge-pill badge-warning">${p }</button>
		    </c:forEach>
		            
		    <c:choose>
		    	<c:when test="${pi.currentPage eq pi.maxPage}" >
		    		<button class="badge badge-pill badge-warning disabled">다음</button>
		    	</c:when>
		    	<c:otherwise>
		    		<button class="badge badge-pill badge-warning">다음</button>
		    	</c:otherwise>
		    </c:choose>        
		            
        </div>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>