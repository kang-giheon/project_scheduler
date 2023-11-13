<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="../resources/js/firebaseDB.js"></script>     
    <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
<script>
// Initialize Firebase
var app = firebase.initializeApp(firebaseConfig);

var firebaseEmailAuth = app.auth();
//Firestore DB 가져오기
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

async function updateDocument(userUID, documentID, newData) {
	  try {
	    const documentRef = db.collection('schedules').doc(userUID).collection('schedule').doc(documentID);
	    
	    // 문서 데이터 업데이트
	    await documentRef.update(newData);
		
	    
	    console.log("문서 수정 완료");
	    opener.location.href="../lookup";
	    opener.parent.location.reload();
	    window.close();
	  } catch (error) {
	    console.error("문서 수정 중 오류 발생:", error);
	  }
}


async function fetchDocumentId(userUID, subject,startDate,endDate,memo,newData) {
	  try {
	    const collectionRef = db.collection('schedules').doc(userUID).collection('schedule');
	    const querySnapshot = await collectionRef.where("subject", "==", subject).where("startDate","==",startDate)
	    						.where("endDate","==",endDate).where("memo","==",memo).get();

	    querySnapshot.forEach((documentSnapshot) => {
	      const documentID = documentSnapshot.id;
	      updateDocument(userUID,documentID,newData);
	    });
	  } catch (error) {
	    console.error("문서 ID 조회 중 오류 발생:", error);
	  } 
}

function check(){
	const sbj='${obj.getSubject()}';
	const strDate='${obj.getStartDate()}';
	const edDate='${obj.getEndDate()}';
	const mem='${obj.getMemo()}';
	const newSub=document.getElementsByName('subject')[0].value;
	const newStr=document.getElementsByName('startDate')[0].value;
	const newEnd=document.getElementsByName('endDate')[0].value;
	const newMem=document.getElementsByName('memo')[0].value;
	const newData = {subject : newSub, startDate : newStr, endDate : newEnd, memo : newMem };
	console.log(newData);
	fetchDocumentId(memail,sbj,strDate,edDate,mem,newData);
}
</script>
</head>
<body>
<h3>일정 수정</h3>
	<div>
		<form name="addpopup" id="scheduleData">
			<div>
			<h4>제목</h4>
			<input name="subject" value="${obj.getSubject()}" style="width:300px;">
			</div>
			<div>
			<input name="startDate" type="hidden" value="${obj.getStartDate()}">
			<input name="endDate" type="hidden" value="${obj.getEndDate()}">
			<h4>내용</h4>
			<textarea name="memo" rows="5" style="width:300px;height:100px;">${obj.getMemo()}</textarea>
			</div>
			<div>
			<br>
			</div>
		</form>
		<button onclick="check();" >추가</button>
	</div>

</body>
</html>