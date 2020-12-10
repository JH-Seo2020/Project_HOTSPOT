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
<link rel="stylesheet" href="resources/css/host/spaceEnrollForm.css" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 공간 위치 관련 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4f5f0ac7f344a48852ec52b433f6556&libraries=services"></script>
</head>
<body>

<script>
// form 1 > 2 이동
function openClose(){	        
  $("#spaceForm2").css({"display":"block"});
  $("#spaceForm").css({"display":"none"});
}  
$(function(){
	var isEmpty = function(value){
		if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" &&
				!Object.keys(value).length 	) )
		{ return true 
		} else{ 
		 return false 
		} 
	};
            
        $("#backBtn2").click(function(){
        	 $("#spaceForm2").css({"display":"none"});
        	 $("#spaceForm").css({"display":"block"});
        	
        })
  	
        <!--상세이미지 넣지 않았을 경우 오류 생기지 않도록 조건 처리-->
        $("#subBtn").click(function(){
        	if(isEmpty($("#spc_img").val())){
        		alert('대표이미지를 첨부해주세요!')
        		return false;
        	}
        	if(isEmpty($("#spc_imgs1").val())){
        		alert('상세이미지를 첨부해주세요!')
        		return false;
        	}
        	
         	for(var i=1; i<5; i++){
         		if($("#spc_imgs"+i).val() === null || $("#spc_imgs"+i).val() === '' ){
         			$(".many_images"+i).empty();
         		}
         	}
         <!-- 공백 제거 및 마지막 콤마제거 -->
   		   var tag = $("#tagBox").text().trim();
           var realTag = tag.slice(0,-1);
   		   $("#real_spcTag").val(realTag);
         });
        
		<!-- 글자 수 제한 -->
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
        <form id="spaceInsertForm"action="insertSpace.ho" method="post"enctype="multipart/form-data">
            <h5><span class="importh">공간등록</span>을 원하시나요?</h5>
                <hr>
            <span class="comment1"><p style="color:red">*</p> 필수 입력사항</span>
            <p onclick="validate();"></p>

            <div id="spaceForm" style="display:block";>
                <div id="form_1"class="spaceForm">
                    <table class="form_1_table">
                        <tr class="title">
                            <th>공간명 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" id="spcName" class="form-control" name="spcName" placeholder="공간명을 입력해주세요!">
                            </td>
                        </tr>
                        <tr class="introduce">
                            <th>공간 한 줄 소개 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" class="form-control" id="spcInt" name="spcInt" placeholder="공간을 한 줄로 소개해주세요 !">
                                <p><span id="intCount">0</span>/20</p>
                            </td>
                        </tr>
                        <tr class="introduce">
                            <th>공간 소개 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <textarea rows="8"class="form-control"name="spcLong" id="introduceSpc"></textarea>
                                <p><span id="count">0</span>/200</p>
                            </td>
                            
                        </tr>
                        <tr class="tag">
                            <th>공간 태그 <p style="color:red">*</p></th>
                            <td>
                                <input type="text" class="form-control"id="notTag" value="#" placeholder="태그를 입력해주세요">
                            </td>
                            <td><button type="button" id="tagAddBtn"class="btn btn-primary">추가 </button></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2">
                                <div id="tagBox"style="margin-left:10px;"class="form-control">
                                </div>
                                <input type="hidden" class="form-control"name="spcTag" id="real_spcTag"placeholder="">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="form_2">
                    <table class="form_2_table">
                        <tr class="title">
                            <th>공간 카테고리 <p style="color:red">*</p></th>
                            <td colspan="2">
                                <input type="text" required id="spcCategory"name="spcType" placeholder="카테고리를 선택해주세요" class="form-control"list="category">
                                <datalist id="category">
                                    <option value="파티룸">파티룸</option>
                                    <option value="회의실">회의실</option>
                                    <option value="카페">카페</option>
                                    <option value="촬영스튜디오">촬영스튜디오</option>
                                    <option value="공연장/연습실">공연장/연습실</option>
                                    <option value="루프탑">루프탑</option>
                                    <option value="한옥">한옥</option>
                                </datalist>
                            </td>
                        </tr>
                        <tr class="tag">
                            <th>공간 위치 <p style="color:red">*</p></th>
                            <td class="location">
                                <input type="text" class="form-control" disabled name="location_search" placeholder="위치를 검색해주세요">
                            </td>
                            <td><button type="button" class="btn btn-primary" onclick="sample5_execDaumPostcode()" style="height: 35px; width:100px; margin-left:20px; margin-bottom:10px;font-size: 14px;"> 위치검색 </button></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2">
	                            <input type="hidden" name="latitude" id="latitude">
	                            <input type="hidden" name="longitude" id="longitude">
	                            <input type="hidden" name="userId" value="${loginUser.userId }" >
                                <input type="text" class="form-control"name="location" id="sample5_address"placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                               <div id="map" style="width:290px;height:130px;display:none"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>수용인원 <p style="color:red">*</p></th>
                            <td class="minNmax" >
                                <p> 최소인원 </p><input type="number" class="form-control" value="1"id="spcMin" name="spcMin" placeholder="">
                            </td>
                            <td class="minNmax">
                                <p> 최대인원 </p><input type="number" class="form-control" id="spcMax" name="spcMax" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <th>기본가격 <p style="color:red">*</p></th>
                            <td>
                                <input type="text" class="form-control"name="spcPrice"id="spacePrice"placeholder="">
                            </td>
                            <td style="margin: 0px;">
                                <input type="text" class="form-control"disabled id="unit"value="원/시간">
                            </td>
                        </tr>
                        <tr>
                            <th>영업시간 <p style="color:red">*</p></th>
                            <td class="spaceTime" >
                                <p style="margin-left:15px; color:var(--color-purple)">open</p><input type="time" name="spcHours" value="09:00">
                            </td>
                            <td class="spaceTime">
                                <p style="margin-left:15px;color:var(--color-purple)">closed</p><input type="time"  name="spcHours" value="18:00">
                            </td>
                        </tr>
                    </table>
                    <div class="spaceBtn" style="margin-top: 80px; margin-left: 100px;">
                        <button type="button" id="backBtn"class="btn btn-secondary">돌아가기</button>
                        <button type="button" onclick="return validate();"id="nextBtn"class="btn btn-primary" >다음으로</button>
                    </div>
                </div> 
                
            </div> 
            <div id="spaceForm2">
          
                 <div class="holiday" style="margin-top:15px";>
                    <p style="margin-right: 85px;">휴무일</p>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox1" name="spcHoliday" value="월">
                            <label class="form-check-label" for="Checkbox1">월</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox2" name="spcHoliday"value="화">
                            <label class="form-check-label" for="Checkbox2">화</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox3"name="spcHoliday" value="수">
                            <label class="form-check-label" for="Checkbox3">수</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox4"name="spcHoliday" value="목">
                            <label class="form-check-label" for="Checkbox4">목</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox5" name="spcHoliday"value="금">
                            <label class="form-check-label" for="Checkbox5">금</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox6" name="spcHoliday"value="토">
                            <label class="form-check-label" for="Checkbox6">토</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="Checkbox7" name="spcHoliday"value="일">
                            <label class="form-check-label" for="Checkbox7">일</label>
                        </div>
                    </div> 
                    <div class="notes" style="margin-top: 35px;">
                        <p style="margin-right: 15px;">이용시 유의사항<br><span style="color:red; font-size:15px;"> (최대 5개 )</span></p>
                        <input style="margin-left:50px;"type="text" id="note_0" class="form-control"> 
                        <button type="button" id="notePlus"class="btn btn-primary">추가</button>
                        <div class="many_notes">
                        </div>
                    </div>
                    <!-- 공간 위치 관련  스크립트-->
					<script>
					    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					        mapOption = {
					            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					            level: 5 // 지도의 확대 레벨
					        };
					    //지도를 미리 생성
					    var map = new daum.maps.Map(mapContainer, mapOption);
					    //주소-좌표 변환 객체를 생성
					    var geocoder = new daum.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new daum.maps.Marker({
					        position: new daum.maps.LatLng(37.537187, 127.005476),
					        map: map
					    });
					    function sample5_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                var addr = data.address; // 최종 주소 변수
					                // 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("sample5_address").value = addr;
					                // 주소로 상세 정보를 검색
					                geocoder.addressSearch(data.address, function(results, status) {
					                    // 정상적으로 검색이 완료됐으면
					                    if (status === daum.maps.services.Status.OK) {
					                        var result = results[0]; //첫번째 결과의 값을 활용
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 좌표(위도,경도) 저장해두기 
					                        var latitude = result.y;
					                        var longitude = result.x;
					                        // 숨겨진 input value에 해당 위치 좌표 넣어주기
					                        $('#latitude').val(latitude);
					                        $('#longitude').val(longitude);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
					                        
					                       
					                    }
					                });
					            }
					        }).open();
					    }
					</script>
  
                    <script>
                	<!--이용유의사항 & 공간태그 관련 스크립트-->
                    $(function(){
                    	var count = 0;
                        $(this).on("click","#notePlus",function(){
                        	if($(".content").length < 5){
                        		
	                            var $note = $("#note_0").val();
	                            var html = '<div class="content"> <input type="text" class="form-control" name="noteList['
	                            	html += count
	                            	html += '].notesContent" value="'
	                                html += $note
	                                html +='">'
	                                html += '<img type="button" src="resources/images/host_images/close.png" class="noteClose"></div>'
	                                $(".many_notes").append(html);
	                                $("#note_0").val('');
	                                count++;
	                               
                        	}else{
                        		 alert('유의사항은  5개 까지만 등록 가능합니다!')
                        	}
                        	
                        });
                        $(this).on("click",".noteClose",function(){
                            var tar =$(this).parent();
                            tar.remove();
                        });

                      });
                    
	                    $("#tagAddBtn").click(function(){
	                    	if($(".span").length < 5){ // 태그 5개이상 추가금지	
		                        var tagVal = $("#notTag").val();
		                        var html =  '<span class="span">'
		                            html +=   tagVal
		                            html += ','
		                            html +=   '</span>'
		                            $('#tagBox').append(html);
		                            $("#notTag").val('#')
	                   		 }else{
	                   			 alert('공간태그는 5개 까지만 가능합니다!')
	                   		 }
	                    });
                  
                    </script>
                   
       
                    
                    <div class="convenience" style="margin-top:45px; margin-bottom:50px";>
                        <p style="margin-right: 65px;">편의사항</p>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="spcConvn"value="냉난방">
                                <label class="form-check-label" for="inlineCheckbox1">냉난방</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="spcConvn"value="tv">
                                <label class="form-check-label" for="inlineCheckbox2">tv</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="spcConvn"value="창고">
                                <label class="form-check-label" for="inlineCheckbox3">창고</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="spcConvn"value="컴퓨터">
                                <label class="form-check-label" for="inlineCheckbox4">컴퓨터</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5" name="spcConvn" value="카페">
                                <label class="form-check-label" for="inlineCheckbox5">카페</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"name="spcConvn" value="복사">
                                <label class="form-check-label" for="inlineCheckbox6">복사</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox7" name="spcConvn" value="다과">
                                <label class="form-check-label" for="inlineCheckbox7">다과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox8"name="spcConvn" value="와이파이">
                                <label class="form-check-label" for="inlineCheckbox8">와이파이</label>
                            </div>
                        </div> 
                        <p >대표 이미지<span style="color:red">*</span></p>
                        <div class="imgbox">
                        	<img id="img"/>
                        </div>
                        <label for="spc_img">파일첨부</label>
                        <input type="file" name="upfile" id="spc_img" ></input><br>
                        <!-- 공간 이미지 관련 스크립트  -->
                         <script>
                            var sel_file;
                            var sel_files =[];
                            $(function(){
                                $("#spc_img").on("change",handleImg)
                                $("#spc_imgs1").on("change",handleImg1)
                                $("#spc_imgs2").on("change",handleImg2)
          						$("#spc_imgs3").on("change",handleImg3)
          						$("#spc_imgs4").on("change",handleImg4)
          						$(".cancelImg").click(function(){
                        	     $(this).next().removeAttr("src");
            
                        	   });
                
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
                            function handleImg1(e){
                                var files = e.target.files
                                var filesArr = Array.prototype.slice.call(files);
                                filesArr.forEach(function(f){
                                    sel_file=f;
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                       
                                        $("#imgs").attr("src",e.target.result);
                                    }
                                reader.readAsDataURL(f);
                                });
                            };
                            function handleImg2(e){
                                var files = e.target.files
                                var filesArr = Array.prototype.slice.call(files);
                                filesArr.forEach(function(f){
                                    sel_file=f;
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                       
                                        $("#imgs1").attr("src",e.target.result);
                                    }
                                reader.readAsDataURL(f);
                                });
                            };
                            function handleImg3(e){
                                var files = e.target.files
                                var filesArr = Array.prototype.slice.call(files);
                                filesArr.forEach(function(f){
                                    sel_file=f;
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                       
                                        $("#imgs2").attr("src",e.target.result);
                                    }
                                reader.readAsDataURL(f);
                                });
                            };
                            function handleImg4(e){
                                var files = e.target.files
                                var filesArr = Array.prototype.slice.call(files);
                                filesArr.forEach(function(f){
                                    sel_file=f;
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                       
                                        $("#imgs3").attr("src",e.target.result);
                                    }
                                reader.readAsDataURL(f);
                                });
                            };
                          
                         
                        </script>
                        <p>상세 이미지<span style="color:red">* (최대 4개 )</span></p>
                        <div class="many_imgbox">
                        	<div class="many_images1" style="widhth:180px; height:200px;">
	                            <div class="imgbox">
	                           		 <img class="cancelImg"src="resources/images/host_images/close.png" style="width:20px; height:20px; margin-left: 150px;margin-top:5px;">
	                                <img id="imgs">
	                         	</div>
	                             <label for="spc_imgs1"id="imgsLabel">파일첨부</label>
	                     	     <input type="file" name="upfiles"id="spc_imgs1"></input><br> 
                     	    </div> 
                     	    <div class="many_images2"style="widhth:180px; height:200px;">
	                             <div class="imgbox1">
	                           		 <img class="cancelImg"src="resources/images/host_images/close.png" style="width:20px; height:20px; margin-left: 150px;margin-top:5px;">
	                                <img id="imgs1">
	                            </div>
	                             <label for="spc_imgs2"id="imgsLabel">파일첨부</label>
	                     	     <input type="file" name="upfiles" id="spc_imgs2"></input><br> 
                     	    </div> 
                     	    <div class="many_images3"style="widhth:180px; height:200px;">
	                     	      <div class="imgbox2">
	                           		 <img class="cancelImg"src="resources/images/host_images/close.png" style="width:20px; height:20px; margin-left: 150px;margin-top:5px;">
	                                <img id="imgs2">
	                            </div>
	                             <label for="spc_imgs3"id="imgsLabel">파일첨부</label>
	                     	     <input type="file" name="upfiles" id="spc_imgs3"></input><br>                       	     
                     	     </div> 
                     	     <div class="many_images4" style="widhth:180px; height:200px;"> 
	                      		  <div class="imgbox3">
	                           		 <img class="cancelImg"src="resources/images/host_images/close.png" style="width:20px; height:20px; margin-left: 150px;margin-top:5px;">
	                                <img id="imgs3">
	                            </div>
	                             <label for="spc_imgs4"id="imgsLabel">파일첨부</label>
	                     	     <input type="file" name="upfiles" id="spc_imgs4"></input><br>                       	     
                     	     </div>
                        </div>
                      	
						<button type="button" id="backBtn2" class="btn btn-secondary"> 돌아가기 </button>
                        <button type="button" id="subBtn" onclick="validateCheck()" class="btn btn-primary"data-toggle="modal"data-target="#exampleModal"> 등록하기 </button>
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
<script>
// 입력데이터들 유효성검사 
// 유효한 값 입력 후 form2 로 넘어감
function validate(){
		// 요소가 비어있는지 확인 
		var isEmpty = function(value){
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length 
					) ){ return true 
			}else{ return false 
			} 
		};

		var name = $("#spcName").val();
    	var spcInt = $("#spcInt").val();
    	var spcLong = $("#introduceSpc").val();
    	var tagBox = $(".span").val();
    	var spcType = $("#spcCategory").val();
    	var nameCheck =/^[가-힣!@#$%^&* ]{2,20}$/;
    	var longCheck = /^[가-힣!@#$%^&* ]{2,200}$/;
    	
    	if(isEmpty(name)){
    		alert('공간명을 입력해주세요!');
    		$("#spcName").focus();
    		return false;
    	}else{
    		if(!nameCheck.test(name)){
    			alert('공간명은 1~20자 사이의 한글로 입력해주세요!');
    			$("#spcName").focus();
    			return false;
    		}
    		if(isEmpty(spcInt)){
    			alert('공간을 소개해주세요!');
    			 $("#spcInt").focus();
    			 return false;
    		}else{
    			if(!nameCheck.test(spcInt)){
    				alert('공간소개는 2~20자 사이의 한글로 입력해주세요!');
    				 $("#spcInt").focus();
        			 return false;
    			}
    			if(isEmpty(spcLong)){
	   				alert('공간소개를 입력해주세요!');
	   				$("#introduceSpc").focus();
	       			 return false;
    			}
    			if(!longCheck.test(spcLong)){
    				alert('공간소개는 2~200자 사이의 한글로 입력해주세요!');
    				$("#introduceSpc").focus();
	       			 return false;
    			}
    			if($(".span").length == 0){
    				alert('공간 태그를 입력해주세요!')
    				$("#notTag").focus();
    				 return false;
    			}
    			if(isEmpty($("#spcCategory").val())){
    				alert('카테고리를 선택해주세요!');
    				$("#spcCategory").focus();
    				return false;
    			}
	    		if(isEmpty($("#sample5_address").val())){
	    			alert("위치를 입력해 주세요 !")
	    			return false;
	    		}
	    		if(isEmpty($("#spcMax").val())){
	    			alert("최대인원을 입력해주세요 !")
	    			$("#spcMax").focus();
	    			return false;
	    		}
    			if(isEmpty($("#spacePrice").val())){
    				alert("시간당 가격(원)을 입력해주세요!");
    				$("#spacePrice").focus();
    				return false;
    			}
    		}
    	}
    
    	return openClose();
	
	}

</script>
</html> 