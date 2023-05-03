<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Scheduler Community</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/main.css">
    
</head>

<body>
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>

    <div id="container">
      <div class="join-box">
        <div id="loginBoxTitle">회원가입</div>
        <div class="form-group">
            <label>이름</label>
             <input type="text" name="username" placeholder="이름 입력" class="form-control" style="text-transform:uppercase; ime-mode:disabled" required autofocus>
        </div>
        <div class="form-group">
            <label>아이디</label>
            <input type="text" name="userId" placeholder="아이디 입력" class="form-control2" value="" autocomplete="off" required>  
            <input type="button" class="check" value="중복확인">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password" placeholder="비밀번호 입력" class="form-control" value="" autocomplete="off" required>  
        </div>
        <div class="form-group">
            <label>비밀번호 재입력</label>
            <input type="password" name="password" placeholder="비밀번호 재입력" class="form-control" value="" autocomplete="off" required>   
        </div>
        <div class="form-group">
            <label>전화번호</label>
            <input type="text" name="phone" placeholder="전화번호 입력" class="form-control" value="" autocomplete="off" required> 
        </div>
        <div class="form-group">
            <label>이메일</label>
            <input type="text" name="email" placeholder="이메일 입력" class="form-control" value="" autocomplete="off" required>
        </div>
        
        <input type="button" id="login-btn-box" value="회원가입" >
        <div class="ot-btn">
        	<div class="ot-btn-in">
	           <span><a href="./login">로그인</a></span>
	       	</div>
	       	<div class="ot-btn-in">
	           <span><a href="./findID">아이디 찾기</a></span>
	       	</div>
	       	<div class="ot-btn-in">
	           <span><a href="./findPW">비밀번호 찾기</a></span>
	       	</div>
        </div>
      </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>

</body>
</html>