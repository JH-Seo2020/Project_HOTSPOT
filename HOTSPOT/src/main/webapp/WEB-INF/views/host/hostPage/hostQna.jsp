<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫스팟 호스트페이지</title>
<link rel="icon" type="image/png" sizes="132x132" href="resources/images/host_images/logoIcon.png" />
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
                  		
	                    <datalist id="space"  >
	                      <c:forEach var="sp" items="${ space }">
	                        <option class="hiddenSpcNo" value="${sp.spcNo}" label="${sp.spcName}"></option>
	                       </c:forEach>
	                    </datalist>
                    <input type="image" img src="resources/images/host_images/search.png" onclick="searchSubmit(1);" class="searchIcon"style="width: 25px;height:25px; border:0px;"></input>
                    <ul class="answerBox">
                  		<li class="whether">답변 유무<img src="resources/images/host_images/down.png" class="answerBtn"style="width:12px;heigt:6px;margin-left:10px;"></li>
	               		<ul class="answer_whether">	
	               			<li style="margin-top:6px;" id="complete" onClick="searchSubmit(2)">답변 완료</li>
	               			<li style="margin-top:0.2px;"onClick="searchSubmit(3)">답변 미완료</li>
	               		</ul>
              		</ul>
                </form>
                
            </div>
         </div>
        <div class="qnaSpace" style="background-color:#f5f5f5; margin-top: 40px; border-radius:10px; padding:4px">
    
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
			                    <button class="btn btn-warning" onclick="updateAnswer(${li.qaNo})">수정</button><button class="btn btn-primary" onclick="deleteAnswer(${li.qaNo})">삭제</button>
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
	      		  <div><h5></h5></div>
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
    		// 클릭 이벤트 발생한 요소 에서부터 원하는 요소 선택해서 값 가져오기
    		var contentBox = $(event.target).siblings("textarea").val();
    		
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
    						alert("답글수정을 실패했습니다.");
    					}
    				}
    			});
    		}	
    	};
    	function deleteAnswer(qaNo){
    	
   			$.ajax({
   				url:"deleteQnaAnswer.ho",
   				data:{ qaNo:qaNo,
   				},
   				success:function(result){	
   					if(result == 'success'){
   						alert('답글 삭제가 완료 되었습니다.')
   						location.reload();
   						
   					}else{
   						alert("답글 삭제가실패했습니다.");
   					}
   				}
   			});
    		
    	};
    	
    	// 정렬, 조회 
    	function searchSubmit(num){
    		if(num == 1){
    			if($(".searchSpace").val() == ''){
    				alert('공간을 선택해주세요 !')
    				return false;
    			}else{
    				$('#selectQnaListForm').attr("action","selectQnaList.ho").submit();
    			}
    		}
    		if(num == 2){
    			if($(".searchSpace").val() == ''){
    				alert('공간을 선택해주세요 !')
    				return false;
    				
    			}else{
    				$('#selectQnaListForm').attr("action","qnaAnswerComplete.ho").submit();
    			}
    			
    		}if(num == 3){
    			
    			if($(".searchSpace").val() == ''){
    				alert('공간을 선택해주세요 !')
    				return false;
    				
    			}else{
    				$('#selectQnaListForm').attr("action","qnaAnswerIncomplete.ho").submit();
    			}
    			
    		}	
    	};
    	
    	
    </script>
</body>
</html>