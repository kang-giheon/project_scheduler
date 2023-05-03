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
		<a href="/controller/login">로그인</a>
		</li>
		<li>
		<a href="/controller/join">회원가입</a>
		</li>
		<li>
			<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">마이페이지</a>
			<ul class="collapse list-unstyled" id="pageSubmenu">
				<li><a href="/controller/mypage">내 정보 수정</a></li>
				<li><a href="/controller/schedule">나의 스케줄러</a></li>
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
		<p>
			Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

		</p>
	</div>
</nav>

<script src="./resources/js/bootstrap/jquery.js"></script>
<script src="./resources/js/bootstrap/tether.min.js"></script>
<script src="./resources/js/bootstrap/bootstrap.min.js"></script>
<script src="./resources/js/bootstrap/perfect-scrollbar.min.js"></script>
<script src="./resources/js/bootstrap/common.js"></script>

</html>