<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div class="container" style="margin:50px; margin-left:300px;">
		<h2 id = "title1"></h2>
		<table class = "table table-bordered table-hover">
			<tr>
				<th class="table-header" style="background-color:#A9A9A9">제목</th>
				<td  id = "title2"></td>
				<th class="table-header" style="background-color:#A9A9A9">작성자</th>
				<td id = "username1"></td>
			</tr>
			<tr>
				<th class="table-header" style="background-color:#A9A9A9">작성일</th>
				<td id = "date1"></td>
				<th class="table-header" style="background-color:#A9A9A9">조회수</th>
				<td id = "viewcnt1"></td>
			</tr>
			<tr>
				<th colspan="4" class="table-header" style="background-color:#A9A9A9">내용</th>
			</tr>
			<tr>
				<td colspan="4" id = "content1"></td>
			</tr>
		</table>
		
		<button id="delete" class="pull-right" style="align-items:center; background-color:black;
							color:white; border-radius:5px; padding:10px;">삭제하기</button>
		<button id="goupdate"class="pull-right" style="align-items:center;  margin-right:5px;background-color:black;
  								color:white; border-radius:5px; padding:10px;">수정하기</button>
		<button onclick="location.href='info'" class="pull-right" style="align-items:center; margin-right:5px; background-color:black;
							color:white; border-radius:5px; padding:10px;">목록보기</button>
		<button onclick="location.href='infowrite'" class="pull-right" style="align-items:center; margin-right:5px; background-color:black;
							color:white; border-radius:5px; padding:10px;">신규등록</button>
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
var useremail;
	db.collection('infoboard').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			if(doc.data().content == content){
				console.log("find!");
				var newcnt = doc.data().viewcnt + 1;
				var findId = doc.id;
				useremail = doc.data().uid;
				db.collection('infoboard').doc(findId).update({
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
document.getElementById('username1').innerHTML = usernamehtml;

var datehtml = '';
datehtml += '<td>' + date+'</td>';
document.getElementById('date1').innerHTML = datehtml;

var viewcnthtml = '';
viewcnthtml += '<td>' + viewcnt+'</td>';
document.getElementById('viewcnt1').innerHTML = viewcnthtml;

var contenthtml = '';
contenthtml += '<td>' + content+'</td>';
document.getElementById('content1').innerHTML = contenthtml;

$(document).on('click','#delete',function(){
	alert("삭제하시겠습니까?");
	//삭제하고 alert창뜨고 확인누르면 다른창으로 가지긴하는데 가면 삭제가안됨;;;
	db.collection('infoboard').get().then((test)=>{
		test.forEach((doc)=>{
			
			if(doc.data().title == title && doc.data().content == content){
				console.log("find");
				var findId = doc.id;
			firebase.auth().onAuthStateChanged(function(user) {
				console.log(user.email);//지금 로그인 사용자 email
				console.log(useremail);//작성자 email
  				if (user.email == useremail) {
				
					db.collection('infoboard').doc(findId).delete().then(() => {
						alert("삭제되었습니다");
						window.location.href = 'info';
					});			
  				}else{
					alert("작성자만 삭제가능합니다.");
				}
			});	
			}
		})
	})
});
$(document).on('click','#goupdate',function(){

	var username = username1.innerHTML;
	var viewcnt = viewcnt1.innerHTML;
	var date = date1.innerHTML;
	var title = title2.innerHTML;
	var content = content1.innerHTML
	
	firebase.auth().onAuthStateChanged(function(user) {
			console.log(user.email);//지금 로그인 사용자 email
			console.log(useremail);//작성자 email
  			if (user.email == useremail) {
				
				window.location.href="/controller/infoupdate?username=" + username+ "&viewcnt="+viewcnt+"&date="+date+"&title="+title+"&content="+content;			
  			}else{
				alert("작성자만 수정가능합니다.");
			}
	});


	//window.location.href = "infoupdate?username=" + username+ "&viewcnt="+viewcnt+"&date="+date+"&title="+title+"&content="+content;
});
</script>

<script>

   function goupdate() {
	   var username = username1.innerHTML;
	   var viewcnt = viewcnt1.innerHTML;
	   var date = date1.innerHTML;
	   var title = title2.innerHTML;
	   var content = content1.innerHTML
	   window.location.href = "infoupdate?username=" + username+ "&viewcnt="+viewcnt+"&date="+date+"&title="+title+"&content="+content;
   }
  </script>
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>