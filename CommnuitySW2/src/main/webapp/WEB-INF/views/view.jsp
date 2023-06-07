<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel = "stylesheet">
<link rel="stylesheet" href = "https://maxcdn.boostrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.boostrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>
	<div class="container">
		<h2 id = "title1"></h2>
		<table class = "table table-boardered table table-hover">
			<tr>
				<td>제목</td>
				<td  id = "title2"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td id = "username"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td id = "date"></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td id = "viewcnt"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2" id = "content"></td>
			</tr>
			
			<tr>
				<td colspan="2" class="text-center">
					<button onclick="location.href='update?username=' + encodeURIComponent(username)">수정하기</button>
					<button onclick="location.href='free'">목록보기</button>
					<button onclick="chkDelete(${board.bno })">삭제하기</button>
					<button onclick="location.href='write'">신규등록</button>
				</td>

			</tr>

		</table>
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

	db.collection('board').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			if(doc.data().content == content){
				console.log("find!");
				var newcnt = doc.data().viewcnt + 1;
				var findId = doc.id;
				db.collection('board').doc(findId).update({
  viewcnt: newcnt
})
.then(() => {
  console.log('업데이트 완료');
})
.catch((error) => {
  console.error('업데이트 오류', error);
});
			}
			

			
		})

	})


var titlehtml = '';
titlehtml += '<td>' + title+'</td>';
document.getElementById('title1').innerHTML = titlehtml;
document.getElementById('title2').innerHTML = titlehtml;

var usernamehtml = '';
usernamehtml += '<td>' + username+'</td>';
document.getElementById('username').innerHTML = usernamehtml;

var datehtml = '';
datehtml += '<td>' + date+'</td>';
document.getElementById('date').innerHTML = datehtml;

var viewcnthtml = '';
viewcnthtml += '<td>' + viewcnt+'</td>';
document.getElementById('viewcnt').innerHTML = viewcnthtml;

var contenthtml = '';
contenthtml += '<td>' + content+'</td>';
document.getElementById('content').innerHTML = contenthtml;


</script>

	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>