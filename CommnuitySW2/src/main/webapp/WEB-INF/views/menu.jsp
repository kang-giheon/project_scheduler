<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Scheduler Community</title>

	<link rel="stylesheet" href="./resources/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/css/bootstrap/perfect-scrollbar.min.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/firebaseDB.js"></script>  
   <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>  
</head>
<body>

<nav id="sidebar">
	<div class="sidebar-header" ><a href='/controller'>
		<h1 class="site-title">
		<img class="imglogo" src="./resources/img/logo.png"><br/>
		Scheduler Community </h1> </a>
	</div>
	<ul class="list-unstyled components">
		<li class="active">
		<a href="/controller/login" id="logged-in">로그인</a>
		</li>
		<li>
		<a href="/controller/join">회원가입</a>
		</li>
		<li>
			<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">마이페이지</a>
			<ul class="collapse list-unstyled" id="pageSubmenu">
				<li><a id="mypage" href="/controller/mypage">내 정보 수정</a></li>
				<li><a id="scheduler" href="/controller/lookup">나의 스케줄러</a></li>
			</ul>
		</li>
	</ul>
	<ul class="list-unstyled components">
		<li class="active">
		<a href="/controller/notice">공지사항</a>
		</li>
		<li>
			<a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false">게시판</a>
			<ul class="collapse list-unstyled" id="pageSubmenu2">
				<li><a href="/controller/free">자유게시판</a></li>
				<li><a href="/controller/info">정보게시판</a></li>
			</ul>
		</li>
	</ul>
	<div class="sidebar-footer">
		<p class="social-icons">
			<a target="_blank" href="#"><i class="fa fa-youtube"></i></a>
			<a target="_blank" href="#"><i class="fa fa-soundcloud"></i></a>
			<a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
			<a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
			<a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
		</p>
	</div>
</nav>
	<script>
		var app = firebase.initializeApp(firebaseConfig);
 	    firebaseEmailAuth = app.auth();
	    firebaseDatabase = app.database();
 	    
		userSessionCheck();

       function userSessionCheck(){
    	   firebaseEmailAuth.onAuthStateChanged(function(user){
    		   if(user){
    				   document.getElementById('logged-in').textContent="로그아웃";
    				   document.getElementById('logged-in').href="/controller";
    		   }
    		   else {
    				document.getElementById('mypage').href="/controller/login";
    			   	document.getElementById('scheduler').href="/controller/login";
    		   }
    		})
    	 }
       
       $(document).ready(function(){
			//가입버튼 눌렀을 때
       	$(document).on('click','#logged-in',function(){
       		firebaseEmailAuth.signOut().then(function(){
       			window.location.href="/controller/login/logout"
       			window.location.href="/controller"
       		})
	      });
	    });
     
	</script>
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>

</html>