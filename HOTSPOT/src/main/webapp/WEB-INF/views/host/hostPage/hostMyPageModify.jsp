<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/hostMenubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫스팟 호스트페이지</title>
<link rel="icon" type="image/png" sizes="132x132" href="resources/images/host_images/logoIcon.png" />
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

	
	<jsp:include page="../common/subMenubar.jsp"/>

	
	

<div id="hostInsertContainer" style="position: absolute; top:50px; left:50px; margin-left: 300px;">
    <div align="left" id="noticebar" style="margin-left: 300px;">
        <img src="resources/images/logo_letter_1.png">

    </div>
        <hr>
        <div id="container1">
            <span class="comment1">*호스트 정보 수정
            </span>
            <form action="updateHost.ho" id="hostInsertForm" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="userId" value="${ loginUser.userId }"/>
                <table class="hostInsertTable" >
                    <tr>
                        <th colspan="2"> 사업자번호 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="-제외하고 입력해주세요" name="businessNo"id="bNo"class="form-control"required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 상호명 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="상호명을 입력해주세요" id="bName" name="businessName"class="form-control" required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업자등록증 <p style="color:red">*</p></th>
                        <td colspan="2" ><input type="text" placeholder="jpg, png, pdf, jpeg 파일 업로드해주세요" class="form-control" id="uploadLicense" ></td>
                        <td><label for="license">첨부파일 추가</label></td>
                        <td><input type="file" id="license" name="upfile"onchange="upload()"class="upload-hidden"required></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업장소재지 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="사업장소재지를 입력해주세요" name="businessLoc" id="bLoc"  class="form-control"required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 계좌정보 <p style="color:red">*</p></th>
                        <td>
                            <input type="text" name="businessAcc" class="form-control"placeholder="은행명" list="account"required>
                            <datalist id="account">
                                <option >국민은행</option>
                                <option >신한은행</option>
                                <option >기업은행</option>
                                <option >농협은행</option>
                                <option >카카오뱅크</option>
                            </datalist>
                        </td>
                        <td><input type="text"  name="businessAcc" class="form-control" id="accountNo" placeholder="- 제외한 계좌번호 입력해주세요" required></td>
                        <td><input type="text"  name="businessAcc" class="form-control" id="accountName" placeholder="예금주명"required></td>   
                    </tr>
                     <tr>
                        <th colspan="2"> 사업장 연락처 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="사업장연락처를 입력해주세요" name="businessPhone" id="bPhone"class="form-control"required ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 담당자 이메일 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="email" placeholder="담당자 이메일 입력해주세요" name="businessEmail" id="bEmail"class="form-control"required ></td>
                    </tr>
                </table>
                <div class="hostInfoBtn">
                    <button type="button" id="backBtn"class="btn btn-secondary" onClick="location.href='hostMain.ho'">돌아가기</button>
                    <button type="button" id="subBtn" onclick="return validate()" data-toggle="modal"data-target="#exampleModal"  class="btn btn-primary"> 수정하기</button>
                </div>
               	
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
					        수정하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="submit"class="btn btn-primary">수정하기</button>
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
                $("#subBtn").removeAttr('data-target');
                return false; 
            }else{
            	$("#subBtn").attr('data-target','#exampleModal')
            }
            if(!accountNoCheck.test(accountNo)){
                alert('숫자만 입력 가능합니다!');
                $("#accountNo").val('');
                $("#accountNo").focus(); 
                $("#subBtn").removeAttr('data-target');
                return false; 
            }else{
            	$("#subBtn").attr('data-target','#exampleModal')
            }
        }
    </script>   
    
<jsp:include page="../../common/footer.jsp"/>


</body>
</html>