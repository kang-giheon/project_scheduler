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
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>
	<h2>~~~~~~~~~~~~~~~~~~~~~~~~~~free입니다~~~~~~~~~~~~~~~~~~~~~</h2>
	<script>
	var d = new Date();
	var year = d.getFullYear().toString();
	var month = (d.getMonth() + 1).toString();
	var day = d.getDate().toString();
	var hours = d.getHours().toString();
	var min = d.getMinutes().toString();
	var sec = d.getSeconds().toString();
	var currentTime = year + month + day + hours + min + sec;
	
	function userSessionCheck(){
		console.log(currentTime);
		
 	   firebaseEmailAuth.onAuthStateChanged(function(user){
 		   if(user){
 				   //로그인 되어있으면
 		   }
 		   else {
 			   //로그인 안됐으면
 				document.getElementById('mypage').href="/controller/login";
 			   	document.getElementById('scheduler').href="/controller/login";
 		   }
 		})
 	 }
	userSessionCheck();
	</script>
	
	
	
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
	
</body>
</html>