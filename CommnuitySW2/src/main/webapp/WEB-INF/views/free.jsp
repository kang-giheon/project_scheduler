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
	<div class="container">
		<h2 class="text-center">자유게시판</h2>
		<table class="table table-boardered table table-hover" id='table1'>
			<thead>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</thead>
			<tbody id="table">
				<tr>
					<td>
						<!--  <a href="view.do?bno=${board.bno}">${board.title}</a> -->
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td colspan="5" class="text-center">
						<button onclick="location.href='write'">신규등록</button>
					</td>
				</tr>
				
			</tbody>
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
	
	//

	var table = document.getElementById("table");
	var tableRow = table.rows.length; 
	var html = '';
	
	db.collection('board').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			html += '<tr>';
			html += '<td><a href="view?content=' +doc.data().content + '&date=' +doc.data().date +  '&username=' +doc.data().username +  '&viewcnt=' +doc.data().viewcnt +  '&title='+doc.data().title + ' ">' + doc.data().title+'</td>';
			html += '<td>' + doc.data().username+'</td>';
			html += '<td>' + doc.data().viewcnt+'</td>';
			html += '<td>' + doc.data().date+'</td>';
			html += '</tr>';
			

			
		})
	$("#table").append(html);
	})
	

	</script>
	
	
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
	
</body>
</html>