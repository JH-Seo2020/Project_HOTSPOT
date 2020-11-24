<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
        <br>
            <div style="font-size:20px; margin-left:20px;">FAQ</div>
            <hr style="background:ligthgrey;">
            <br><br>
        <div class="adminNotice" style="width:1000px; margin:auto;">
            <form action="update.fad">
                <select name="faqType" id="type">
                    <option value="이용후기 및 작성">이용후기 및 작성</option>
                    <option value="예약 및 결제">예약 및 결제</option>
                    <option value="취소 및 환불">취소 및 환불</option>
                    <option value="기타">기타</option>
                </select>
                <script>
                	$(function(){
                		$("#type option[value=${f.faqType}]").attr("selected", true);
                	})
                </script>
                
                <input type="text" name="faqTitle" style="width: 100%; margin-bottom:20px;"
                placeholder="제목입력" class="form-control" value="${f.faqTitle }" required> 
                <input type="hidden" name="faqWriter" value="${ loginUser.userId }">
                <input type="hidden" name="faqNo" value="${ f.faqNo }">
                <textarea  id="summernote" name="faqContent" required>${f.faqContent }</textarea>
                <br>
                <button type="reset" class="btn btn-secondary" style="margin-left:380px;">취소하기</button>
                <button type="submit" class="btn btn-primary" style="margin-left:50px;">수정하기</button>
            </form>
        </div>
            <script>
            $(function(){
                $('#summernote').summernote({
                        tabsize : 2,
                        maxHeight : 500,
                        minHeight: 500
                    });

            }) 
        </script>
    </div>
</body>
</html>