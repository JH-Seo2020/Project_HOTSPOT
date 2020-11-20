<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css외부 파일 연결 -->
<link rel="stylesheet" href="resources/css/hostmenubar.css" type="text/css"/>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <style>
        #LocationAgreements, #PrivateAgreements, #Agreements{
            width: 375px;
            
        }
        input[type=checkbox]{
            width: 25px;
            height: 25px;
            box-shadow: 1px 1px 5px gray;
            border-radius: 19px;
            margin-top: 8px;
            
        }
        input[type=checkbox]label{
            font-size: 20px;
            font-weight: bolder;
            margin: auto;
        }
        #noticebar{
            position: relative;
        }
        mark{
            background-color: black;
            color: white;
        }
        
    </style>
<body>
    <!--메뉴바-->
    <jsp:include page="menubar.jsp"/>

    <div id="EnrollUserAgreements" align="center">
        <form method="POST" action="">
            <div align="left" id="noticebar">
                <img src="resources/images/logo_letter_1.png" width="100px" height="25px" >
                <label style="color: yellowgreen; font-size: large ;">회원가입을 환영합니다</label><hr>
            </div>
            <div style="background-color: bisque; text-align: center;" id="checkAllBox" align="left" >
                <input type="checkbox" name= "" value="">&nbsp;<label>HOSTOP 이용약관, 개인정보 수집 및, 이용, 위치정보 이용약관에 모두 동의합니다.</label>
            </div>

            <br>
            <div id="Agreements" align="left">
                <input type="checkbox" name="" value="">&nbsp;<label>HOTSPOT 이용약관 동의 <mark style="background-color: black; color: white;">(필수)</mark></label> 
                <br>
                <textarea cols="50" rows="10" style="resize: none;" readonly>
여러분을 환영합니다.
HOTSPOT 서비스 (이하 ‘서비스’)를 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 서비스를 제공하는 HOTSPOT 사이트 와 이를 이용하는 HOTSPOT  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.HOTSPOT 서비스를 이용하시거나 HOTSPOT 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</textarea>
            </div>
            <br>
            <br>
            <div id="PrivateAgreements" align="left">
                <input type="checkbox" name="" value="">&nbsp;<label>HOTSPOT 개인정보 이용 약관 동의<mark style="background-color: black; color: white;">(필수)</mark></label>
                <br>
                <textarea cols="50" rows="10" style="resize: none;" readonly>
개인정보보호법에 따라 HOTSPOT에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                    
회원가입 시점에 HOTSPOT가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
                </textarea>
            </div>
            <br>
            <br>
            <div id="LocationAgreements" align="left">
                <input type="checkbox" name="" value="">&nbsp;<label> HOTSPOT위치정보 이용 약관 동의<mark style="background-color: black; color: white;">(필수)</mark></label>
                <br>
                <textarea cols="50" rows="10" readonly style="resize: none; overflow:scroll;">
위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 HOTSPOT 위치기반 서비스를 이용할 수 있습니다.


                    제 1 조 (목적)
이 약관은 HOTSPOT 사이트 (이하 “사이트”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
                    
                    제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 사이트가 별도로 정한 지침 등에 의합니다.
                    
                    제 3 조 (서비스 내용 및 요금)
①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
②제1항 위치기반서비스의 이용요금은 무료입니다.            
                </textarea>

            </div>
            <br>
            <br>
            <div>
                <a class="btn btn-default" style="width: 120px; margin-right: 30px;" href="enrollForm.cancle" >취소</a>
                

                
                <a class="btn btn-primary" style="width: 120px; margin-left: 30px;" href="enrollForm.me">확인</a>
            </div>

            <script>
                $("#checkAllBox input[type=checkbox]").click(function(){
                    if($("#checkAllBox input[type=checkbox]").prop("checked")){
                        $("input[type=checkbox]").prop("checked", true);
                    }else{
                        $("input[type=checkbox]").prop("checked",false);
                    }
                });
                
                function finalCheck(){
                    if($("input[type=checkbox]").is(":checked")==false){
                        alert("선택사항들을 체크해주세요.");
                        $(".btn btn-primary").prop("disabled",true);
                    }else{
                        $(".btn btn-primary").prop("disabled",false);
                    }
                
                }



            </script>    

        </form>

    </div>

   
    


	<br><br><br><br><br><br><br>
    <!--푸터바-->
    <jsp:include page="footer.jsp"/>

</body>
</html>