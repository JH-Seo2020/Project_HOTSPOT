<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="resources/css/common/spaceSearchresultList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="menubar.jsp"%>
	
	<!-- 검색필터 -->
    <div id="searchFilter">
        <span>'[검색어]'(으)로 검색한 결과입니다.</span>
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
                        <select name="spcType" class="custom-select custom-select-sm mb-3">
                            <option selected disabled>모든공간</option>
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
                        <select name="spcArea" class="custom-select custom-select-sm mb-3">
                            <option selected disabled>모든지역</option>
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
                        <input id="TV" type="checkbox" name="spcConvn" value="TV">
                        <label class="input_spcConvn" for="TV">TV</label>
                    </td>
                    <td>
                        <input id="computer" type="checkbox" name="spcConvn" value="컴퓨터">
                        <label class="input_spcConvn" for="computer">컴퓨터</label>
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
                        <input id="cafe" type="checkbox" name="spcConvn" value="컴퓨터">
                        <label class="input_spcConvn" for="cafe">카페</label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 검색결과 목록 -->
    <div id="searchresultList">
        <table>
            <thead>
                <tr>
                    <td colspan="3">
                        <select name="array" class="custom-select custom-select-sm mb-3">
                            <option value="newEnroll">최신등록순</option>
                            <option value="oldEnroll">과거등록순</option>
                            <option value="highPrice">높은가격순</option>
                            <option value="rowPrice">낮은가격순</option>
                        </select>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>
                    </td>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>
                    </td>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>
                    </td>
                </tr>
                <tr>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>
                    </td>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>
                    </td>
                    <td width="400px">
                        <div class="spcImage">이미지</div>
                        <div class="spcName">뜰향기카페</div>
                        <div class="spcLocationTag">서울 | #태그명</div>
                        <div class="spcPriceHours">가격/시간</div>
                        <div class="spcReview"><img id="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">3</div>
                        <div class="spcWish"><img id="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">3</div>s
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>