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
	
	<div class="container" style="margin:50px; margin-left:300px;">
		<h2>글 작성</h2>
		<div>
			<form method="post" action="writeOk.do">
				<table class = "table table-boardered table-hover">
					<tr>
						<th class="table-header" style="background-color:#A9A9A9">작성자</th>
						<td>
							<lable id = "nowuser"></lable>
						</td>
						<th class="table-header" style="background-color:#A9A9A9">작성일</th>
						<td id = "date1"></td>
					</tr>
					<tr>
						<th class="table-header" style="background-color:#A9A9A9">제목</td>
						<td colspan="3">
							<input type="text" style="width:100%; border:0;" name = "title" id = "title">
						</td>
					</tr>
					<tr>
						<th colspan="4" class="table-header" style="background-color:#A9A9A9">내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea style="border:0; width:100%; height:500px" name="content" id="content1"></textarea>
						</td>
					</tr>
				</table>
			</form>
			
			<button onclick="location.href = 'free'" class="pull-right" style="align-items:center; background-color:black;
  								color:white; border-radius:5px; padding:10px;">목록으로</button>
			<button id="storage" class="pull-right" style="margin-right:5px; align-items:center; background-color:black;
  								color:white; border-radius:5px; padding:10px;">저장</button>
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
	var currentTime = year+"년 " + month+ "월 " + day +"일 "+hours+"시 "+min+"분";
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

					document.getElementById('date1').innerHTML = currentTime;
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
	var nowUid;
	firebase.auth().onAuthStateChanged(function(user) {
  		if (user) {
			nowUid = user.email;
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
			var data = {username:nowusername,title:title, content:content,date:currentTime,viewcnt:viewcnt,uid:nowUid};
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