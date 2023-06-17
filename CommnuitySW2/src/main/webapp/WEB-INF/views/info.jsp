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
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div class="container" style="margin:50px; margin-left:300px;">
		<h2 id="loginBoxTitle" style="width:100%; text-align:center;">자유게시판</h2>
		<table class="table table-striped table-bordered table-hover" id='table1'>
			<thead>
				<th class="table-header" style="background-color:#A9A9A9">제목</th>
				<th class="table-header" style="background-color:#A9A9A9">작성자</th>
				<th class="table-header" style="background-color:#A9A9A9">조회수</th>
				<th class="table-header" style="background-color:#A9A9A9">등록일</th>
			</thead>
			<tbody id="table">
			</tbody>
		</table>
		<input type="button" id="gowrite" value = "신규등록" class="pull-right" style="align-items:center; margin-top:10px; background-color:black;
  								color:white; border-radius:5px; padding:10px;">
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
	    var firebaseDatabase = app.database();
		const db = firebase.firestore();
		
		var table = document.getElementById("table");
		var tableRow = table.rows.length; 
		var html = '';
		
		db.collection('infoboard').get().then((test)=>{
			test.forEach((doc)=>{
				console.log(doc.data());
				html += '<tr>';
				html += '<td><a href="infoview?content=' +doc.data().content + '&date=' +doc.data().date +  '&username=' +doc.data().username +  '&viewcnt=' +doc.data().viewcnt +  '&title='+doc.data().title + ' ">' + doc.data().title+'</td>';
				html += '<td>' + doc.data().username+'</td>';
				html += '<td>' + doc.data().viewcnt+'</td>';
				html += '<td>' + doc.data().date+'</td>';
				html += '</tr>';
				
	
				
			})
		$("#table").append(html);
		})
	
		$(document).on('click','#gowrite',function(){
			firebase.auth().onAuthStateChanged(function(user) {
	  			if (user) {
					
					window.location.href="/controller/infowrite"			
	  			}else{
					alert("로그인이후 신규등록이 가능합니다.");
				}
			});
			
			
		});

	</script>
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
	
</body>
</html>