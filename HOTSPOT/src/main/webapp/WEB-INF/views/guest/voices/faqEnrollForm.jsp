<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
	#askWrap{
	    width: 100%;
	    height: auto;
	    margin: auto;
	    margin-top: 40px;
	}
	#askWrap div,form{
	    margin: auto;
	}
	#askBigTitle{
	    text-align: center;
	    width: 1200px;
	    height: auto;
	}
	#askTitle{
	    font-weight: bold;
	    font-size: 30px;
	}
	/*질문기입란*/
	#askNote{
	    width: 1200px;
	    height: 1000px;
	}
	#smallTitle{
	    width: 100%;
	    height: 150px;
	    margin: 2% 0;
	}
	#askContent{
	    width: 100%;
	    height: 80%;
	}
	#EnrollForm{
	    width: 100%; 
	    height: 80%; 
	}
	/*기타 css*/
	.purple{
	    background-color: rebeccapurple;
	    color: white;
	    border: white;
	}
	.tinyTitle{
	    font-weight: bold;
	    font-size: 20px;
	}
	.forMiddle{
	    text-align: center;
	    margin-top: 3%;
	}
	.inquiryBtn{
	    width: 100px;
        height: 30px;
        background:  rgb(145, 37, 247);
        color:white;
        border: none;
        border-radius: 3px
	}
</style>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="askWrap">
        <div id="askBigTitle">
            <p id="askTitle">1:1 문의하기</p>
            <p>1:1채팅봇으로 해결하지 못한 사항들만 문의해주세요.
                <br>답변은 평균적으로 1~2일 정도 소요됩니다.
            </p>
            <br><hr><br>
        </div>
        <form action="insertInquiry.mg" method="POST" id="askNote">
        	<input type="hidden" name="inquiryWriter" value="${ loginUser.userId }">
            <div id="smallTitle">
                <p class="tinyTitle">문의제목</p>
                <input type="text" name="inquiryTitle" class="form-control" placeholder="제목을 입력해주세요" required>
            </div>
            <div id="askContent">
                <p class="tinyTitle">문의내용</p>
                <div id="EnrollForm">
                    <textarea id="summernote" name="inquiryContent" required></textarea><br><br>
                    <div class="forMiddle">
                        <button class="inquiryBtn" class="btn purple forMiddle" type="submit">문의하기</button>
                        <button class="inquiryBtn" class="btn btn-secondary forMiddle" onclick="location.href='faq.guest'"> 취소하기 </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(function(){
            $('#summernote').summernote({
            placeholder: '내용을 입력하세요',
            tabsize: 2,
            height:600,
            focus: true
            });
        });
    </script>

    <!--푸터-->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>