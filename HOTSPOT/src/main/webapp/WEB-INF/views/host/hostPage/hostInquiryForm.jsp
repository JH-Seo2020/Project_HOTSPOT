<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/hostMenubar.jsp"/>
<jsp:include page="../common/subMenubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>

	.outerForm{
   width:1000px;
   margin:auto;
   margin-top: 100px; 
   margin-bottom:200px; 
  }
  .outerForm span{
      color: rgb(80, 79, 79);
      font-weight: lighter;
  }
 .inquiry_head{
     text-align: center;
 }
  .inquiry_content{
      margin-left: 150px;
      /* text-align: center; */
      margin-top: 40px;
  }  
  .inquiry_content input{
      margin-right: 130px;
      margin-bottom: 20px;
  }
  .inquiry_content h5{
      margin-right: 110px;
      margin-bottom: 20px;
  }
  input[type=button]{
      margin-top: 10px;
  }
</style>
</head>
<body>

<div class="outerForm">
        <div class="inquiry_head">
            <h4>1:1 문의 하기</h4><br>
            <span>1:1 챗봇으로 해결하지 못한 사항들만 문의해주세요<br>
                답변은 평균적으로 1~2일 소요됩니다.<br><br><hr>
            </span>
        </div>
        <div class="inquiry_content">
            <form action="" id="insertForm" method="post">
                <input type="hidden" name="userId" value="">
                <h5>문의제목</h5>
                <input type="text" name="" class="form-control"style="width: 710px;" placeholder="제목"/>
                <h5>문의내용</h5>
                <textarea id="summernote" name="content"></textarea>
                <input id="subBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkModal" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>

                  <!-- Modal -->
                    <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                        
                                        <p>등록하시겠습니까?</p>

                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                        <button type="submit" class="btn btn-primary">등록</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>
   	<script>
   	$(function(){
   		$('#summernote').summernote({
   		   placeholder: '내용을 입력해주세요.',
              tabsize: 2,
              width:710,
              height: 300
   		});
   	});
   	
   	</script>
   	
   	<jsp:include page="../../common/footer.jsp"/>
    	
</body>
</html>