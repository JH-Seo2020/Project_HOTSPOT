<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	 <style>
    .chatContent ul{
        list-style:none;
        font-weight:bold;
    }

    .balloon_03 {
        display:block;
        margin-top:20px;
        width:195px;
        display:inline-block;
        background:white;
        border-radius: 10px;
        position:relative;
        padding-left:4px;
        padding:5px;
        word-break:break-all
    }
    .balloon_03:after {
        border-top:15px solid white;
        border-left: 15px solid transparent;
        border-right: 0px solid transparent;
        border-bottom: 0px solid transparent;
        content:"";
        position:absolute;
        top:5px;
        left:-13px;
        z-index:0
    }
    .balloon_04 {
        position:relative;
        width:180px;
        display:inline-block;
        padding-right:10px;
        margin-top:20px;
        margin-right:25px;
        background:white;
        border-radius: 10px;
        word-break:break-all;
        padding:5px;
    }
    .balloon_04:after {
        border-top:15px solid white;
        border-left: 0px solid transparent;
        border-right: 15px solid transparent;
        border-bottom: 0px solid transparent;
        content:"";
        position:absolute;
        top:5px;
        left:175px;
    }
    html {overflow:hidden;}
    </style>
</head>
<body>
	
  	 <div align="center" style="background:#704de4; height:50px; color:white; font-size:20px; line-height:2.3;">
        1:1 문의상담
    </div>
        <c:set var="current" value="<%= new java.util.Date() %>"/>
        <div align="center" style="background:#eef0f3; height:500px; overflow:scroll;" id="chatBox"> 
            <div style="margin-top:10px; font-weight:bold;" ><fmt:formatDate value="${ current }" type="date" pattern="yyyy-MM-dd HH:mm"/></div>
            <hr>
            <div class="chatContent" >
                <ul align="left">    
                    <li><div class="balloon_03">안녕하세요 핫스팟입니다. 무엇을 도와드릴까요?</div></li>
                    <li><div class="balloon_03">문의사항을 선택해주세요.</div></li>
                    
                    <li>
                        <div class="balloon_03">
                           	<c:forEach var="c" items="${ list }" varStatus="status">
                           	 	<div style="border:1px solid lightgray; cursor:pointer; color: #704de4;" onclick="chatList(${status.index}, $(this).text());" >${ c.chatResponse }</div>
                           </c:forEach>
                        </div>
                    </li>
                    
          
                </ul>
                
            </div>  
            
    </div>
    <script>
		    function winClose()
			    {
			     window.open('','_self').close(); 
			   }
	        function chatList(num, str){           
      	 		var sel = $(".balloon_03>div");         
	   	  		$(".chatContent>ul").append("<li align='right'><div style='text-align:left;' class='balloon_04'>"+ str +"</div></li>")
	           
	   	  		$.ajax({
	   	  			url:"list.cad",
	   	  			data:{
	   	  				message:str
		   	  		},
		   	  		success:function(list){
		   	  			console.log(list);
		   	  			
		   	  			var value="";
		   	  				value += "<li>"+
		   	  							"<div class='balloon_03'>";
  							for(var i  in list){
  								if(list[i].chatStep == 0){
  									value +="<div style='border:1px solid lightgray; color:#704de4; cursor:pointer;' onclick='chatList(" +i +", $(this).text());'>" + list[i].chatResponse+"</div>";
  								}else if(list[i].chatStep <= 2){
	  		 	  					value +="<div style='border:1px solid lightgray; color:#704de4; cursor:pointer;' onclick='chatList(" +i +", $(this).text());'>" + list[i].chatResponse+"</div>";
	   	  							if(i == list.length-1){	   	  								
	   	  								value += "<div style='border:1px solid lightgray; cursor:pointer;' onclick='chatList(" +i +", $(this).text());'>처음으로</div>"+
   	  									    	 "<div style='border:1px solid lightgray; cursor:pointer;' onclick='newWindow()'>1:1문의하기</div>";
		   	  							}	
	  								}else if(list[i].chatStep == 3){
	  									value +="<div style='border:1px solid lightgray; color:#704de4; cursor:pointer;' disabled>" + list[i].chatResponse+"</div>";
	  									if( i == list.length-1){	  										
	  										value +="<div style='border:1px solid lightgray; cursor:pointer;' onclick='chatList(" +i +", $(this).text());'>처음으로</div>"+  
  													"<div style='border:1px solid lightgray; cursor:pointer;' onclick='newWindow()'>1:1문의하기</div>"+
				   	  								"<div style='border:1px solid lightgray; cursor:pointer;' onclick='winClose()'>종료하기</div>";
	  									}
	  								} 								
								}
		   	  					
				        
				        	
		   	  			$(".chatContent>ul").append(value).fadeIn(500);
				        	
	          	  $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
		   	  		},
		   	  		error:function(){
		   	  			
		   	  		}
	   	  		});
	                                            
	        }
     function newWindow(){
    	 window.open("insertInquiryForm.mg");
     }
    </script>
</body>
</html>