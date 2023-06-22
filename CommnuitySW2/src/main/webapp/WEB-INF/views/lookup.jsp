<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
	<script src="./resources/js/firebaseDB.js"></script>     
    <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>
	<script>
	
	var firebaseDatabase;

	// Initialize Firebase
	var app = firebase.initializeApp(firebaseConfig);

	var firebaseEmailAuth = app.auth();
    const db = app.firestore();
	let documents;
	
	function userSession(){
 	   firebaseEmailAuth.onAuthStateChanged(function(user){
 		   if(user){
 				   
 				   memail = user.email;
 				   fetchAllDocuments(memail,param1);  
 		   }
 		   else {
 			       memail="null";
 			     fetchAllDocuments(memail,param1);
 		   }
 		})
 	 }
	
	function insertMemberInfo(getMemberInfo,param1) {
		 	var frmPop= document.frmPopup;
		    frmPop.action = './schedule'; 
		    frmPop.target = '_self'; 
		    frmPop.arg1.value = JSON.stringify(getMemberInfo);
		    frmPop.arg2.value = param1;
		    frmPop.submit();    
		}
	
	async function fetchAllDocuments(userUID,param1) {
  		try {
   		// 문서 쿼리 실행
   		const querySnapshot = await db.collection('schedules').doc(userUID).collection('schedule').get();
    		
    		// 쿼리 결과에서 모든 문서 가져오기
        documents = querySnapshot.docs.map((doc) => doc.data());
   		 // 문서 출력 또는 처리
   		console.log('문서 조회 완료');
   		console.log(userUID);
    	insertMemberInfo(documents,param1);
  		} catch (error) {
   		 console.error('문서 조회 중 오류 발생:', error);
  		}
	}
		// 문서 조회 함수 호출 (userUID는 실제 사용자 UID로 대체해야 함)
			const urlParams = new URLSearchParams(window.location.search);
			const param1 = urlParams.get('param1'); // value1
			userSession(param1);
	</script>
<body>
	<form name="frmPopup" method="post">
	<input type="hidden" name="arg1">
	<input type="hidden" name="arg2">
	</form>
</body>
</html>