<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<link rel="stylesheet" href="resources/css/host/hostqna.css" type="text/css"/>

</head>
<body>
<jsp:include page="../common/hostMenubar.jsp" />
	

<jsp:include page="../common/subMenubar.jsp" />
   <div id="qnaContainer">
        <div class="qnaContainer_1">
            <div class="container_head" >
                <p style="color: white; font-size:17px;">Q&A 관리</p>
            </div>
            <div class="searchContainer">
                <p style="display: block; font-size: 17px;">공간선택</p>
                <form action="" method="post" id="selectQnaListForm">
                	
                    <input type="text" name="spcNo" list="space" class="searchSpace"placeholder="공간을 선택해주세요">
                  
                   <!--	<input type="hidden" name="spcNo" value="${ sp.spcNo }">  --> 
	                    <datalist id="space">
	                      <c:forEach var="sp" items="${ space }">
	                        <option class="hiddenSpcNo"value="${sp.spcNo }">${sp.spcName}</option>
	                       </c:forEach>
	                    </datalist>
           		  
                    <input type="image" img src="resources/images/host_images/search.png" onclick="searchSubmit();" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                </form>
            </div>
         </div>
        <div class="qnaSpace" style="background-color: rgb(250, 248, 249); margin-top: 20px;">
            <div></div>
            <c:if test="${ list == null}">
            	<div><h5>작성 된 Q&A가 없습니다 !</h5></div>
            </c:if>
            <c:forEach var="li" items="${list}">
            <div class="qna_1">
                <div class="question">
                    <h5>공간명 :[${li.spcType }]${li.spcName }
                    <c:if test="${li.qaSecret eq 'Y' }">
                   		 <span style="color:red; margin-right:30px;">[비밀글]</span>
                    </c:if>
                    </h5><br>
                    <p>${li.qaContent}</p><Br><br>
                    <span>${li.qaDate }</span>
                </div><hr>
                <div class="answer">
                    <h5>호스트 답글</h5>
                    <textarea rows="3"class="form-control" >A. 09:00~18:00입니다.</textarea>
                    <span>2020.10.22</span>
                    <button class="btn btn-warning">수정</button><button class="btn btn-primary">삭제</button>
                </div>
            </div>
        </c:forEach>
          
        </div>
    </div>
    <nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
    <script>
    
    	function searchSubmit(){
    		$('#selectQnaListForm').attr("action","selectQnaList.ho").submit();
    	}
    
    </script>
</body>
</html>