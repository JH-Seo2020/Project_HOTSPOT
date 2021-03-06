<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menubar.jsp"%>
	<!-- CSS -->
	<link href="resources/css/common/spaceSearchresultList.css" rel="stylesheet" type="text/css">
	<!-- 검색필터 -->
	<div style="background: lavender; height:30px; margin-top: 40px;"></div>
	<div style="background: lavender;">
		<form action="search.hotspot" id="SearchConditionForm" method="GET">
	    <div id="searchFilter">
	        <span>'${ searchWord }'(으)로 검색한 결과입니다.</span>
	        <input type="hidden" id="searchWord" name="searchWord" value="${ searchWord }">
	        <table id="table_select">
	            <thead>
	                <tr>
	                    <th width="150px">공간유형</th>
	                    <th width="150px">지역</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>
	                        <select name="spcType" id="spcType" class="custom-select custom-select-sm mb-3">
	                            <option selected value="">모든공간</option>
	                            <option value="파티룸">파티룸</option>
	                            <option value="회의실">회의실</option>
	                            <option value="촬영스튜디오">촬영스튜디오</option>
	                            <option value="카페">카페</option>
	                            <option value="공연장/연습실">공연장/연습실</option>
	                            <option value="루프탑">루프탑</option>
	                            <option value="한옥">한옥</option>
	                        </select>
	                    </td>
	                    <td>
	                        <select name="location" id="location" class="custom-select custom-select-sm mb-3">
	                            <option selected value="">모든지역</option>
	                            <option value="서울">서울</option>
	                            <option value="인천">인천</option>
	                            <option value="부산">부산</option>
	                            <option value="대구">대구</option>
	                            <option value="대전">대전</option>
	                            <option value="광주">광주</option>
	                            <option value="울산">울산</option>
	                            <option value="경기">경기</option>
	                            <option value="강원">강원</option>
	                            <option value="충북">충북</option>
	                            <option value="충남">충남</option>
	                            <option value="전북">전북</option>
	                            <option value="전남">전남</option>
	                            <option value="경북">경북</option>
	                            <option value="경남">경남</option>
	                            <option value="제주">제주</option>
	                        </select>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	        <table id="table_check">
	            <thead>
	                <tr>
	                    <th colspan="5" height="40px">편의사항</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>
	                        <input id="ref" type="checkbox" name="spcConvn" value="다과">
	                        <label class="input_spcConvn" for="ref">다과</label>
	                    </td>
	                    <td>
	                        <input id="computer" type="checkbox" name="spcConvn" value="냉난방">
	                        <label class="input_spcConvn" for="computer">냉난방</label>
	                    </td>
	                    <td>
	                        <input id="wifi" type="checkbox" name="spcConvn" value="와이파이">
	                        <label class="input_spcConvn" for="wifi">와이파이</label>
	                    </td>
	                    <td>
	                        <input id="copy" type="checkbox" name="spcConvn" value="복사">
	                        <label class="input_spcConvn" for="copy">복사</label>
	                    </td>
	                    <td>
	                        <input id="cafe" type="checkbox" name="spcConvn" value="카페">
	                        <label class="input_spcConvn" for="cafe">카페</label>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</div>
	<div style="background: lavender; height:30px;"></div>
    <!-- 검색결과 목록 -->
    <table style="width: 1200px; margin: auto;">
        <tr>
            <td>
                <select id="select_order" name="order" class="custom-select custom-select-sm mb-3">
                    <option value="newEnroll" selected>최신등록순</option>
                    <option value="oldEnroll">과거등록순</option>
                    <option value="highPrice">높은가격순</option>
                    <option value="rowPrice">낮은가격순</option>
                </select>
            </td>
        </tr>
    </table>
    </form>
    <div id="searchresultList">
     	<c:choose>
    		<c:when test="${ empty list  }">
    			검색결과가 없습니다.
    		</c:when>
    		<c:otherwise>
	    		<c:forEach var="list" items="${ list }">
			    	<div class="list" onclick="detail(${list.spcNo})">
			            <img class="spcImage" src="${ list.spcChimg }">
			            <div class="spcName">${ list.spcName }</div>
			            <div class="spcLocationTag">${ fn:substring(list.location, 0, 2) } / ${ fn:replace(list.spcTag, ',', ' ') }</div>
			            <div class="spcPriceHours">
			            	<fmt:formatNumber value="${ list.spcPrice }" type="number"/>원<br>
			            	운영시간 : ${ fn:replace(list.spcHours, ',', ' ~ ') }
			            </div>
			            <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">${ list.reviewCount }</div>
			            <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">${ list.wishCount }</div>
			        </div>
	    		</c:forEach>
    		</c:otherwise>
    	</c:choose>
    </div>
    
    <div style="width:1200px; margin:auto;">
    	<ul class="pagination pagination-lg">
			<c:choose>
				<c:when test="${ pageInfo.currentPage eq 1 }">
					<li class="page-item disabled"><a class="page-link">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="search.hotspot?searchWord=${ searchWord }&spcType=${ spcType }&location=${ location }&spcConvn=${ spcConvn }&order=${ order }&currentPage=${ pageInfo.currentPage - 1 }">이전</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
				<li class="page-item">
					<a class="page-link" href="search.hotspot?searchWord=${ searchWord }&spcType=${ spcType }&location=${ location }&spcConvn=${ spcConvn }&order=${ order }&currentPage=${ page }">${ page }</a>
				</li>
			</c:forEach>
			
			<c:choose>
				<c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
					<li class="page-item disabled"><a class="page-link">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="search.hotspot?searchWord=${ searchWord }&spcType=${ spcType }&location=${ location }&spcConvn=${ spcConvn }&order=${ order }&currentPage=${ pageInfo.currentPage + 1 }">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
    </div>
    
    <%@ include file="footer.jsp"%>
    
    <script>
    	$(function(){
    		if('${spcType}' != ''){
    			$("#spcType").val('${spcType}');
    		}
    		if('${location}' != ''){
    			$("#location").val('${location}');
    		}
    		if('${order}' != ''){
    			$("#select_order").val('${order}');
    		}
    		
    		
    		if("${checkbox0}" != null){
    			$("input[value='${checkbox0}']").attr("checked", true);
    		}
    		if("${checkbox1}" != null){
    			$("input[value='${checkbox1}']").attr("checked", true);
    		}
    		if("${checkbox2}" != null){
    			$("input[value='${checkbox2}']").attr("checked", true);
    		}
    		if("${checkbox3}" != null){
    			$("input[value='${checkbox3}']").attr("checked", true);
    		}
    		if("${checkbox4}" != null){
    			$("input[value='${checkbox4}']").attr("checked", true);
    		}

    		$("#spcType").change(function(){
    			$("#SearchConditionForm").submit();
    		})
    		$("#location").change(function(){
    			$("#SearchConditionForm").submit();	
    		});
    		
    		$("input[name=spcConvn]").click(function(){
    			$("#SearchConditionForm").submit();	
    		});
    		$("#select_order").change(function(){
    			$("#SearchConditionForm").submit();	
    		});

    	});
    	
    	// 상세화면이동
        function detail(spcNo){
    		console.log("눌림");
        	location.href="spaceDetail.guest?spcNo=" + spcNo;
        }
    	
    </script>
    
</body>
</html>