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
            <div style="font-size:20px; margin-left:20px; margin-top:11px;">공지사항</div>
            <hr style="background:ligthgrey;">
            <br><br>
        <div class="adminNotice" style="width:1000px; margin:auto;">
            <form action="update.no">
            	<input type="hidden" name="noticeWriter" value="${ n.noticeWriter }">
            	<input type="hidden" name="noticeNo" value="${ n.noticeNo }">
                <input type="text" name="noticeTitle" style="width: 100%; margin-bottom:20px;"
                placeholder="제목입력" class="form-control" value="${ n.noticeTitle } " required>
                <textarea  id="summernote" name="noticeContent" required>${n.noticeContent }</textarea>
                <br>
                <button type="reset" class="btn btn-secondary" style="margin-left:380px;">취소</button>
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