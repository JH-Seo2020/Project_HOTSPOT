<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </style>
</head>
<body>
	
  	 <div align="center" style="background:#704de4; height:50px; color:white; font-size:20px; line-height:2.3;">
        1:1 문의상담
    </div>
        
        <div align="center" style="background:#eef0f3; height:500px; overflow:scroll;" id="chatBox"> 
            <div style="margin-top:10px;">2020-11-15</div>
            <hr>
            <div class="chatContent" >
                <ul align="left">    
                    <li><div class="balloon_03">안녕하세요 핫스팟입니다. 무엇을 도와드릴까요?</div></li>
                    <li><div class="balloon_03">문의사항을 선택해주세요.</div></li>
                    
                    <li>
                        <div class="balloon_03">
                            
                            <div style="border:1px solid lightgray; cursor:pointer;" onclick="chatList(1, $(this).text());" >1. 게스트</div>
                            
                            <div style="border:1px solid lightgray; cursor:pointer;" >2. 호스트</div>
                        </div>
                    </li>                                  
                </ul>
                
            </div>  
            
    </div>
    <script>
        $(function(){
            var sel = $(".balloon_03>div");
           
            for(var i =0; i<= sel.length -1; i++){
                if(i==0){
                    sel.eq(0).click(function(){
                        $(".chatContent>ul").append("<li align='right'><div style='text-align:left;' class='balloon_04'>"+ sel.eq(0).text() +"</div></li>")
                    })
                }else if(i==1){
                    sel.eq(1).click(function(){
                        $(".chatContent>ul").append("<li align='right'><div style='text-align:left;' class='balloon_04'>"+ sel.eq(1).text() +"</div></li>")
                    })
                }
            }
            
        })
        function chatList(num, str){
            
            $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
        }
    </script>
</body>
</html>