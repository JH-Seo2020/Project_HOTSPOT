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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <style>
        .wrap{
            position:absolute;
        }
        .sidebar{
            width:220px;
            height:1000px;
            background:#2c3e50;
        }
        .sidebar li{list-style:none;}
        .sidebar a,.sidebar div{
            font-size:18px;
            color:white;
            text-decoration:none;
            cursor:pointer;
        }
        .sidebar a:hover{
            color:lightgrey;
        }
        .sidebar div:hover{
            color:lightgrey;
        }
        .sidebar img{
            width:40px;
            height:40px;
            
            }
        .outer{
            margin-left:220px;
            
           
        }
    </style>
</head>
<body>
	<div class="wrap">
        <div class="sidebar">
            
            <br>
            <a href="" style="margin-left:35px; font-size:20px;" ><img src="resources/images/admin/로고.png" style="width:40px; height:40px;">관리자페이지</a>
            <hr style="background:lightgrey; width:200px;">
            <br>
            <ul>
                <li>
                    <a href=""> <img src="resources/images/admin/회원관리.png">&nbsp;회원관리</a>
                </li>
                <br><br>
                <li>
                    <a href=""><img src="resources/images/admin/신고.png">&nbsp;신고관리</a>
                </li>
                <br><br>
                <li>
                    <a href=""><img src="resources/images/admin/후기.png">&nbsp;후기관리</a>
                </li>
                <br><br>
                <li>
                    <div href="" id="adminSpace"><img src="resources/images/admin/공간.png">&nbsp;공간</div>
                    <ul style="display:none;" id="subAdminSpace">
                        <li><a href="" style="font-size:15px;">공간관리</a></li>
                        <li><a href="" style="font-size:15px;">예약관리</a></li>
                    </ul>
                </li>
                <br><br>
                <li>
                    <div href="" id="adminCenter"><img src="resources/images/admin/고객센터.png">&nbsp;고객센터 관리</div>
                    <ul style="display:none;" id="subAdminCenter">
                        <li><a href="list.no" style="font-size:15px;">공지사항</a></li>
                        <li><a href="" style="font-size:15px;">예약관리</a></li>
                        <li><a href="" style="font-size:15px;">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
        <script>
            $(function(){
                    $("#adminSpace").click(function(){
                        
                        $("#subAdminSpace").fadeToggle(500);
                    })
                    $("#adminCenter").click(function(){
                        $("#subAdminCenter").fadeToggle(500);
                    })
                         
            })
        </script>
</body>
</html>