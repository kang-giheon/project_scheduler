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
        <div id="loginBoxTitle">아이디 찾기</div>
        <div class="form-group">
            <label>이름</label>
             <input id="name" type="text" name="username" placeholder="이름 입력" class="form-control" style="ime-mode:disabled" required autofocus>
        </div>
        <div class="form-group">
            <label>전화번호</label>
            <input id="tel" type="text" name="phone" placeholder="전화번호 입력" class="form-control"  autocomplete="off" required> 
        </div>
        <input id="findID" type="button" class="login-btn-box" value="아이디 찾기" >
        <div class="ot-btn">
        	<div class="ot-btn-in">
	           <span><a href="./login">로그인</a></span>
	       	</div>
	       	<div class="ot-btn-in">
	           <span><a href="./join">회원가입</a></span>
	       	</div>
	       	<div class="ot-btn-in">
	           <span><a href="./findPW">비밀번호 찾기</a></span>
	       	</div>
        </div>
      </div>
    </div>
    
	<script src="./resources/js/firebaseDB.js"></script>     
    <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>
	 
	<script>	
		var app = firebase.initializeApp(firebaseConfig);
		const db = firebase.firestore();
		var username, tel, email, dbUser;
		var getname, gettel, getUser;
		var dbUserlist=[];
		var dbUsername=[];
		var dbUsertel=[];
		
		db.collection('users').get().then((getUsers)=>{
			getUsers.forEach((allDoc)=>{
				username = allDoc.data().username;
				dbUsername.push(username);
				tel = allDoc.data().tel;
				dbUsertel.push(tel);
				email = allDoc.data().email;
			})
			console.log(dbUsername);
			console.log(dbUsertel);
		})
		
		$(document).ready(function(){
		  $(document).on('click','#findID',function(){
		    getname = $('#name').val().toString();
		 	gettel = $('#tel').val().toString();
		 	getUser = [getname, gettel];
		 	console.log(getUser);
			
			if(getname != "" && gettel != ""){
					if(dbUsername.includes(getname) == true && dbUsertel.includes(gettel)){
						db.collection('users').get().then((test)=>{
							test.forEach((doc)=>{
								var tel = doc.data().tel;
								if(tel == gettel){
									var useremail = doc.data().email;
									alert(getname + "님의 아이디는 " + useremail + "입니다");
									window.location.href="/controller/login";
								}	
							})
						})
					}
					else {
						alert("일치하는 사용자가 없습니다");
					}
			} else { 
				alert("모든 항목을 입력하세요");
			}
		  })
		})
	</script>
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>