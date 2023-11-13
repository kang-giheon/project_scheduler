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
	
	<link rel="stylesheet" href="./resources/css/tab.css">
	
	<style>
		#calendar {
      max-width: 1100px;
      max-height: 600px;
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
	<script src="./resources/js/getSchedule.js"></script>
	<script>
	var app = firebase.initializeApp(firebaseConfig);
	const db = firebase.firestore();
	var firebaseEmailAuth = app.auth();
	
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
	
	async function addMultipleDocuments(documentDataArray) {
		  try {
		    const collectionRef = db.collection('schedules').doc(memail).collection('schedule');


		    const batch = db.batch();

		    documentDataArray.forEach((documentData) => {
		      const newDocumentRef = collectionRef.doc();
		      batch.set(newDocumentRef, documentData);
		    });

		    await batch.commit();
		    

		    console.log("여러 개의 문서를 성공적으로 추가했습니다.");
		    window.location.href="/controller";
		  } catch (error) {
		    console.error("여러 개의 문서 추가 중 오류 발생:", error);
		  }
		}
	
	async function fetchDocumentsBetweenDates(userUID,start,end) {
		  try {
				const collectionRef = db.collection('schedules').doc(userUID).collection('schedule');
				const querySnapshot = await collectionRef.get();
				let documents = new Array();
		   
		    	var i = 0;
				querySnapshot.forEach(async(documentSnapshot) => {
    				const documentData = documentSnapshot.data();
    				const endDate = documentData["endDate"];
    				const startDate = documentData["startDate"];
    				if(startDate<=start && end<=endDate){
    					documentData.color="#ff9f89";
	      				documents[i++] = documentData;
    				}
    				else if(startDate>=start && startDate<end){
    					documentData.color="#ff9f89";
    					documents[i++] = documentData;
    				}
    				else if(endDate>start && endDate<=end){
    					documentData.color="#ff9f89";
    					documents[i++] = documentData;
    				}
		    	});
				console.log(documents.exists);
				addMultipleDocuments(documents);
		    console.log("특정 날짜 문서");
		  } catch (error) {
		    console.error("문서 조회 중 오류 발생:", error);
		  }
	}	
	
	async function getAllFriend(from,to) {
		  var check=1;
		  try {
		    const friendCollectionRef = db.collection("friend");
		    const snapshot = await friendCollectionRef.get();

		    snapshot.forEach((doc) => {
		      if(doc.data().from==from && doc.data().to==to){
		    	  if(doc.data().areWeFriend==true){
		    		  alert("이미 친구입니다.");
		    	  }
		    	  alert("이미 요청을 보냈습니다.");
		    	  check=0;
		      }
		      else if(doc.data().from==to && doc.data().to==from){
		    	  alert("이미 요청을 받았습니다");
		    	  check=0;
		      }
		      
		    });
		    if(check==1){
		    	const newData = {
		  		      from : from,
				      to : to,
				      areWeFriend : false
				    };
		    	addFriendDocument(newData);
		    }
		  } catch (error) {
		    console.error("친구 문서 조회 중 오류 발생:", error);
		  }
		}
	
	async function addFriendDocument(newData) {
		  try {
		    const friendCollectionRef = db.collection("friend");
		    const newFriendDocRef = friendCollectionRef.doc();

		    // 문서 ID를 생성한 후, 해당 ID로 문서를 추가합니다.
		    await newFriendDocRef.set(newData);

		    alert("친구 요청 완료");
		  } catch (error) {
		    console.error("친구 문서 추가 중 오류 발생:", error);
		  }
		}
	
	function findFriend(){
		var friendID = document.getElementById("friendName").value;
		if(friendID==""){
			alert("이메일을 입력해주세요.");
		}
		else if(friendID!=memail){
		db.collection('users').get().then((test) => {
			var check=0;
		      test.forEach((doc) => {
		        var allEmail = doc.data().email;
		        if (allEmail == friendID) {
		        	check+=1;
		        }
		      })
		    if(check==1){
		    	getAllFriend(memail,friendID);
		    }
		    else{
		    	alert("존재하지 않는 이메일입니다.");
		    }
		    })
		}
		else{
			alert("본인의 이메일입니다.");
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
      			if(memail!=""){
      				fetchDocumentsBetweenDates('${friendEmail}',info.startStr,info.endStr);
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
	    <div class="div-lf">
	      <div class="card">
			<div id='calendar' style="position : relative;"></div>
	      </div>
	    </div>
	    <div class="div-rg">
	      <div class="card">
	        <div class="card-block">
	          <h2 class="card-title">친구 추가</h3>
	          	<input type="text" id="friendName" placeholder="이메일을 입력해주세요"><button onclick="findFriend()">요청</button>
	        </div>
	      </div>
	      <div class="card">
	        <div class="card-block">
	        	<div class="container">
	        		<ul class="tab_title">
	        			<li class="on">친구목록</li>
	        			<li>친구요청</li>
	        		</ul>
	        		<div class="tab_cont">
	        			<div class="on" style="overflow:auto;">
	        				<ul style="list-style:none;" id="friendList">
	        				</ul>
	        			</div>
	        			<div style="overflow:auto;">
	        				<ul style="list-style:none;" id="friendRequest">
	        				</ul>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	      </div>
	    </div>
	</div>
</div>
<script>
function share(ID){
	function insertMemberInfo(getMemberInfo) {
	 	var frmPop= document.frmPopup;
	    frmPop.action = './friend'; 
	    frmPop.target = '_self'; 
	    frmPop.arg1.value = JSON.stringify(getMemberInfo);
	    frmPop.arg2.value = ID;
	    frmPop.submit();    
	}

async function fetchAllDocuments(userUID) {
		try {
		// 문서 쿼리 실행
		const querySnapshot = await db.collection('schedules').doc(userUID).collection('schedule').get();
		
		// 쿼리 결과에서 모든 문서 가져오기
    documents = querySnapshot.docs.map((doc) => doc.data());
		 // 문서 출력 또는 처리
		console.log('문서 조회 완료');
	insertMemberInfo(documents);
		} catch (error) {
		 console.error('문서 조회 중 오류 발생:', error);
		}
}
fetchAllDocuments(ID);
}

function friendOK(ID){
	async function updateFriendDocuments(id) {
		  try {
		    const friendCollectionRef = db.collection("friend");
		    const snapshot = await friendCollectionRef
		      .where("areWeFriend", "==", false)
		      .where("from", "==",id )
		      .where("to", "==",memail)
		      .get();

		    snapshot.forEach(async (doc) => {
		      const documentRef = friendCollectionRef.doc(doc.id);
		      await documentRef.update({ areWeFriend: true });
		      location.reload();
		    });

		    console.log("조건에 맞는 친구 문서를 성공적으로 수정했습니다.");
		  } catch (error) {
		    console.error("친구 문서 수정 중 오류 발생:", error);
		  }
		}
	updateFriendDocuments(ID)
}

function friendNO(ID){
	async function deleteFriendDocuments(id) {
		  try {
		    const friendCollectionRef = db.collection("friend");
		    const snapshot = await friendCollectionRef
		      .where("areWeFriend", "==", false)
		      .where("from", "==", id)
		      .where("to", "==", memail)
		      .get();

		    snapshot.forEach(async (doc) => {
		      const documentRef = friendCollectionRef.doc(doc.id);
		      await documentRef.delete();
		      location.reload();
		    });

		    console.log("조건에 맞는 친구 문서를 성공적으로 삭제했습니다.");
		  } catch (error) {
		    console.error("친구 문서 삭제 중 오류 발생:", error);
		  }
		}

		// 문서 삭제 함수 호출
		deleteFriendDocuments(ID);
}

function friendDel(ID,point){
	if(point=="to"){
		deleteFriendDocuments(ID,"from","to");
	}else{
		deleteFriendDocuments(ID,"to","from");
	}
	async function deleteFriendDocuments(id,A,B) {
		  try {
		    const friendCollectionRef = db.collection("friend");
		    const snapshot = await friendCollectionRef
		      .where("areWeFriend", "==", true)
		      .where(A, "==", id)
		      .where(B, "==", memail)
		      .get();

		    snapshot.forEach(async (doc) => {
		      const documentRef = friendCollectionRef.doc(doc.id);
		      await documentRef.delete();
		      location.reload();
		    });

		    console.log("조건에 맞는 친구 문서를 성공적으로 삭제했습니다.");
		  } catch (error) {
		    console.error("친구 문서 삭제 중 오류 발생:", error);
		  }
		}

		// 문서 삭제 함수 호출
}


$(document).ready(function() {
	function friendlist(){
		db.collection('friend').get().then((test) => {
		      test.forEach((doc) => {
		        if (doc.data().areWeFriend == true && doc.data().from == memail) {
		        	let friendList = document.getElementById('friendList');
		        	let list = document.createElement('li');
		        	list.innerHTML=doc.data().to+"  "+"<button onclick=share("+"'"+doc.data().to+"'"+")>공유하기</button> <button onclick=friendDel("+"'"+doc.data().to+"'"+",'from')>친구삭제</button>";
		        	friendList.appendChild(list);
		        	
		        }
		        else if(doc.data().areWeFriend == true && doc.data().to== memail){
		        	let friendList = document.getElementById('friendList');
		        	let list = document.createElement('li');
		        	list.innerHTML=doc.data().from+"  "+"<button onclick=share("+"'"+doc.data().from+"'"+")>공유하기</button> <button onclick=friendDel("+"'"+doc.data().from+"'"+",'to')>친구삭제</button>";
		        	friendList.appendChild(list);
		        }
		        else if(doc.data().areWeFriend == false && doc.data().to== memail){
		        	let friendList = document.getElementById('friendRequest');
		        	let list = document.createElement('li');
		        	list.innerHTML=doc.data().from+"  "+"<button onclick=friendOK("+"'"+doc.data().from+"'"+")>수락</button><button onclick=friendNO("+"'"+doc.data().from+"'"+")>거절</button>";
		        	friendList.appendChild(list);
		        }
		      })
		    })
	}
	  friendlist();
	  $(".tab_title li").click(function() {
	    var idx = $(this).index();
	    $(".tab_title li").removeClass("on");
	    $(".tab_title li").eq(idx).addClass("on");
	    $(".tab_cont > div").hide();
	    $(".tab_cont > div").eq(idx).show();
	  })
	});
</script>

<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/tether.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/perfect-scrollbar.min.js"></script>
<script src="./resources/js/common.js"></script>
<form name="frmPopup" method="post">
	<input type="hidden" name="arg1">
	<input type="hidden" name="arg2">
	<input type="hidden" name="arg3">
	<input type="hidden" name="arg4">
	<input type="hidden" name="arg5">
</form>
</body>
</html>