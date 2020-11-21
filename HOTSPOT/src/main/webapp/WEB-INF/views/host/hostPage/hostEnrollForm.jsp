<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/hostMenubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/host/hostEnrollForm.css" type="text/css"/>
<style>
.modal-dialog {
     
        text-align: left;
        vertical-align: center;
}


</style>
</head>
<body>


<div id="hostInsertContainer">
        <h5><span class="importh">호스트등록</span>을 원하시나요?</h5>
        <hr>
        <div id="container1">
            <span class="comment1">* 사업자인 경우에만 호스트등록이 가능합니다<br>
                  * 사업자등록증은 필수제출 항목입니다.<br>
                  * 공간등록은 관리자가 등록신청 검수 및 승인 후 이용이 가능합니다.
            </span>
            <form action="" id="hostInsertForm" method="POST"enctype="multipart/form-data">
                <table class="hostInsertTable" >
                    <tr>
                        <th colspan="2"> 사업자번호 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="-제외하고 입력해주세요" id="bNo"class="form-control"required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 상호명 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="상호명을 입력해주세요" id="bName" class="form-control" required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업자등록증 <p style="color:red">*</p></th>
                        <td colspan="2" ><input type="text" placeholder="jpg, png, pdf, jpeg 파일 업로드해주세요" class="form-control" id="uploadLicense" ></td>
                        <td><label for="license">첨부파일 추가</label></td>
                        <td><input type="file" id="license" placeholder="" onchange="upload()"class="upload-hidden"required></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업장소재지 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="사업장소재지를 입력해주세요" id="bLoc"  class="form-control"required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 계좌정보 <p style="color:red">*</p></th>
                        <td>
                            <input type="text" name="account" class="form-control"placeholder="은행명" list="account"required>
                            <datalist id="account">
                                <option >국민은행</option>
                                <option >신한은행</option>
                                <option >기업은행</option>
                                <option >농협은행</option>
                                <option >카카오뱅크</option>
                            </datalist>
                        </td>
                        <td><input type="text" id="accountNo"class="form-control" id="accountNo" placeholder="- 제외한 계좌번호 입력해주세요" required></td>
                        <td><input type="text" id="accountName"class="form-control" id="accountName" placeholder="예금주명"required></td>   
                    </tr>
                </table>
                <div class="hostInfoBtn">
                    <button type="button" id="backBtn"class="btn btn-secondary" onClick="location.href='hostMain.ho'">돌아가기</button>
                    <button type="button" id="subBtn" onclick="return validate()" data-toggle="modal"data-target="#exampleModal"  class="btn btn-primary"> 등록 신청하기</button>
                </div>
               	
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
					        등록하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" type="submit"class="btn btn-primary">등록하기</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>   
					<!-- 모달끝 -->             
            </form>
        </div>
       <br><br><br>
    </div>
    <script>
	    function upload(){
	        var fileValue = $("#license").val().split("\\");
	        var fileName = fileValue[fileValue.length-1];
	        $("#uploadLicense").attr('placeholder', fileName )
	    }
	    function validate(){
            // 변수에 값 담기
            var bNo = $("#bNo").val();
            var bName = $("#bName").val();
            var accountNo = $("#accountNo").val();
            
            // 유효성 검사
            var bNoCheck =  /^\d{10}/;
            var accountNoCheck = /^\d/;
            if(!bNoCheck.test(bNo)){
                alert('사업자번호를 정확하게 입력해주세요');
                $("#bNo").val('');
                $("#bNo").focus(); 
                return false; 
            }
            if(!accountNoCheck.test(accountNo)){
                alert('숫자만 입력 가능합니다!');
                $("#accountNo").val('');
                $("#accountNo").focus(); 
                return false; 
            }
        }
    </script>   
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>