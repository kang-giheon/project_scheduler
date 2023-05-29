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
            <label>아이디(이메일)</label>
            <input type="text" id="email" class="form-control" ime-mode:disabled">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" id="password" class="form-control" autocomplete="off">
        </div>
        <input id="Login" type="button" class="login-btn-box" value="로그인" onclick="emailCheck()" >
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
    <script>
    	function emailCheck(){
		$.ajax({
				data : {"email" : $('#email').val()},
				url : "./login",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8"
		});
		}	
    </script>
	<script src="./reqources/js/getSchedule.js"></script>
	<script src="./resources/js/firebaseDB.js"></script>    
   <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script> 
	<script type="module">
	  // Import the functions you need from the SDKs you need
	  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-app.js";
	  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-analytics.js";
	  import { getFirestore } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-firestore.js";
	  import { getDatabase, ref, set, update } from "https://www.gstatic.com/firebasejs/9.1.0/firebase-database.js";
	  import { getAuth, signInWithEmailAndPassword } from 'https://www.gstatic.com/firebasejs/9.2.0/firebase-auth.js';

	  // TODO: Add SDKs for Firebase products that you want to use
	  // https://firebase.google.com/docs/web/setup#available-libraries

		// Initialize Firebase
		var app = firebase.initializeApp(firebaseConfig);

	    var firebaseEmailAuth = app.auth();
	    var firebaseDatabase = app.database();

		const database = getDatabase(app);

	    //제이쿼리를 사용한다.
 	   $(document).ready(function(){
			//가입버튼 눌렀을 때
        	$(document).on('click','#Login',function(){
		        //제이쿼리 선택자와 val() 함수를 이용해서 이메일,비밀번호 값을 가져온다. 
		        var email = $('#email').val();
		        var password = $('#password').val();
 	   
				if(email != "" && password != ""){
				    //파이어베이스 이메일 로그인 함수
				    firebaseEmailAuth.signInWithEmailAndPassword(email, password).then(function(firebaseUser) { 
				       //성공하면 firebaseUser에 유저 정보 값이 담겨 넘어온다.
				       loginSuccess(firebaseUser); 
				   })
				  .catch(function(error) {
			       // 실패했을 때 에러 처리
			       alert("로그인 실패");
				  });    
		      } else {
					alert("모든 항목을 입력하세요");
			  }
			});
		});
    
	    //로그인 성공했을 때
	    function loginSuccess(firebaseUser){
	        alert("로그인 성공");
	    	//메인 페이지로 이동
	   		window.location.href = "/controller"
	    }
		
	</script>

</script>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/tether.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/perfect-scrollbar.min.js"></script>
<script src="./resources/js/common.js"></script>
</body>
</html>