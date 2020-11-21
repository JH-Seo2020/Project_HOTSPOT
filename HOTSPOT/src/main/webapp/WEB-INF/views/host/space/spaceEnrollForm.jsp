<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/hostMenubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/spaceEnrollForm.css" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<script>
    $(function(){
    	
        $("#nextBtn").click(function(){
            $("#spaceForm2").css({"display":"block"});
            $("#spaceForm").css({"display":"none"});
        })
           

        $("#spcInt").keyup(function(){
            var inputLength = $(this).val().length;

            $("#intCount").html(inputLength);

            if(20-inputLength < 0){ 
                $("#intCount").css("color","red");
            }else{
                $("#intCount").css("color","black");
            }

        });
        $("#introduceSpc").keyup(function(){
            var inputLength = $(this).val().length;

            $("#count").html(inputLength);

            if(200-inputLength < 0){ 
                $("#count").css("color","red");
            }else{
                $("#count").css("color","black");
            }

        });
});

    </script>
    <div id="spaceInsertContainer">
        <form id="spaceInsertForm"action="" method="post">
            <h5><span class="importh">공간등록</span>을 원하시나요?</h5>
                <hr>
            <span class="comment1"><p style="color:red">*</p> 필수 입력사항</span>

            <div id="spaceForm" style="display:block";>
                <div id="form_1"class="spaceForm">
                    <table class="form_1_table">
                        <tr class="title">
                            <th>공간명 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" class="form-control" name="" placeholder="공간명을 입력해주세요!">
                            </td>
                        </tr>
                        <tr class="introduce">
                            <th>공간 한 줄 소개 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" class="form-control" id="spcInt" name="" placeholder="공간을 한 줄로 소개해주세요 !">
                                <p><span id="intCount">0</span>/20</p>
                            </td>
                        </tr>
                        <tr class="introduce">
                            <th>공간 소개 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <textarea rows="6"class="form-control" id="introduceSpc"></textarea>
                                <p><span id="count">0</span>/200</p>
                            </td>
                            
                        </tr>
                        <tr class="tag">
                            <th>공간 태그 <p style="color:red">*</p></th>
                            <td>
                                <input type="text" class="form-control"name="tag" placeholder="">
                            </td>
                            <td><button type="button" class="btn btn-primary" style="height: 30px; width:80px; font-size: 14px; margin-top:8px; line-height: 10px;">추가 </button></td>
                        </tr>
                        <tr>
                            <th></p></th>
                            <td colspan="2">
                                <input type="text" class="form-control"name="spcTag" id="real_spcTag"placeholder="">
                            </td>

                        </tr>
                    </table>
                </div>
                <div id="form_2">
                    <table class="form_2_table">
                        <tr class="title">
                            <th>공간 카테고리 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" name="category" placeholder="카테고리를 선택해주세요" class="form-control"list="category">
                                <datalist id="category">
                                    <option >스터디룸</option>
                                    <option >파티룸</option>
                                    <option >회의실</option>
                                </datalist>
                            </td>
                        </tr>
                        <tr class="tag">
                            <th>공간 위치 <p style="color:red">*</p></th>
                            <td class="location">
                                <input type="text" class="form-control"name="location_search" placeholder="">
                            </td>
                            <td><button type="button" class="btn btn-primary" style="height: 30px; width:100px; margin-left:10px;font-size: 14px;"> 찾기 </button></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2">
                                <input type="text" class="form-control"name="mapLocation" id="real_spcTag"placeholder="">
                            </td>
                        </tr>
                       
                        <tr>
                            <th>수용인원 <p style="color:red">*</p></th>
                            <td class="minNmax" >
                                <p> 최소인원 </p><input type="number" class="form-control" name="spcMin" placeholder="">
                            </td>
                            <td class="minNmax">
                                <p> 최대인원 </p><input type="number" class="form-control" name="" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <th>기본가격 <p style="color:red">*</p></th>
                            <td>
                                <input type="text" class="form-control"name=""id="spacePrice"placeholder="">
                            </td>
                            <td style="margin: 0px;">
                                <input type="text" class="form-control"name=""disabled id="unit"value="원/시간">
                            </td>
                        </tr>
                        <tr>
                            <th>영업시간 <p style="color:red">*</p></th>
                            <td class="spaceTime" >
                                <input type="time" name="timeIn">
                            </td>
                            <td class="spaceTime">
                                <input type="time"  name="timeIn">
                            </td>
                        </tr>
                    </table>
                    <div class="spaceBtn" style="margin-top: 80px; margin-left: 100px;">
                        <button type="button" id="backBtn"class="btn btn-secondary">돌아가기</button>
                        <button type="button" id="nextBtn"class="btn btn-primary" >다음으로</button>
                    </div>
                </div> 
                
            </div> 
            <div id="spaceForm2">
          
                 <div class="holiday" style="margin-top:15px";>
                    <p style="margin-right: 85px;">휴무일</p>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="월">
                            <label class="form-check-label" for="inlineCheckbox1">월</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="화">
                            <label class="form-check-label" for="inlineCheckbox2">화</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="수">
                            <label class="form-check-label" for="inlineCheckbox2">수</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="목">
                            <label class="form-check-label" for="inlineCheckbox2">목</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="금">
                            <label class="form-check-label" for="inlineCheckbox2">금</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="토">
                            <label class="form-check-label" for="inlineCheckbox2">토</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="일">
                            <label class="form-check-label" for="inlineCheckbox2">일</label>
                        </div>
                    </div> 
                    <div class="notes" style="margin-top: 35px;">
                        <p style="margin-right: 15px;">이용시 유의사항</p>
                        <input type="text" id="note_0" class="form-control"> 
                        <button type="button" id="notePlus"class="btn btn-primary">추가</button>
                        <div class="many_notes">
                        </div>
                    </div>
                    
                    <script>
                
                    $(function(){
                        $(this).on("click","#notePlus",function(){
                            var $note = $("#note_0").val();
                            var html = '<div class="content"> <input type="text" class="form-control" name="noteContent" value="'
                                html += $note
                                html +='">'
                                html += '<img type="button" src="resources/images/host_images/close.png" class="noteClose"></div>'
                                $(".many_notes").append(html);
                                $("#note_0").val('');
                        });
                        $(this).on("click",".noteClose",function(){
                            var tar =$(this).parent();
                            tar.remove();
                           
                        });

                      });
                  
                    </script>
                   
       
                    
                    <div class="convenience" style="margin-top:35px; margin-bottom:40px";>
                        <p style="margin-right: 65px;">편의사항</p>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox1" value="option1">
                                <label class="form-check-label" for="inlineCheckbox1">냉난방</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox2" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">tv</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox3" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">창고</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox4" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">컴퓨터</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox5" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">카페</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox6" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">복사</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox7" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">다과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="Checkbox8" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">와이파이</label>
                            </div>
                        </div> 
                        <p >대표 이미지<span style="color:red">*</span></p>
                        <div class="imgbox">
                        	<img id="img"/>
                        </div>
                        <label for="spc_img">파일첨부</label>
                        <input type="file"  id="spc_img" ></input><br>
                         <script>
                            var sel_file;
                            var sel_files =[];
                            $(function(){
                                $("#spc_img").on("change",handleImg)
                              //  $("#spc_imgs").on("change",handleImgs)
                            });
                            function handleImg(e){
                                var files = e.target.files
                                var filesArr = Array.prototype.slice.call(files);
                                filesArr.forEach(function(f){
                                    sel_file=f;
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                       
                                        $("#img").attr("src",e.target.result);
                                    }
                                reader.readAsDataURL(f);
                                });
                            };
                        
                           
                        </script>
                        <p>상세 이미지<span style="color:red">*</span></p>
                        <div class="many_imgbox">
                            <div class="imgbox">
                                <img src="resources/images/host_images/close.png" style="width:20px; height:20px; margin-left: 150px";>
                            </div>
                        </div>
                        <label for="spc_imgs">파일첨부</label>
                        <input type="file" id="spc_imgs"></input><br>

                        <button type="button" id="subBtn" class="btn btn-primary"data-toggle="modal"data-target="#exampleModal"> 등록하기 </button>
            </div>
            <!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
					        등록하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">등록하기</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>   
					<!-- 모달끝 -->      	
          
        </form>
    </div>
    
   <!--  <jsp:include page="../../common/footer.jsp"/>  -->
 </body>

</html> 