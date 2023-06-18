<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Scheduler Community</title>

	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/css/perfect-scrollbar.min.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link rel="stylesheet" href="./resources/css/style.css">
	<link rel="stylesheet" href="./resources/css/main.css">
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/firebaseDB.js"></script>     
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script>
	var firebaseDatabase;

	var app = firebase.initializeApp(firebaseConfig);

	const db = app.firestore();
	async function fetchDocumentsBetweenDates(userUID,start,end) {
		  try {
				const collectionRef = db.collection('schedules').doc(userUID).collection('schedule');
				const querySnapshot = await collectionRef.get();
				let documents = new Array();
		   
		    	var i = 0;
				querySnapshot.forEach((documentSnapshot) => {
    				const documentData = documentSnapshot.data();
    				const endDate = documentData["endDate"];
    				const startDate = documentData["startDate"];
    				if(startDate<=start && end<=endDate){
	      				documents[i++] = documentData;
    				}
    				else if(startDate>=start && startDate<end){
    					documents[i++] = documentData;
    				}
    				else if(endDate>start && endDate<=end){
    					documents[i++] = documentData;
    				}
		    	});
				console.log(documents);
				for(let i in documents){
					var doc=documents[i];
					let form = document.getElementById('form');
					let scdlist = document.createElement('p');
					let br = document.createElement('br');
					//scdlist.setAttribute('type','checkbox');
					const memo = doc["memo"];
					const sub = doc["subject"];
					scdlist.innerHTML=memo;
					form.appendChild(scdlist);
					form.appendChild(br);
					form.appendChild(br);
				}
		    console.log("특정 날짜 문서");
		  } catch (error) {
		    console.error("문서 조회 중 오류 발생:", error);
		  }
	}
	if('${email}'!=""){
	$(document).ready(function(){
		var id = '${email}';
		var date = new Date();
		var today =  date.toISOString().substring(0,10);
		var tomorrow = new Date(date.setDate(date.getDate()+1)).toISOString().substring(0,10);;
		console.log(id);
		console.log(tomorrow);
		fetchDocumentsBetweenDates(id,today,tomorrow)
	});
	}
	
	var html = '';
	var cnt = 0;
	var positon = -1;
	var slhtml = '';
	db.collection('infoboard').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			html += '<br><a href="infoview?content=' +doc.data().content + '&date=' +doc.data().date +  '&username=' +doc.data().username +  '&viewcnt=' +doc.data().viewcnt +  '&title='+doc.data().title + ' ">' + doc.data().title+'</br>';
			console.log(html);
		})
		
	}).then(() => {
		for(var i = 0; i< html.length; i++){
			if(html[i] == 'b' && html[i+1] == 'r'){
				cnt++;
				if(cnt ==11){
					position = i;
					break;
				}
			}
		}
		console.log(position);
		slhtml = html.slice(0,position - 1);
		console.log(slhtml);
		$("#info").append(slhtml);
    });

	

	
	var freehtml = '';
	var slfreehtml = '';
	var frcnt = 0;
	var frpo = -1;
	db.collection('board').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			freehtml += '<br><a href="view?content=' +doc.data().content + '&date=' +doc.data().date +  '&username=' +doc.data().username +  '&viewcnt=' +doc.data().viewcnt +  '&title='+doc.data().title + ' ">' + doc.data().title+'</br>';

		})
	;
	}).then(() => {
		for(var i = 0; i< freehtml.length; i++){
			if(html[i] == 'b' && html[i+1] == 'r'){
				cnt++;
				if(cnt ==11){
					frpo = i;
					break;
				}
			}
		}
		console.log(frpo);
		slfreehtml = freehtml.slice(0,position - 1);
		console.log(slfreehtml);
		$("#free").append(slfreehtml);
    });
	
	
	var noticehtml = '';
	var slnoticehtml = '';
	var nocnt = 0;
	var nopo = -1;
	db.collection('noticeboard').get().then((test)=>{
		test.forEach((doc)=>{
			console.log(doc.data());
			noticehtml += '<br><a href="noticeview?content=' +doc.data().content + '&date=' +doc.data().date +  '&username=' +doc.data().username +  '&viewcnt=' +doc.data().viewcnt +  '&title='+doc.data().title + ' ">' + doc.data().title+'</br>';

		})
	;
	}).then(() => {
		for(var i = 0; i< noticehtml.length; i++){
			if(noticehtml[i] == 'b' && noticehtml[i+1] == 'r'){
				nocnt++;
				if(nocnt ==11){
					nopo = i;
					break;
				}
			}
		}
		console.log(nopo);
		slnoticehtml = noticehtml.slice(0,position - 1);
		console.log(slnoticehtml);
		$("#notice").append(slnoticehtml);
    });
	
	</script>
</head>
<body>

<div class="wrapper">
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>

	<div id="content">
	    <div class="div-fl">
	      <div class="card">
	      	<iframe src="http://localhost:8080/controller/lookup" width=100% height=650px></iframe>
	      </div>
	      <div class="card p-3">
	        <blockquote class="card-block card-blockquote">
	        	<h2 class="card-title">Scheduler</h2>
	          	<p><form id="form" method="get" action="CheckboxServlet">
				</form></p>
	        </blockquote>
	      </div>
	    </div>
	    <div class="div-fl">
	      <div class="card">
	        <div class="card-block" id='notice'>
	          <h2 class="card-title">공지사항</h2>
	          
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block" id='free'>
	          <h2 class="card-title">자유게시판</h2>
	          
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block" id='info'>
	          <h2 class="card-title">정보게시판</h2>
	          
	        </div>
	      </div>
	    </div>
	</div>
</div>

<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/tether.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/perfect-scrollbar.min.js"></script>
<script src="./resources/js/common.js"></script>

</body>
</html>
