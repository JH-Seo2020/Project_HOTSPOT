<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/guest/faqListView.css" type="text/css"/>

</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/menubar.jsp"/>   
    
    
    <div id="noticeWrap">
        <div id="noticeTitle">
            <p>자주 묻는 질문</p>
        </div>
        <form id="noticeSearch" action="searchFaq.guest">
            <div class="input-group mb-3">
                <span style="font-size: 20px;">검색 </span>&nbsp;&nbsp;
                <select class="custom-select" id="inputGroupSelect01" name="questionType">
                    <option selected>전체</option>
                    <option value="이용후기 및 작성">이용후기 및 작성</option>
                    <option value="예약 및 결제">예약 및 결제</option>
                    <option value="취소 및 환불">취소 및 환불</option>
                    <option value="기타">기타</option>
                </select>
                <input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                  <button type="submit" class="input-group-text purple" id="basic-addon2">검색</button>
                </div>
            </div>
        </form>
        <div id="noticeSpace">
            <table class="table table-hover" id="faq">
                <thead>
                  <tr>
                    <th scope="col" class="type">분류</th>
                    <th scope="col">자주묻는질문</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                
                	<c:forEach var="f" items="${list }" varStatus="index">
                	
		                    <tr onclick="fnAnswer(${index.count}-1);" class="off">
		                        <th scope="row">
		                            <a class="black">${f.faqType}</a>
		                        </th>
		                        <td>${f.faqTitle } </td>
		                        <td class="imgTd"><img src="resources/images/down-arrow.png" class="downImg"></td>
		                    </tr>
		                    <tr class="answers">
		                        <td></td>
		                        <td>${f.faqCon }</td>
		                        <td></td>
		                    </tr>
		                    
		        	</c:forEach>
                </tbody>
              </table>
        </div>
        <div id="ask">
            <button class="forRight btn purple" type="button" onclick="chatBot();">챗봇으로 물어보기</button> 
        </div>
        <div id="pagination">

        	<c:choose>
        		<c:when test="${pi.currentPage eq 1 }">
		            <a class="badge badge-pill purple disabled">이전</a>
		        </c:when>
		        <c:otherwise>
		        	<a href="faq.guest?currentPage=${pi.currentPage-1}" class="badge badge-pill purple">이전</a>
		        </c:otherwise>
		    </c:choose>
		    
		    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
		            <a href="faq.guest?currentPage=${p }" class="badge badge-pill purple">${p }</a>
		    </c:forEach>
		            
		    <c:choose>
		    	<c:when test="${pi.currentPage eq pi.maxPage}" >
		    		<a class="badge badge-pill purple disabled">다음</a>
		    	</c:when>
		    	<c:otherwise>
		    		<a href="faq.guest?currentPage=${pi.currentPage +1 }" class="badge badge-pill purple">다음</a>
		    	</c:otherwise>
		    </c:choose>   

        </div>
    </div>

    <script>
    	function chatBot(){
    		window.open("chat.ad","_blank","width=400px, height=552px");
    		
    	}
        $(function(){
            $(".answers").click(function(){
                $("#faq .answers").hide(100);   //괄호안의 숫자는 duration-시간-
                $("#fqa tr[class=on]").attr("class","off");
            })
        });
        //질문클릭시 구동되는 함수 
        function fnAnswer(no){
            no = no+1;  //몇번째 tr을 내려줄 것인지 파악하기 위해서 매개변수로 no가 필요함!!
            $(".answers").slideUp(100);
            $("#faq .on").attr("class","off").css("color","black").css("font-weight","400");
            $("#faq tr:eq("+(no*2)+")").slideDown(100);
            $("#faq tr:eq("+(no*2-1)+")").attr("class","on").css("color","rebeccapurple").css("font-weight","800");
        }
    </script>

    <!--푸터-->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>