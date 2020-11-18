<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/menubar.jsp"/>   
    
    
    <div id="noticeWrap">
        <div id="noticeTitle">
            <p>자주 묻는 질문</p>
        </div>
        <form id="noticeSearch">
            <div class="input-group mb-3">
                <span style="font-size: 20px;">검색 </span>&nbsp;&nbsp;
                <select class="custom-select" id="inputGroupSelect01">
                    <option selected>전체</option>
                    <option value="이용후기 및 작성">이용후기 및 작성</option>
                    <option value="예약 및 결제">예약 및 결제</option>
                    <option value="취소 및 환불">취소 및 환불</option>
                    <option value="기타">기타</option>
                </select>
                <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                  <button type="submit" class="input-group-text purple" id="basic-addon2">검색</button>
                </div>
            </div>
        </form>
        <div id="noticeSpace">
            <table class="table table-hover" id="faq">
                <thead>
                  <tr>
                    <th scope="col" class="type">분류</th>
                    <th scope="col">자주묻는질문</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                    <tr onclick="fnAnswer(0);" class="off">
                        <th scope="row">
                            <a class="black">기타</a>
                        </th>
                        <td>핫스팟 이용에 문의가 있어요 </td>
                        <td class="imgTd"><img src="down-arrow.png" class="downImg"></td>
                    </tr>
                    <tr class="answers">
                        <td></td>
                        <td>여기에다 적어야된다</td>
                        <td></td>
                    </tr>
                    <tr onclick="fnAnswer(1);" class="off">
                        <th scope="row">
                            <a href="" class="black">이용후기 및 작성</a>
                        </th>
                        <td>이용 후기는 어떻게 작성할 수 있나요?</td>
                        <td class="imgTd"><img src="down-arrow.png" class="downImg"></td>
                    </tr>
                    <tr class="answers">
                        <td></td>
                        <td>여기에다 적어야된다</td>
                        <td></td>
                    </tr>
                    <tr onclick="fnAnswer(2);" class="off">
                        <th scope="row">
                            <a href="" class="black">예약 및 결제 </a>
                        </th>
                        <td>예약을 취소하고 싶어요.</td>
                        <td class="imgTd"><img src="down-arrow.png" class="downImg"></td>
                    </tr>
                    <tr class="answers">
                        <td></td>
                        <td>여기에다 적어야된다</td>
                        <td></td>
                    </tr>
                    <tr onclick="fnAnswer(3);" class="off">
                        <th scope="row">
                            <a href="" class="black">예약 및 결제 </a>
                        </th>
                        <td>현금영수증을 발급받을 수 있나요?</td>
                        <td class="imgTd"><img src="down-arrow.png" class="downImg"></td>
                    </tr>
                    <tr class="answers">
                        <td></td>
                        <td>여기에다 적어야된다</td>
                        <td></td>
                    </tr>                  
                    <tr onclick="fnAnswer(4);" class="off">
                        <th scope="row">
                            <a href="" class="black">취소 및 환불</a>
                        </th>
                        <td>카드 영수증은 어떻게 받나요?</td>
                        <td class="imgTd"><img src="down-arrow.png" class="downImg"></td>
                    </tr>
                    <tr class="answers">
                        <td></td>
                        <td>여기에다 적어야된다</td>
                        <td></td>
                    </tr>
                </tbody>
              </table>
        </div>
        <div id="ask">
            <button class="forRight btn purple" type="button">챗봇으로 물어보기</button> 
        </div>
        <div id="pagination">
            <button class="badge badge-pill badge-warning">이전</button>
            <button class="badge badge-pill badge-warning">1</button>
            <button class="badge badge-pill badge-warning">2</button>
        </div>
    </div>

    <script>
        $(function(){
            $(".answers").click(function(){
                $("#faq .answers").hide(100);   //괄호안의 숫자는 duration-시간-
                $("#fqa tr[class=on]").attr("class","off");
            })
        });
        //질문클릭시 구동되는 함수 
        function fnAnswer(no){
            no = no+1;  //몇번째 tr을 내려줄 것인지 파악하기 위해서 매개변수로 no가 필요함!!
            $(".answers").slideUp(100);
            $("#faq .on").attr("class","off").css("color","black").css("font-weight","400");
            $("#faq tr:eq("+(no*2)+")").slideDown(100);
            $("#faq tr:eq("+(no*2-1)+")").attr("class","on").css("color","rebeccapurple").css("font-weight","800");
        }
    </script>

    <!--푸터-->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>