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
                <div id="loginBoxTitle">내 정보 수정</div>
        <div class="form-group">
            <label>아이디(이메일) - 수정 불가능</label>
             <label id="useremail" class="form-control"></label>
        </div>
        <div class="form-group">
            <label>이름</label>
            <input id="name" type="text" name="email" placeholder="이름 입력" class="form-control" autocomplete="off" required autofocus>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input id="password" type="password" name="password" placeholder="비밀번호 입력" class="form-control"  autocomplete="off" required>  
        </div>
        <div class="form-group">
            <label>비밀번호 재입력</label>
            <input id="repassword" type="password" name="password" placeholder="비밀번호 재입력" class="form-control" autocomplete="off" required>   
        </div>
        <div class="form-group">
            <label>전화번호</label>
            <input id="tel" type="text" name="phone" placeholder="전화번호 입력" class="form-control"  autocomplete="off" required> 
        </div>
        
        <input type="button" id="Update" value="수정하기" style="align-items: center; margin-top:10px; background-color:black;
  						color:white; border-radius:5px; width:100%; padding:10px;" >
  						
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
	    var firebaseEmailAuth = app.auth();
	    const db = firebase.firestore();
	    
	    function test(nowUid){
			db.collection('users').get().then((test)=>{
				test.forEach((doc)=>{
					var allEmail = doc.data().email;
					if(allEmail == nowUid){
						useremail.innerHTML = nowUid;
					}	
				})
			})
		}
	    
	    firebaseEmailAuth.onAuthStateChanged(function(user) {
	  		if (user) {
				var nowUid = user.email;
				test(nowUid);
	  		}
		    var userUID = user.uid;
		    const email = user.email;
		    console.log(userUID);
		    console.log(email);
		});
	    
	    $(document).ready(function(){
			  $(document).on('click','#Update',function(){
				  firebaseEmailAuth.onAuthStateChanged(function(user) {
					var userUID = user.uid;
				    var name = $('#name').val().toString();
				    var password = $('#password').val().toString();
					var repassword = $('#repassword').val().toString();
				 	var tel = $('#tel').val().toString();
				 	
				 	if(name != "" && password != "" && repassword != "" && tel != ""){
				 		if(password == repassword){
							var data = { username:name, password:password, tel:tel };
							console.log(data);
							db.collection('users').doc(userUID).update(data).then(() => {
								window.location.href = '/controller';
							})
				 		} else {
				 			alert("비밀번호가 일치하지 않습니다.");
				 		}
				 	} else {
				 		alert("모든 항목을 입력해주세요!");
				 	}
				  });
			  })
	    });
    </script>
    
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>