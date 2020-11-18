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
	    margin-top: 10%;
	}
	.btn-group{
	    width: 60%;
	    height: 45px;
	}
	.inquiry{
	    border: 1px solid rgb(218, 218, 218);
	    background: white;
	    padding: 16px;
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
            <h2 align="center"><b>1:1문의 관리</b></h2>
            <br><br>
            <div class="ManageBtn" data-example-id="simple-button-group"  align="center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);">이용후기</button>
                    <button class="btn btn-default" style="background: rgb(212, 212, 212);">Q & A</button>
                    <button class="btn btn-primary" style="background: rgb(145, 37, 247);">1:1문의</button>
                </div>
            </div>
            <br><br><br>
            <div id="inputInquiry">
                <div class="inquiry">
                    <div class="inquiryInfo">
                        <dl>
                            <dt><b>제목 : 챗봇기능으로 안되서 문의해요</b></dt><br>
                            <dd>
                                <span> 찬미를 듣는다 그것은 웅대한 관현악이며 미묘한 교향악이다 뼈 끝에 스며들어 간다. </span><br>
                                <span class="qnaDate"><small>2020.08.03</small></span>
                                <button type="button" class="inputBtn" onclick="">삭제</button>
                            </dd>
                        </dl>
                    </div><hr>
                    <div class="inquiryReply">
                        <dl>
                            <dt><b>관리자 답변 :</b></dt><br>
                            <dd>
                                <span>만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다.</span><br>
                                <span  class="qnaDate"><small>2020.11.03</small></span>
                            </dd>
                            <dd></dd>
                        </dl>
                    </div>
                </div> 
                <div class="inquiry">
                    <div class="inquiryInfo">
                        <dl>
                            <dt><b>제목 : 챗봇기능으로 안되서 문의해요</b></dt><br>
                            <dd>
                                <span> 찬미를 듣는다 그것은 웅대한 관현악이며 미묘한 교향악이다 뼈 끝에 스며들어 간다. </span><br>
                                <span class="qnaDate"><small>2020.08.03</small></span>
                                <button type="button" class="inputBtn" onclick="">삭제</button>
                            </dd>
                        </dl>
                    </div><hr>
                    <div class="inquiryReply">
                        <dl>
                            <dt><b>관리자 답변 :</b></dt><br>
                            <dd>
                                <span>만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다.</span><br>
                                <span  class="qnaDate"><small>2020.11.03</small></span>
                            </dd>
                            <dd></dd>
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