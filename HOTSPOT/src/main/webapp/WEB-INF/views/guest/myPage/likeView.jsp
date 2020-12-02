<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	#likeWrap div{margin: auto;}
	/*찜한공간*/
	#likeSpace{
	    width: 100%;
	    height: auto;
	}
	#todaySpaceGroup{
	    width: 1200px;
	    height: 90%;
	    padding-top: 6%;
	    text-align: center;
	    margin: auto;
	}
	.todaySpace{
	    display: inline-block;
	    padding: 0 0 4% 4%;
	    width: 30%; 
	    height: 80%;
	}
	.todaySpace>img{
	    width: 100%;
	    height: 100%;
	    border: 5px solid tan;
	}
	/*페이지버튼*/
	#pagination{
	    text-align: center;
	    padding-bottom: 4%;
	}
	/*#pagination-area>button{
	    border: none;
	    background-color: rebeccapurple;
	    color: white;
	}
	*/
	#paging-area li>a{color: rgb(139, 138, 138)}
	/*기타 css*/
	.purple{
	    background-color: rebeccapurple;
	    color: white;
	    border: white;
	}
</style>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="content">
       	<br><br><br>
         <h2 align="center"><b>내가 찜한 공간</b></h2>
        <div id="likeSpace">
            <div id="todaySpaceGroup">
                <div class="todaySpace">
                    <img src="resources/images/space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                        <button class="badge badge-pill purple">👾찜해제</button>
                    </div>
                </div>
                <div class="todaySpace">
                    <img src="resources/images/space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                        <button class="badge badge-pill purple">👾찜해제</button>
                    </div>
                </div>
                <div class="todaySpace">
                    <img src="resources/images/space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                        <button class="badge badge-pill purple">👾찜해제</button>
                    </div>
                </div>
                <div class="todaySpace">
                    <img src="resources/images/space1.jpg">
                    <div style="font-weight: bold; font-size: 20px;">[경복궁역] 한옥카페 '그리다꿈'</div>
                    <div>종로구 | #한옥카페 #그리다꿈</div>
                    <div>
                        <span style="color: rebeccapurple; font-weight: bold;">10,000원/시간</span>
                        <span class="badge badge-pill badge-warning">후기 10개</span>
                        <span class="badge badge-pill badge-warning">관심 7개</span>
                        <button class="badge badge-pill purple">👾찜해제</button>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        
        <div id="paging-area" align="center">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt</a></li>
            </ul>
        </div>
        <br><br><br><br>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>

</body>
</html>