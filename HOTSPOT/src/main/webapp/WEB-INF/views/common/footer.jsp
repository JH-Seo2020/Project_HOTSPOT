<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #footerWrap{
            width: 100%;
            height: 350px;
            background-color: lightgray;
        }
        #footerContent{
            margin: auto;
            width: 1200px;
            height: 70%;
        }
        #footerContent>div{float: left;}
        #footerLogo{
            width: 20%;
            height: 90%;
        }
        #footerInfo{
            width: 70%;
            height: 100%;
            padding-top: 5%;
            font-size: 15px;
            color:gray;
        }
        #footerNotice{
            margin: auto;
            width: 1200px;
            height: 60px;
            color:gray;
        }
</style>
</head>
<body>

    <div id="footerWrap">
        <div id="footerContent">
            <div id="footerLogo"><img src="resources/images/hotspot_logo.png" width="100%" height="100%"></div>
            <div id="footerInfo">
                상호명 : 핫스팟 &nbsp;&nbsp;|&nbsp;&nbsp;
                대표명 : 역삼역 3번출구<br>
                사업자등록번호 : 202012091520 &nbsp;&nbsp;|&nbsp;&nbsp;
                영업 소재지 : 역삼역 3번출구<br>
                이메일 : yeok3@gmail.com<br>
                전화번호 : 02-1253-8253(평일 오후 6시까지, 공휴일은 쉼)<br>
                <br>
                <c:if test="${ loginUser.userType eq 'admin' }">
                	<button class="badge badge-pill badge-warning" onclick="location.href='main.ad'">관리자페이지로 이동</button>	
                </c:if>               
            </div>
        </div>
        <div id="footerNotice">
            **공간에 대한 문의 사항은 호스트에게 직접 해주세요.<br>
            **핫스팟은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 
            따라서 핫스팟은 공간 거래정보 및 거래에 대해 책임지지 않습니다.<br>
            Copyright yeoksamyeok-3beon-chulgu Corp. All Rights Reserved
        </div>
    </div>
	
</body>
</html>