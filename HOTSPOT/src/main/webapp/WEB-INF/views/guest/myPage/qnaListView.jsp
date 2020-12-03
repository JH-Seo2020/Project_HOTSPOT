<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
	    background: rgb(243, 243, 243);
	    margin-top: 40px;
	}
	.btn-group{
	    width: 60%;
	    height: 45px;
	}
	.qna{
	    border: 1px solid rgb(218, 218, 218);
	    background: white;
	    padding: 17px;
	    padding-inline: 30px;
	    margin: auto;
	    margin-bottom: 15px;
	    width: 60%;
	}
	.updateBtn{
	    width: 70px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px
	}
	#paging-area li>a{color: rgb(139, 138, 138)}
	.inputBtn{
	    float: right;
	    width: 90px;
	    height: 30px;
	    background:  rgb(145, 37, 247);
	    color:white;
	    border: none;
	    border-radius: 3px;
	}
	.qnaDate{color: rgb(177, 177, 177)}
</style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
        <div id="qnaArea">
            <br><br><br>
            <h2 align="center"><b>Q&A 관리</b></h2>
            <br><br>
            <div class="ManageBtn" data-example-id="simple-button-group"  align="center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);" onclick="location.href='myReview.mg'">이용후기</button>
                    <button class="btn btn-primary" style="background: rgb(145, 37, 247);" onclick="location.href='myQna.mg'">Q & A</button>
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);" onclick="location.href='myInquiry.mg'">1:1문의</button>
                </div>
            </div>
            <br><br><br>
            <div id="inputQna">
                <div class="qna">
                    <div class="qnaInfo">
                        <dl>
                            <dt><a href=""><b>공간명 : [카페][경복궁역] 그리다꿈</b></a></dt><br>
                            <dd>
                                <span> Q: 건물에 엘리베이터 있나요?</span><br>
                                <span class="qnaDate"><small>2020.08.03</small></span>
                                <button type="button" class="inputBtn" onclick="">삭제</button>
                            </dd>
                        </dl>
                    </div><hr>
                    <div class="qnaReply">
                        <dl>
                            <dt><b>호스트님의 답글 :</b></dt><br>
                            <dd>
                                <span>A: 안녕하세요. 건물에는 엘레베이터가 없습니다.</span><br>
                                <span  class="qnaDate"><small>2020.11.03</small></span>
                            
                            </dd>
                            <dd></dd>
                        </dl>
                    </div>
                </div> 
                <div class="qna">
                    <div class="qnaInfo">
                        <dl>
                            <dt><a href=""><b>공간명 : [카페][경복궁역] 그리다꿈</b></a></dt><br>
                            <dd>
                                <span> Q: 건물에 엘리베이터 있나요?</span><br>
                                <span class="qnaDate"><small>2020.08.03</small></span>
                                <button type="button" class="inputBtn" onclick="">삭제</button>
                            </dd>
                        </dl>
                    </div><hr>
                    <div class="qnaReply">
                        <dl>
                            <dt><b>호스트님의 답글 :</b></dt><br>
                            <dd>
                                <span>A: 안녕하세요. 건물에는 엘레베이터가 없습니다.</span><br>
                                <span  class="qnaDate"><small>2020.11.03</small></span>
                            
                            </dd>
                        </dl>
                    </div>
                </div> 
            </div>
        </div>
        <br><br>

        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt</a></li>
            </ul>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>