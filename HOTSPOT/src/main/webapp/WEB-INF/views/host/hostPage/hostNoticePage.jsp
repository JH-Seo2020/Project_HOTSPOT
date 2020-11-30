<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
    table>thead,tbody>tr>th,td{text-align:center;}
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
    .purple:hover{
    	color:gray;
    }
    .black{
        color: black !important;
        text-decoration: none !important;
        font-weight: lighter;
    }
    .disabled{
    	disabled:true;
    	background-color: black;
    }
</style>
<body>
	<jsp:include page="../common/hostMenubar.jsp" />
	<jsp:include page="../common/subMenubar.jsp"/>


	<div style="position: absolute; top: 50px; left: 300px">
    <div id="noticeWrap">
        <div id="noticeTitle">
            <p>공지사항</p>
        </div>
        <form id="noticeSearch" style="border:3px solid lavender; padding:2%;" method="get" action="searchNotice.ho">
            <div class="input-group mb-3">
                <span style="font-size: 20px;">공지사항 검색</span><br>
                <input type="text" name="keyword" value="${keyword }" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2" style="width:600px;">
                <div class="input-group-append">
                  <button type="submit" class="btn btn-primary" id="basic-addon2">검색</button>
                </div>
            </div>
        </form>
        <div id="noticeSpace">
            <table class="table table-hover table-striped">
                <thead>
                  <tr>
                  	<th scope="col" >글번호</th>
                    <th scope="col" >제목</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${!empty list }">
		                	<c:forEach var="v" items="${list }">
				                  <tr>
				                  	<th>${v.noticeNo }</th>
				                    <td scope="row">
				                        <a href="noticeDetail.ho?nno=${v.noticeNo }" class="black">${v.noticeTitle }</a>
				                    </td>
				                    <td>${v.createDate }</td>
				                  </tr>
		                	</c:forEach>  
		                </c:when>
		                <c:otherwise>
		                	<tr>
			                  	<th></th>
			                    <td scope="row">
			                        <p style="font-size:20px;">"보여드릴 결과가 없습니다. 다시 검색해보세요."</p>
			                    </td>
			                    <td></td>
			                 </tr>
		                </c:otherwise>
                	</c:choose>
                </tbody>
              </table>
        </div>
        
        <div id="pagination">
       	<c:choose>
       		<c:when test="${pi.currentPage eq 1 }">
	            <a class="badge badge-pill purple disabled">이전</a>
	        </c:when>
	        <c:otherwise>
	        	<c:choose>
        			<c:when test="${empty keyword }">
		        	<!-- 검색하기전 요청 url -->
	        			<a href="notice.guest?currentPage=${pi.currentPage-1}" class="badge badge-pill purple">이전</a>
	            	</c:when>
	            	<c:otherwise>
	            	<!-- 검색요청 후 url -->
            		    <c:url var="searchURL" value="searchNotice.guest">
       						<c:param name="currentPage" value="${pi.currentPage-1 }" />
       						<c:param name="keyword" value="${keyword }" />
       					</c:url>
	        			<a href="${searchURL}" class="badge badge-pill purple">이전</a>
	            	</c:otherwise>
	            </c:choose>
	        </c:otherwise>
	    </c:choose>
	    
	    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
	    	    <c:choose>
        			<c:when test="${empty keyword }">
		        	<!-- 검색하기전 요청 url -->
	            		<a href="notice.ho?currentPage=${p }" class="badge badge-pill purple">${p }</a>
	            	</c:when>
	            	<c:otherwise>
	            	<!-- 검색요청 후 url -->
            		    <c:url var="searchURL" value="searchNotice.ho">
       						<c:param name="currentPage" value="${p }" />
       						<c:param name="keyword" value="${keyword }" />
       					</c:url>
       					<a href="${searchURL }" class="badge badge-pill purple">${p }</a>
	            	</c:otherwise>
	            </c:choose>
	    </c:forEach>
	            
	    <c:choose>
	    	<c:when test="${pi.currentPage eq pi.maxPage}" >
	    		<a class="badge badge-pill purple disabled">다음</a>
	    	</c:when>
	    	<c:otherwise>
	    		<c:choose>
        			<c:when test="${empty keyword }">
		        		<!-- 검색하기전 요청 url -->
	        			<a href="notice.ho?currentPage=${pi.currentPage +1 }" class="badge badge-pill purple">다음</a>
	            	</c:when>
	            	<c:otherwise>
	            		<!-- 검색요청 후 url(검색결과있을때,없을때로 조건처리) -->
	            		<c:choose>
	            			<c:when test="${empty list }">
	            				<a class="badge badge-pill purple disabled">다음</a>
	            			</c:when>
	            			<c:otherwise>
		            		    <c:url var="searchURL" value="searchNotice.ho">
		       						<c:param name="currentPage" value="${pi.currentPage +1 }" />
		       						<c:param name="keyword" value="${keyword }" />
		       					</c:url>
			    				<a href="${searchURL }" class="badge badge-pill purple">다음</a>
			    			</c:otherwise>
			    		</c:choose>
	            	</c:otherwise>
	            </c:choose>
	    	</c:otherwise>
	    </c:choose>    
       </div>
   </div>
	</div>


	<jsp:include page="../../common/footer.jsp" />
</body>
</html>