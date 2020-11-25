<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                <form action="" method="get" id="selectQnaListForm">
                	
                    <input type="text" name="spcNo" list="space" class="searchSpace"placeholder="공간을 선택해주세요">
                  		
	                    <datalist id="space">
	                      <c:forEach var="sp" items="${ space }">
	                        <option class="hiddenSpcNo" value="${sp.spcNo}" label="${sp.spcName}"></option>
	                       </c:forEach>
	                    </datalist>
                    <input type="image" img src="resources/images/host_images/search.png" onclick="searchSubmit();" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                    <ul class="answerBox">
                  		<li>답변 유무<img src="resources/images/host_images/down.png" class="answerBtn"style="width:12px;heigt:6px;margin-left:10px;"></li>
	               		<ul class="answer_whether">	
	               			<li style="margin-top:6px;" onClick="complete()">답변 완료</li>
	               			<li style="margin-top:0.2px;"onClick="incomplete">답변 미완료</li>
	               		</ul>
              		</ul>
                </form>
                
            </div>
         </div>
        <div class="qnaSpace" style="background-color:rgb(247, 246, 248); margin-top: 20px;">
    
           <c:choose>
	           <c:when test="${list != null}">
	            <c:forEach var="li" items="${list}" varStatus="status">
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
	                    <c:choose>
		                    <c:when test="${  li.qaAnswer != null}">
		                    	<div class="1">
			                    <textarea rows="3"class="form-control" >${ li.qaAnswer }</textarea>
			                    <span>${  li.qaAnswerDate}</span>
			                    <button class="btn btn-warning" onclick="updateAnswer(${li.qaNo})">수정</button><button class="btn btn-primary">삭제</button>
			                    </div>
			                </c:when>
			                <c:otherwise>
			              	  <div class="2">
			               	    <textarea rows="3"class="form-control" name="contentBox" placeholder="답변을 입력해주세요" ></textarea>
			                    <button class="btn btn-warning" onclick="insertAnswer(${li.qaNo})">등록</button>
			                  </div>
			                 </c:otherwise>
		                 </c:choose>
	                </div>
	            </div>
	        </c:forEach>
	        </c:when>
	        <c:otherwise>
	      		  <div><h5>Q&A가 존재하지 않습니다.</h5></div>
	        </c:otherwise>
        </c:choose>
        </div>
    </div>

    <!-- 페이징 처리  -->
        <div id="pagingArea">
          <ul class="pagination" style="margin-top:100px;margin-left:700px;">
          	<c:choose>
          		<c:when test="${ pi.currentPage eq 1 }">
               	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
               </c:when>
               <c:otherwise>
               	<li class="page-item"><a class="page-link" href="selectQnaList.ho?currentPage=${ pi.currentPage-1 }">Previous</a></li>
               </c:otherwise>
              </c:choose>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item"><a class="page-link" href="selectQnaList.ho?currentPage=${ p }">${ p }</a></li>
              </c:forEach>
              
              <c:choose>
              	<c:when test="${ pi.currentPage eq pi.maxPage }">
               	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
               </c:when>
               <c:otherwise>
               	<li class="page-item"><a class="page-link" href="selectQnaList.ho??currentPage=${ pi.currentPage+1 }">Next</a></li>
               </c:otherwise>
              </c:choose>
              
          </ul>
      </div>
    <script>
    	$(function(){
    		$(".answer_whether").hide();
    		$(".answerBtn").click(function(){
        		$(".answer_whether").toggle();
        	});
    		
    	});
    	
    	function insertAnswer(qaNo){
    		
    		var contentBox = $(event.target).prev().val();
    	
    		if(contentBox != null){
    			// 답글 등록 ajax 
    			$.ajax({
    				url:"insertQnaAnswer.ho",
    				data:{ qaNo:qaNo,
    					   qaAnswer:contentBox
    				},
    				success:function(result){	
    					if(result == 'success'){
    						alert('답글작성이 성공했습니다.')
    						location.reload();
    						
    					}else{
    						alert("답글작성을 실패했습니다.");
    					}
    				}
    			});
    		}	
    	};

    	function updateAnswer(qaNo){
    		
    		var contentBox = $(event.target).siblings("textarea").val();
    		console.log(contentBox)
    		if(contentBox != null){
    			// 답글 수정 ajax 
    			$.ajax({
    				url:"insertQnaAnswer.ho",
    				data:{ qaNo:qaNo,
    					   qaAnswer:contentBox
    				},
    				success:function(result){	
    					if(result == 'success'){
    						alert('답글수정이 성공했습니다.')
    						location.reload();
    						
    					}else{
    						alert("답글작성을 실패했습니다.");
    					}
    				}
    			});
    		}	
    	};
    	function complete(spcNo){
    		
    	}
    	function searchSubmit(){
    		$('#selectQnaListForm').attr("action","selectQnaList.ho").submit();
    	};
    	
    	
    </script>
</body>
</html>