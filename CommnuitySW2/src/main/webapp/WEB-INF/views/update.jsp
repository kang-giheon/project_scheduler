<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div>
		<div class="container" style="margin:50px; margin-left:300px;">
			<form>
				<h2>
					게시글 수정
				</h2>
				
				<table class = "table table-boardered table-hover">
					<tr>
						<th class="table-header" style="background-color:#A9A9A9">제목</th>
						<td><input type="text" id="title1" style="width:100%; border:0;"></td>
						<th class="table-header" style="background-color:#A9A9A9">작성자</th>
						<td id="username1"></td>
					</tr>
					<tr>
						<th class="table-header" style="background-color:#A9A9A9">작성일</th>
						<td id="date1"></td>
						<th class="table-header" style="background-color:#A9A9A9">조회수</th>
						<td id = "viewcnt1"></td>
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
			
			<button id="updatedata" class="pull-right" style="align-items:center; background-color:black;
  								color:white; border-radius:5px; padding:10px;">수정하기</button>
			<button onclick="location.href = 'free'" class="pull-right" style="align-items:center; margin-right:5px; background-color:black;
  								color:white; border-radius:5px; padding:10px;">목록으로</button>
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