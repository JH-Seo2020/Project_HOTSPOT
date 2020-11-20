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
                        <td colspan="3"><input type="text" placeholder="-제외하고 입력해주세요" class="form-control" ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 상호명 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="상호명을 입력해주세요" class="form-control"  ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업자등록증 <p style="color:red">*</p></th>
                        <td colspan="2" ><input type="text" placeholder="jpg, png, pdf, jpeg 파일 업로드해주세요" class="form-control" id="uploadLicense" ></td>
                        <td><label for="license">사업자등록증 첨부파일</label></td>
                        <td><input type="file" id="license" placeholder="" class="upload-hidden"></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 사업장소재지 <p style="color:red">*</p></th>
                        <td colspan="3"><input type="text" placeholder="사업장소재지를 입력해주세요"  class="form-control" ></td>
                    </tr>
                    <tr>
                        <th colspan="2"> 계좌정보 <p style="color:red">*</p></th>
                        <td>
                            <div class="d-flex">
                                <div class="dropdown mr-1">
                                  <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
                                    은행명
                                  </button>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                    <a class="dropdown-item" href="#">국민은행</a>
                                    <a class="dropdown-item" href="#">신한은행</a>
                                    <a class="dropdown-item" href="#">카카오뱅크</a>
                                    <a class="dropdown-item" href="#">하나은행</a>
                                  </div>
                                </div>
                              </div>
                        </td>
                        <td><input type="text" id="account"class="form-control" placeholder="- 제외한 계좌번호 입력해주세요"></td>
                        <td><input type="text" class="form-control" placeholder="예금주"></td>   
                    </tr>
                </table>
                <div class="hostInfoBtn">
                    <button type="button" id="backBtn"class="btn btn-secondary" onClick="location.href='hostMain.ho'">돌아가기</button>
                    <button type="button" id="subBtn" data-toggle="modal"data-target="#exampleModal" class="btn btn-primary"> 등록 신청하기</button>
                </div>
               
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
					        등록하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">등록하기</button>
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
         
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>