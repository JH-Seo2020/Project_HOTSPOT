<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/spaceEnrollForm.css"
	type="text/css" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
</head>
<style>
label {
	font-weight: bolder;
}

#hostSpaceList {
	width: 100%;
	height: 100%;
}

#hostSpaceGroup {
	width: 1200px;
	height: 90%;
	padding-top: 6%;
	text-align: center;
	margin: auto;
}

.todaySpace {
	display: inline-block;
	padding: 0 0 4% 4%;
	width: 30%;
	height: 80%;
}

.todaySpace>img {
	width: 100%;
	height: 90%;
	border: 5px solid lightgray;
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	-ms-transition: all 1s ease;
	transition: all 1s ease;
	margin-bottom: 5%;
}

.todaySpace>img:hover {
	-webkit-filter: brightness(50%);
	filter: brightness(50%);
	transform: scale(1.03);
}

.img_hotspotLogo {
	width: 15px;
	height: 15px;
	margin-right: 5px;
}

#spaceInsert {
	position: absolute;
	right: 100px;
	width: 200px;
	height: 40px;
}
</style>
<body>

	<jsp:include page="../common/hostMenubar.jsp" />
	<jsp:include page="../common/subMenubar.jsp" />

	<div style="position: absolute; top: 50px; left: 50px">
		<div align="left" id="noticebar" style="margin-left: 300px;">
			<img src="resources/images/logo_letter_1.png"> <label
				style="color: yellowgreen; font-size: large;">내 공간 정보</label>
			<hr>
		</div>

		<div id="hostSpaceList">
			<div id="hostSpaceGroup">

				<c:choose>
					<c:when test="${ !empty spaceList }">


						<c:forEach var="b" items="${spaceList }">


							<c:set var="location" value="${b.location}" />
							<c:set var="location2" value="${fn:substring(location,0,2)}" />

							<div class="todaySpace">
								<img src="${b.spcChimg }" onclick="move(${b.spcNo})">
								<div style="font-weight: bold; font-size: 20px;">[${b.spcName }]</div>
								<div style="color: gray;">${location2}|#${b.spcTag }</div>
								<div>
									<span style="color: rebeccapurple; font-weight: bold;">${b.spcPrice }원/시간</span>
									<span class="badge badge-pill badge-warning"><img
										class="img_hotspotLogo"
										src="resources/images/common/main_reviewIcon.png">후기
										${b.reviews }개</span> <span class="badge badge-pill badge-warning"><img
										class="img_hotspotLogo"
										src="resources/images/common/main_wishIcon.png">관심
										${b.wishes }개</span>
								</div>
								<br>
								<button class="btn btn-primary" id="spaceModify"
									onclick="location.href='spaceModifyForm.ho'">공간 정보 변경</button>

								<button class="btn btn-danger" id="spaceDelete"
									style="margin-left: 30px;" data-toggle="modal"
									data-target="#myModal">공간 정보 삭제</button>
							</div>

							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">주의! 공간 삭제</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<div class="modal-body">정말로 해당 공간을 삭제하시겠습니까?</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal" onclick="deleteSpcae(${b.spcNo})">삭제</button>
										</div>

									</div>
								</div>
							</div>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<span>공간을 등록해주세요!</span>

					</c:otherwise>
				</c:choose>

			</div>
			<script>
    	function move(spcNo){
    		location.href="spaceDetail.guest?spcNo="+spcNo;
    	}
    	$(function(){
    		$(".todaySpace img").hover(function(){
    			$(this).css("cursor","pointer");
    		})
    	});
    	
    	function deleteSpcae(e){   		
    		
			$.ajax({
				url:"delete.space",
				data:{
					spcNo: e
				},
				success:function(data){
					
					alert('해당 공간이 삭제되었습니다!');
					
				},error:function(){
					console.log("ajax통신 실패");
				}
			})
			
    	}
    	
    </script>

			<button class="btn btn-primary" id="spaceInsert"
				onclick="location.href='spaceEnrollForm.ho'">공간 정보 등록</button>
		</div>
	</div>
<body>

</body>
</html>