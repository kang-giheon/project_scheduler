<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scheduler.dto.ScheduleDTOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<ScheduleDTOImpl> list = (ArrayList<ScheduleDTOImpl>)request.getAttribute("showSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/main.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel = "stylesheet">
	<link rel="stylesheet" href = "https://maxcdn.boostrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link href='/docs/dist/demo-to-codepen.css' rel='stylesheet' />
  <style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 40px auto;
    }
    
    .add-button{
    	position: absolute;
    	top: 1px;
    	right: 230px;
    	background: #2C3E50;
    	border: 0;
    	color: white;
    	height: 35px;
    	border-radius: 3px;
    	width: 157px;
    }

  </style>
  <script src="./resources/js/firebaseDB.js"></script>     
    <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
	<script src='/docs/dist/demo-to-codepen.js'></script>
	<script src="./resources/js/getSchedule.js"></script>
	<script>
	// Initialize Firebase
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
				getScheduleInfo(documents,start,end);
		    console.log("특정 날짜 문서");
		  } catch (error) {
		    console.error("문서 조회 중 오류 발생:", error);
		  }
	}	
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
      				fetchDocumentsBetweenDates("<%=request.getAttribute("email")%>",info.startStr,info.endStr);
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
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>
	<div>
	  <div id='calendar' style="position : relative;">
	  </div>
	  <form name="frmPopup" method="post">
		<input type="hidden" name="arg1">
		<input type="hidden" name="arg2">
		<input type="hidden" name="arg3">
	  </form>
	</div>
</body>
</html>