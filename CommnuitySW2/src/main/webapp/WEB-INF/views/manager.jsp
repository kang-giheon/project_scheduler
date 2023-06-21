<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="check">
		
	</div>
	<button id="go">변경</button>
	<script src="./resources/js/firebaseDB.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>
	<script type = 'module'>

	import { getFirestore, setDoc, doc } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-firestore.js";

	var app = firebase.initializeApp(firebaseConfig);
	var firebaseEmailAuth = app.auth();
	var firebaseDatabase = app.database();
	const db = getFirestore(app);
	
	var manager = "";
	var email = "";
	var html = "";
	db.collection('users').get().then((test)=>{
		test.forEach((doc)=>{
				manager = doc.data().manager;
				email = doc.data().email;
				console.log(manager);
				console.log(email);
				if(manager == '1'){
					html += '<input type="checkbox" checked value ="' + email + '">';	
				}else{
					html += '<input type="checkbox" value ="' + email + '">';
				}
				html += email;
				html += '<br>';
		})
	$("#check").append(html);	
	})


	$(document).on('click','#go',function(){
   		$("#check input[type='checkbox']:checked").each(function() {
        	var cemail = $(this).val();
			db.collection('users').get().then((test)=>{
				test.forEach((doc)=>{
					if(cemail == doc.data().email){
						var findId = doc.id;
						db.collection('users').doc(findId).update({
 							manager : "1"
						})
					}
				})

			})
    	});
		$("#check input[type='checkbox']:not(:checked)").each(function() {
  			var cemail = $(this).val();
			db.collection('users').get().then((test)=>{
				test.forEach((doc)=>{
					if(cemail == doc.data().email){
						var findId = doc.id;
						db.collection('users').doc(findId).update({
 							manager : "0"
						})
					}
				})

			})
		})
		gofree();
	});
	
	function gofree(){
		alert("수정되었습니다");
		
		 
	}
	</script>
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>