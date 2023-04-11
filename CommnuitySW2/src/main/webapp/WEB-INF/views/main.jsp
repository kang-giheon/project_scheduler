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
</head>
<body>

<div class="wrapper">
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>

	<div id="content">
	    <div class="card-columns">
	      <div class="card">
	        <img class="card-img-top img-fluid" src="https://img.freepik.com/free-vector/calendar-icon-on-white-background_1308-84634.jpg?w=2000" alt="Card image cap">
	        <div class="card-block">
	          <h2 class="card-title">Scheduler</h2>
	          <p class="card-text">개인 스케줄러</p>
	        </div>
	      </div>
	      <div class="card p-3">
	        <blockquote class="card-block card-blockquote">
	          	<p><form method="get" action="CheckboxServlet">
					<input type="checkbox" name="item" value="운동1"> 운동 1 - 3세트<br><br>
					<input type="checkbox" name="item" value="운동2"> 운동 2 - 1세트<br><br>
					<input type="checkbox" name="item" value="운동3"> 운동 3 - 3세트<br><br>
					<input type="checkbox" name="item" value="ㅇㅇ와운동"> ㅇㅇ와 운동하기<br>
				</form></p>
	        </blockquote>
	      </div>
	      <div class="card">
	        <div class="card-block">
	          <h2 class="card-title">공지사항</h2>
	          <p class="card-text">- 공지사항 1 <br> - 공지사항 2 <br> - 공지사항 3</p>
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block">
	          <h2 class="card-title">자유게시판</h2>
	          <p class="card-text">- 게시글 1 <br> - 게시글 2 <br> - 게시글 3 <br> - 게시글 4 <br> - 게시글 5 </p>
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block">
	          <h2 class="card-title">정보게시판</h2>
	          <p class="card-text">- 게시글 1 <br> - 게시글 2 <br> - 게시글 3 <br> - 게시글 4 <br> - 게시글 5 </p>
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
