<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.scheduler.dto.ScheduleDTOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<ScheduleDTOImpl> list = (ArrayList<ScheduleDTOImpl>)request.getAttribute("showSchedule");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>친구</title>
	<style>
		#calendar {
      max-width: 1100px;
      max-height: 550px;
      margin: 30px auto;
    }
	</style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');

    	var calendar = new FullCalendar.Calendar(calendarEl, {
      		selectable: true,
      		headerToolbar: {
        		left: 'prev,next today',
        		center: 'title',
        		right: 'dayGridMonth,timeGridWeek'
      		},
      		locale:"ko",
      		dayMaxEvents: true,
      		events: [
    	  		<%for(int i=0; i<list.size(); i++){
      				ScheduleDTOImpl dto = (ScheduleDTOImpl)list.get(i);%>
      				{
      					title : "<%=dto.getSubject()%>",
      					start : "<%=dto.getStartDate()%>",
      					end : "<%=dto.getEndDate()%>"
      				},
      				<%
      				}
      				%>
        			{
        				title : 'default',
        				start : "2020-01-01",
        				end : "2020-01-01"
        			}
      		],
      		select: function(info) {
      			if("<%=request.getAttribute("email")%>"!="null"){
      				//친구찾는 함수
      			}else{
      				alert("로그인해주세요.");
      			}
      			
        	}
    	});
    	calendar.render();
  	});
	</script>
</head>
<body>

<div class="wrapper">
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>

	<div id="content">
	    <div class="div-fl">
	      <div class="card">
			<div id='calendar' style="position : relative;"></div>
	      </div>
	    </div>
	    <div class="div-fl">
	      <div class="card">
	        <div class="card-block">
	          <h2 class="card-title">친구 추가</h3><input type="text" placeholder="이메일을 입력해주세요"><button>요청</button>
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block">
	          친구 목록,요청
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