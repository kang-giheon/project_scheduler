<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Scheduler Community</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/main.css">

</head>

<body>

	<c:import url="/WEB-INF/views/menu.jsp"></c:import>

	<div id="container">
		<div class="join-box">
			<div id="loginBoxTitle">회원가입</div>
			<div class="form-group">
				<label>이름</label> <input id="name" type="text" name="username"
					placeholder="이름 입력" class="form-control" style="ime-mode: disabled"
					required autofocus>
			</div>
			<div class="form-group">
				<label>아이디(이메일)</label> <input id="email" type="email" name="email"
					placeholder="이메일 입력" class="form-control" autocomplete="off"
					required>
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input id="password" type="password"
					name="password" placeholder="비밀번호 입력" class="form-control"
					autocomplete="off" required>
			</div>
			<div class="form-group">
				<label>비밀번호 재입력</label> <input id="repassword" type="password"
					name="password" placeholder="비밀번호 재입력" class="form-control"
					autocomplete="off" required>
			</div>
			<div class="form-group">
				<label>전화번호</label> <input id="tel" type="text" name="phone"
					placeholder="전화번호 입력" class="form-control" autocomplete="off"
					required>
			</div>

			<input type="button" id="Join" value="회원가입"
				style="align-items: center; margin-top: 10px; background-color: black; color: white; border-radius: 5px; width: 100%; padding: 10px;">

			<div class="ot-btn">
				<div class="ot-btn-in">
					<span><a href="./login">로그인</a></span>
				</div>
				<div class="ot-btn-in">
					<span><a href="./findID">아이디 찾기</a></span>
				</div>
				<div class="ot-btn-in">
					<span><a href="./findPW">비밀번호 찾기</a></span>
				</div>
			</div>
		</div>
	</div>

	<script src="./resources/js/firebaseDB.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.10.1/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
	<script src="./resources/js/jquery.js"></script>

	<script type="module">
	  // Import the functions you need from the SDKs you need
	  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-app.js";
	  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-analytics.js";
	  import { getFirestore, setDoc, doc } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-firestore.js";
	  import { getDatabase, ref, set, update } from "https://www.gstatic.com/firebasejs/9.1.0/firebase-database.js";
	  // TODO: Add SDKs for Firebase products that you want to use
	  // https://firebase.google.com/docs/web/setup#available-libraries

		var firebaseEmailAuth;
		var firebaseDatabase;
		var userInfo;
		var observers = [];

		// Initialize Firebase
		var app = firebase.initializeApp(firebaseConfig);

	    firebaseEmailAuth = app.auth();
	    firebaseDatabase = app.database();

		const database = getDatabase(app);
		const db = getFirestore(app);

		class Observer {
  			update() {}
		}

		// Observable 클래스
class RegistrationObservable {
  registerObserver(observer) {
    observers.push(observer);
  }

  unregisterObserver(observer) {
    const index = observers.indexOf(observer);
    if (index !== -1) {
      observers.splice(index, 1);
    }
  }

  notifyObservers(data) {
    observers.forEach((observer) => {
      observer.update(data);
    });
  }
}

// 구체적인 Observer 클래스
class RegistrationSuccessObserver extends Observer {
  update(data) {
    // 가입 성공 처리
    joinDB(data.name, data.email, data.password, data.tel);
  }
}

class RegistrationErrorObserver extends Observer {
  update(data) {
    // 가입 오류 처리
    const errorMessage = data.message;
    if (errorMessage === "The email address is already in use by another account.") {
      alert("이미 존재하는 이메일입니다.");
    } else if (errorMessage === "Password should be at least 6 characters") {
      alert("비밀번호는 6자리 이상이어야 합니다.");
    }
  }
}

// Observer 인스턴스 생성
const successObserver = new RegistrationSuccessObserver();
const errorObserver = new RegistrationErrorObserver();

// Observer를 Observable에 등록
const registrationObservable = new RegistrationObservable();
registrationObservable.registerObserver(successObserver);
registrationObservable.registerObserver(errorObserver);

// jQuery
$(document).ready(function () {
  // 가입 버튼 눌렀을 때 작동하는 함수
  $(document).on("click", "#Join", function () {
    // jQuery를 이용해서 입력된 값을 가져온다.
    var email = $("#email").val().toString();
    var password = $("#password").val().toString();
    var repassword = $("#repassword").val().toString();
    var name = $("#name").val().toString();
    var tel = $("#tel").val().toString();

    if (email !== "" && password !== "" && repassword !== "" && name !== "" && tel !== "") {
      if (password === repassword) {
        // 이메일로 가입 버튼 눌렀을 때 작동되는 함수 - Firebase 인증 모듈
        firebaseEmailAuth.createUserWithEmailAndPassword(email, password)
          .then(function (user) {
            userInfo = user; // 가입 후 callBack 함수로 생성된 유저의 정보가 user에 담겨서 넘어온다. 전역변수에 할당.
            const data = { name: name, email: email, password: password, tel: tel };
            registrationObservable.notifyObservers(data);
          })
          .catch(function (error) {
            const errorMessage = error.message;
            const data = { message: errorMessage };
            registrationObservable.notifyObservers(data);
          });
      } else {
        alert("비밀번호가 일치하지 않습니다.");
      }
    } else {
      alert("모든 항목을 입력해주세요!");
    }
  });
});

function joinDB(name, email, password, tel) {
  firebaseEmailAuth.onAuthStateChanged(async (user) => {
    console.log(user.uid);
    var data = { username: name, email: email, password: password, tel: tel };
    const res = await db.collection("users").doc(user.uid).set(data);
    firebaseEmailAuth.signOut().then(function () {
      window.location.href = "/controller";
    });
  });

  alert("가입 성공");
}

	</script>
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/tether.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/perfect-scrollbar.min.js"></script>
	<script src="./resources/js/common.js"></script>
</body>
</html>