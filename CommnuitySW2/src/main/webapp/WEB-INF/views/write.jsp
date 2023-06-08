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
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel = "stylesheet">
<link rel="stylesheet" href = "https://maxcdn.boostrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.boostrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>
	
	


	<div class="container" style = "padding-left:180px">
		<h2>글 작성</h2>
		<div>
			<form method="post" action="writeOk.do">
				<table class = " table table-boardered table table-hover">
					<tr>
						<td>작성자</td>
						<td>
							<lable id = "nowuser"></lable>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name = "title" id = "title">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="150" name="content" id="content1"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" id="storage" value = "저장" >
						</td>
					</tr>
				</table>
			</form>
			<button onclick="location.href = 'free'">목록으로</button>
		</div>
	
	
	</div>
	
	
	
	
	<script src="./resources/js/firebaseDB.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>
	
	<script type="module">
	//파이어베이스 연동
	import { getFirestore, setDoc, doc } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-firestore.js";
	
	var app = firebase.initializeApp(firebaseConfig);
    var firebaseEmailAuth = app.auth();
    var firebaseDatabase = app.database();
    const db = getFirestore(app);
	
	//
	
	var d = new Date();
	var year = d.getFullYear().toString();
	var month = (d.getMonth() + 1).toString();
	var day = d.getDate().toString();
	var hours = d.getHours().toString();
	var min = d.getMinutes().toString();
	var sec = d.getSeconds().toString();
	var currentTime = year+"년" + month+ "월" + day +"일"+hours+"시"+min+"분";
	var nowusername;
	//현재 로그인한 user의 username 뽑아냄
	function test(nowUid){
		db.collection('users').get().then((test)=>{
			test.forEach((doc)=>{
				var allEmail = doc.data().email;
				if(allEmail == nowUid){
					var nowUser = doc.data().username;
					nowuser.innerHTML = nowUser;
					nowusername = nowUser;
					console.log(nowusername);
				}	
			})
		})
		
	}

	


	//firebaseEmailAuth.onAuthStateChanged((user) => {
	//	if(user){
	//		var username = user.username;
	//		console.log(username);
	//	}
	//})
	
	firebase.auth().onAuthStateChanged(function(user) {
  		if (user) {
			var nowUid = user.email;
			test(nowUid);
			
  		}
	});
	
	$(document).on('click','#storage',function(){
		var title = $('#title').val().toString();
		var content = $('#content1').val().toString();
		
		joinDB(title, content);
		
		
	});

	function joinDB(title, content) {
		firebaseEmailAuth.onAuthStateChanged( async (board) => {
			
			var viewcnt = 0;
			var data = {username:nowusername,title:title, content:content,date:currentTime,viewcnt:viewcnt};
			var bid = 0;
			const res = await db.collection('board').doc(board.bid).set(data);
			window.location.href="/controller/free"
			})
	}
	</script>
	
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
	
</body>
</html>