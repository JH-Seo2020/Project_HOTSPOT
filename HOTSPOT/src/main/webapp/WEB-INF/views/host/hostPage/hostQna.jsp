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
                <form>
                    <input type="text" name="" list="space" class="searchSpace"placeholder="공간을 선택해주세요">
                    <c:forEach var="sp" items="${ space }">
	                    <datalist id="space">
	                        <option>${sp.spcName}</option>
	                    </datalist>
           		    </c:forEach>
                    <input type="image" img src="resources/images/host_images/search.png" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                </form>
            </div>
         </div>
        <div class="qnaSpace" style="background-color: rgb(250, 248, 249); margin-top: 20px;">
            <div></div>
            <div class="qna_1">
                <div class="question">
                    <h5>공간명 :[카페]그리다움</h5><br>
                    <p>Q. 이용가능한 시간대가 궁금해요</p><Br><br>
                    <span>2020.10.22</span>
                </div><hr>
                <div class="answer">
                    <h5>호스트 답글</h5>
                    <textarea rows="3"class="form-control" >A. 09:00~18:00입니다.</textarea>
                    <span>2020.10.22</span>
                    <button class="btn btn-warning">수정</button><button class="btn btn-primary">삭제</button>
                </div>
            </div>
            <div class="qna_1">
                <div class="question">
                    <h5>공간명 :[카페]그리다움</h5><br>
                    <p>Q. 이용가능한 시간대가 궁금해요</p><Br><br>
                    <span>2020.10.22</span>
                </div><hr>
                <div class="answer">
                    <h5>호스트 답글</h5>
                    <textarea rows="3"class="form-control" >A. 09:00~18:00입니다.</textarea>
                    <span>2020.10.22</span>
                    <button class="btn btn-warning">수정</button><button class="btn btn-primary">삭제</button>
                </div>
            </div>
            <div class="qna_1">
                <div class="question">
                    <h5>공간명 :[카페]그리다움</h5><br>
                    <p>Q. 이용가능한 시간대가 궁금해요</p><Br><br>
                    <span>2020.10.22</span>
                </div><hr>
                <div class="answer">
                    <h5>호스트 답글</h5>
                    <textarea rows="3"class="form-control" value=""></textarea>
                    <span></span>
                    <button class="btn btn-warning">등록</button><button class="btn btn-primary">삭제</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>