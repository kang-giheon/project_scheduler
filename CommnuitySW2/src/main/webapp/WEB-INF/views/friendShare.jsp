<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scheduler.dto.ScheduleDTOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<ScheduleDTOImpl> list = (ArrayList<ScheduleDTOImpl>)request.getAttribute("schedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정공유</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
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

function closing(){
	window.close();
}

function sharing(){
	
}

</script>
</head>
<body>
<div>
	<h3>${obj.getStartDate()} ~ ${obj.getEndDate() }까지 일정</h3>
	<div>
	<p>일정을 공유하시겠습니까?</p>
	<button onclick="sharing()">예</button><button onclick="closing();">아니오</button>
	</div>
</div>
</body>
</html>
