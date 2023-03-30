<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="./resources/css/main.css" rel="stylesheet">
</head>
<body>
	<nav class="login-head-area">
		<div>
			<a href="./"><font color="white"; size=5;>메인 화면으로 돌아가기</font></a>
		</div>
	</nav>
	  <div class="login-area1">
        <div>
            <h1 class="login-font">회원가입</h1>
        </div>
    </div>
    <div class="login-area2">
        <form class="login-area2" action="./"; method="post">  
            <div class="ip-div">
                <input type="text" name="username" placeholder="이름 입력" required autofocus> 
            </div>
            <div class="ip-div">
                <input type="text" name="userId" placeholder="아이디 입력" required>  
            </div>
            <div class="ip-div">
                <input type="password" name="password" placeholder="비밀번호 입력" required>  
            </div>
            <div class="ip-div">
                <input type="password" name="password" placeholder="비밀번호 다시 입력" required>  
            </div>
            <div class="ip-div">
                <input type="text" name="phone" placeholder="전화번호 입력" required>  
            </div>
            <div class="ip-div">
                <input type="text" name="email" placeholder="이메일 입력" required>  
            </div>
            <div class="ip-div">
                <button type="submit" class="bt">회원가입</button>                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
            </div>
        </form>
    </div>
    <div class="login-area3">
       	<div class="bt-join">
           <span><a href="./login">로그인</a></span>
       	</div>
       	<div class="bt-join">
           <span><a href="./findID">아이디 찾기</a></span>
       	</div>
       	<div class="bt-join">
           <span><a href="./findPW">비밀번호 찾기</a></span>
       	</div>
    </div>
</body>
</html>