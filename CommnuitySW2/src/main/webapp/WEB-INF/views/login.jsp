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
      <div class="login-box">
        <div id="loginBoxTitle">로그인</div>
        <div class="form-group">
            <label>아이디</label>
            <input type="text" name="userId" id="userId" class="form-control" value="" ime-mode:disabled">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password" id="password" class="form-control" value="" autocomplete="off">
        </div>
        <input type="button" id="login-btn-box" value="로그인" >
        <div class="ot-btn">
        	<div class="ot-btn-in">
	           <span><a href="./join">회원가입</a></span>
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
</body>
</html>