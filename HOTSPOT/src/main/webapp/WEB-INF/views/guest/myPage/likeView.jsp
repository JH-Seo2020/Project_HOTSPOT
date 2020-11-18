<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#likeWrap{
	    width: 100%;
	    height: auto;
	    margin: auto;
	    border: 1px solid skyblue;
	    background-color: lavender;
	}
	#likeWrap div{margin: auto;}
	#likeTitle{
	    text-align: center;
	    font-weight: bold;
	    font-size: 30px;
	}
	/*찜한공간*/
	#likeSpace{
	    width: 100%;
	    height: auto;
	    background-color: lavender;
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
	#pagination>button{
	    border: none;
	    background-color: rebeccapurple;
	    color: white;
	}
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

    <div id="likeWrap">
        <div id="likeTitle">
            <p>내가 찜한 공간</p>
        </div>
        <div id="likeSpace">
            <div id="todaySpaceGroup">
                <div class="todaySpace">
                    <img src="space1.jpg">
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
                    <img src="space1.jpg">
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
                    <img src="space1.jpg">
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
                    <img src="space1.jpg">
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
        <div id="pagination">
            <button class="badge badge-pill badge-warning">이전</button>
            <button class="badge badge-pill badge-warning">1</button>
            <button class="badge badge-pill badge-warning">2</button>
        </div>
    </div>

    <!--푸터-->
   <jsp:include page="../../common/footer.jsp"/>

</body>
</html>