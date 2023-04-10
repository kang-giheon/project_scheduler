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



  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>


<script src='/docs/dist/demo-to-codepen.js'></script>


  
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
        		title : '<%=dto.getSubject()%>',
        		start : '<%=dto.getStartDate()%>',
        		end : '<%dto.getEndDate();%>'
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
      //클릭시 동작
      //dateClick: function(info) {
      //    alert('clicked ' + info.dateStr);
      //  },
      //클릭하거나 드래그하면 동작
      select: function(info) {
          //alert('selected ' + info.startStr + ' to ' + info.endStr );
          var frmPop = document.frmPopup;
          var option = "width=600, height=600, left=100, top=50, location=no";
          window.open("./schedulePopup","popup",option)
          
          frmPop.action = "./schedulePopup";
          frmPop.target = "popup";
          frmPop.arg1.value = info.startStr;
          frmPop.arg2.value = info.endStr;
          frmPop.submit();
        }
    });

    calendar.render();
  });

</script>

</head>
<body>
  
  <div id='calendar' style="position : relative;">
  </div>
  <form name="frmPopup">
  <input type="hidden" name="arg1">
  <input type="hidden" name="arg2">
  </form>
</body>

</html>