<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
	    background: rgb(243, 243, 243);
	    margin-top: 40px;
	}
	#likeWrap div{margin: auto;}
	/*찜한공간*/
	#likeSpace{
	    width: 100%;
	    height: auto;
	}
	#todaySpaceGroup{
	    width: 1200px;
	    height: 90%;
	    padding-top: 6%;
	    text-align: center;
	    margin: auto;
	}
	.todaySpace{
	    display: inline-block;
	    padding: 0 0 4% 4%;
	    width: 30%; 
	    height: 80%;
	}
	.todaySpace img{
	    width: 300px;
	    height: 200px;
	}
	/*페이지버튼*/
	#pagination{
	    text-align: center;
	    padding-bottom: 4%;
	}
	/*#pagination-area>button{
	    border: none;
	    background-color: rebeccapurple;
	    color: white;
	}
	*/
	#paging-area li>a{color: rgb(139, 138, 138)}
	/*기타 css*/
	.purple{
	    background-color: rebeccapurple;
	    color: white;
	    border: white;
	}
</style>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
       	<br><br><br>
         <h2 align="center"><b>내가 찜한 공간</b></h2>
        <div id="likeSpace">
            <div id="todaySpaceGroup">
              <c:forEach var="w" items="${ wishList }">
              <input type="hidden" name="userId" value="${ loginUser.userId }">
                <div class="todaySpace">
                    <a href="spaceDetail.guest?spcNo=${ w.spcNo }"><img src="resources/images/spaces/${ w.spcImg }"></a>
                    <div style="font-weight: bold; font-size: 20px;">
                    <c:set var="location" value="${ w.location }"/>
                    <c:set var="location2" value="${fn:substring(location,0,2)}"/>
                    [${ location2 }][${ w.spcType }] ${ w.spcName }
                    </div>
                    <div>${ location2 } | ${ w.spcTag }</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">${ w.spcPrice }원</span>
                        <span class="badge badge-pill badge-warning">후기 ${ w.reviews }개</span>
                        <span class="badge badge-pill badge-warning">관심 ${ w.wishes }개</span>
                        <button type="button" class="badge badge-pill purple" onclick="location.href='deleteWish.lv?spcNo=' + ${w.spcNo}">👾찜해제</button>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
        <br><br><br>
        

        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <c:choose>
                   	<c:when test="${ pi.currentPage eq 1}">
                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myLike.lv?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<input type="hidden" name="userId" value="${ loginUser.userId }"> 
                   	<li class="page-item"><a class="page-link" href="myLike.lv?currentPage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="myLike.lv?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                    </c:otherwise>
               	</c:choose>
            </ul>
        </div><br><br><br>
        
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>

</body>
</html>