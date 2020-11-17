<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        #adminNotice{
            width:1000px;
        }
        #adminNotice input[type=checkbox]{
            width:15px;
            height:15px;
        }
        #adminFooter form{
            display:inline;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
        <div>
            <br>
            <div style="font-size:20px; margin-left:20px;">FAQ</div>
            <hr style="background:ligthgrey;">
            <br><br>
            
            <table class="table" id="adminNotice" style="text-align:center; margin:auto;">
                <tr>
                    <th><input type="checkbox"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>7</td>
                    <td>이용후기는 어떻게 작성할 수 있나요?</td>
                    <td>이용후기 및 작성</td>
                    <td>2020-11-10</td>
                </tr>
                
            </table>
            <hr style="width:1000px;">
            <div id="adminFooter" style="width:1000px; margin:auto;" >
                <form action="">
                    <select name="" id="" style="height:34px;">
                    <option value="">글번호</option>
                    <option value="">제목</option>
                    </select>
                    <input type="text" style="line-height:29px; width:150px;">
                   <button class="btn btn-primary" style="margin-bottom:4px;">검색</button>
                </form>
                <button style="margin-left:90px;" class="btn btn-secondary"><</button>
                <button class="btn btn-secondary">1</button>
                <button class="btn btn-secondary">2</button>
                <button class="btn btn-secondary">3</button>
                <button class="btn btn-secondary">4</button>
                <button class="btn btn-secondary">5</button>
                <button class="btn btn-secondary">></button>

                <button style="margin-left:180px" class="btn btn-secondary">글작성</button>
                <button class="btn btn-secondary">삭제</button>       
            </div>
        </div>
    </div>
</body>
</html>