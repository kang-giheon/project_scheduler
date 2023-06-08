<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div class="container">
			<form>
				<h2>
					
				</h2>
				
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" id="title1"></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td id = "viewcnt1"></td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td id="username1"></td>
					</tr>
					
					<tr>
						<td>작성일</td>
						<td id="date1"></td>
					</tr>
					
					<tr>
						<td colspan="2"><b>내용</b></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="150" id = "content1"></textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="button" id="updatedata" value = "수정하기" >
							
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
	<script  type="module">

	//파이어베이스 연동
	import { getFirestore, setDoc, doc } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-firestore.js";
	
	var app = firebase.initializeApp(firebaseConfig);
    var firebaseEmailAuth = app.auth();
    var firebaseDatabase = app.database();
    const db = getFirestore(app);


	var queryString = window.location.search.substring(1);

	//쿼리 문자열을 파싱하여 객체로 변환
	var params = {};
	queryString.split('&').forEach(function(param) {
	var keyValue = param.split('=');
	var key = decodeURIComponent(keyValue[0]);
	var value = decodeURIComponent(keyValue[1]);
	params[key] = value;
	});




	//boarddata 값 출력
	var viewcnt = params.viewcnt;
	var username = params.username;
	var date = params.date;
	var title = params.title;
	var content = params.content;

	console.log(viewcnt);
	console.log(username);
	console.log(date);
	console.log(title);
	console.log(content);
	
	var titlehtml = '';
	titlehtml += '<td>' + title+'</td>';
	document.getElementById('title1').value = title;
	
	var usernamehtml = '';
	usernamehtml += '<td>' + username+'</td>';
	document.getElementById('username1').innerHTML = usernamehtml;
	
	var datehtml = '';
	datehtml += '<td>' + date+'</td>';
	document.getElementById('date1').innerHTML = datehtml;

	var viewcnthtml = '';
	viewcnthtml += '<td>' + viewcnt+'</td>';
	document.getElementById('viewcnt1').innerHTML = viewcnthtml;

	var contenthtml = '';
	contenthtml += '<td>' + content+'</td>';
	document.getElementById('content1').value = content;

	
	$(document).on('click','#updatedata',function(){

		db.collection('board').get().then((test)=>{
			test.forEach((doc)=>{
				console.log(doc.data());
				if(doc.data().title == title && doc.data().content == content){
					console.log("find");
					var findId = doc.id;

					db.collection('board').doc(findId).update({
 						title: title1.value, content: content1.value
					}).then(() => {
						gofree();
					})
					
				}
			})
		})

	});
	function gofree(){
		alert("수정되었습니다");
		window.location.href = 'free';
		 
	}
	</script>
		
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
	
</body>
</html>