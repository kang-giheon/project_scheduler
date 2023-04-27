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
<title>일정추가,수정,삭제</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./resources/js/click_ok.js"></script>
</head>
<body>
<div>
	<h3>${obj.getStartDate()} ~ ${obj.getEndDate() }까지 일정</h3>
	<div>
		<table border="1">
			<th>제목</th>
			<th>내용</th>
			<th>수정/삭제</th>
			<%for(int i=0; i<list.size(); i++){
				ScheduleDTOImpl dto = (ScheduleDTOImpl)list.get(i);%>
				<tr>
					<td><%=dto.getSubject() %></td>
					<td><%=dto.getMemo()%></td>
					<td><button>수정</button><button>삭제</button></td>
				</tr>
			<%}%>
		</table>
	</div>
</div>
<br>
<div>
	<h3>일정 추가</h3>
	<div>
		<form name="addpopup" id="scheduleData">
			<div>
			<h4>제목</h4>
			<input name="subject" placeholder="제목을 입력해주세요." style="width:300px;">
			</div>
			<div>
			<input name="startDate" type="hidden" value="${obj.getStartDate()}">
			<input name="endDate" type="hidden" value="${obj.getEndDate()}">
			<h4>내용</h4>
			<textarea name="memo" rows="5" placeholder="100자 이내로 입력해주세요." style="width:300px;height:100px;"></textarea>
			</div>
			<div>
			<br>
			</div>
		</form>
		<button onclick="click_ok();" >추가</button>
	</div>
</div>
</body>
</html>