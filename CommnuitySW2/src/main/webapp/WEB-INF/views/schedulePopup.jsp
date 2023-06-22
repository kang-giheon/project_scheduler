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
<script src="./resources/js/firebaseDB.js"></script>     
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
<script>

var firebaseDatabase;

var app = firebase.initializeApp(firebaseConfig);

var firebaseEmailAuth = app.auth();
const db = app.firestore();
var memail="";

userMailSession()
function userMailSession(){
	   firebaseEmailAuth.onAuthStateChanged(function(user){
		   if(user){ 				    				
				   memail = user.email;
		   }
		   else {
			   memail = "";
		   }
		})
	 }

$.fn.serializeObject = function(){
	var o={};
	var a = this.serializeArray();
	$.each(a,function(){
		var name = $.trim(this.name),
				value = $.trim(this.value);
				
		if(o[name]){
			if(!o[name].push){
				o[name]=[o[name]];
			}
			o[name].push(value || '');
		} else {
			o[name] = value || '';
		}
	});
	return o;
}


async function addDocument(userUID, scheduleData) {
  	
  		try {
    		const collectionRef = db.collection('schedules').doc(userUID).collection('schedule');
    		const newDocumentRef = collectionRef.doc();

    		await newDocumentRef.set(scheduleData);

		    console.log("문서 추가 완료");
		    opener.location.href="./lookup";
		    window.close();
  		} catch (error) {
    		console.error("문서 추가 중 오류 발생:", error);
	  	}
  	
}

function click_ok(){
	if(document.addpopup.subject.value=="" && document.addpopup.memo.value==""){
		alert("제목과 내용을 입력해주세요.");
	}
	else{
		var scheduleData = $('form#scheduleData').serializeObject();
		// 문서 추가 함수 호출 (userUID는 실제 사용자 UID로 대체해야 함)
		addDocument(memail, scheduleData);	
	}
}

async function deleteDocument(userUID, documentID) {
	  try {
	    const documentRef = db.collection('schedules').doc(userUID).collection('schedule').doc(documentID);
	    await documentRef.delete();
	    console.log("문서가 성공적으로 삭제되었습니다.");
	    opener.location.href="./lookup";
	    window.close();
	  } catch (error) {
	    console.error("문서 삭제 중 오류 발생:", error);
	  }
	}
async function fetchDocumentId(userUID, subject,startDate,endDate,memo) {
	  try {
	    const collectionRef = db.collection('schedules').doc(userUID).collection('schedule');
	    const querySnapshot = await collectionRef.where("subject", "==", subject).where("startDate","==",startDate)
	    						.where("endDate","==",endDate).where("memo","==",memo).get();

	    querySnapshot.forEach((documentSnapshot) => {
	      const documentID = documentSnapshot.id;
	      deleteDocument(userUID,documentID);
	    });
	    
	  } catch (error) {
	    console.error("문서 ID 조회 중 오류 발생:", error);
	  } 
}

function update(i){
	var upfrm = document.forms[i];
	console.log(upfrm.memo.value);
	console.log(typeof(upfrm.memo.value));
	upfrm.action="./schedulePopup/update";
	upfrm.submit();
}

function deleteSchedule(i){
	var upfrm = document.forms[i];
	var stDate = upfrm.startDate.value;
	var edDate = upfrm.endDate.value;
	var sub = upfrm.subject.value;
	var memo = upfrm.memo.value;
	fetchDocumentId(memail,sub,stDate,edDate,memo)
}
</script>
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
					<form name="<%=i %>" method="post">
					<input type=hidden name="subject" value='<%=dto.getSubject()%>'><td><%=dto.getSubject() %></td>
					<input type=hidden name="memo" value='<%=dto.getMemo()%>'><td><%=dto.getMemo()%></td>
					<input type=hidden name="startDate" value=<%=dto.getStartDate()%>>
					<input type=hidden name="endDate" value=<%=dto.getEndDate()%>>
					</form>
					<td><button onclick="update('<%=i%>')">수정</button><button onclick="deleteSchedule('<%=i%>')">삭제</button></td>
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
