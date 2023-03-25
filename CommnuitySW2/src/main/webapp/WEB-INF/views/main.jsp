<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Scheduler Community</title>
	<link href="./resources/css/main.css" rel="stylesheet">
</head>
<body>
	<header> 
	<!-- 페이지 타이틀을 클릭하면 메인화면으로 이동 -->
    <div class="head-area">
    	<span class="header"><a href='./'> 
    		<font color="white";> &nbsp Scheduler Community </font></a>
    	</span>
	    <div style="display:inline-block; align:right; text-align:right; position:absolute; top:28px; right:15px;">
	   		<span class="header2"><a href='./login'>
	   			<font color="white">로그인</font></a></span>&nbsp;
	    	<span class="header2"><a href='./join'>
	    			<font color="white">회원가입</font></a></span>&nbsp;
	    	<span class="header2"><a href='./mypage'>
	    			<font color="white">마이페이지</font></a></span>&nbsp;
	    </div>
    </div>
    </header>
    <div>
    	<div class="group-area";>
    		<div>
    			<div class="group1">
    				<div>
    					<h4><font size=5;>카페정보</font></h4>
    					<div>
    						<span style="text-align:center; align:center;">~~~카페 소개글~~~</span>
    					</div>
    				</div>
    			</div>
    			<div class="write">
    				<a href="./write"><font color="white" size=5;>카페 글쓰기</font></a>
    			</div>
    		</div>
	    	<div>
	    		<ul class="group1" style = "margin-top:0px; display:block; height:300px;">
	    			<span class="write2">=게시판=</span>
	    			<li style="padding-left:10px;"><font size=4;><a href='./commu/notice'>- 공지사항</a></font></li>
	    			<li style="padding-left:10px;"><font size=4;><a href='./commu/info'>- 정보게시판</a></font></li>
	    			<li style="padding-left:10px;"><font size=4;><a href='./commu/free'>- 자유게시판</a></font></li>
	    		</ul>
	    	</div>
	    	<div class="group1" style="display:inline-block;";>
	    		<span class="kcal">=오늘 소모한 칼로리=</span>
	    	</div>
		</div>
    	<div class="main-area";>
    		<div class="main-area2";>
    			스케줄러
    		</div>
    		<div>
    			<div class="main-area3";>
    				공지사항
    			</div>
	    		<div class="main-area3";>
	    			자유게시판
	    		</div>
    		</div>
    	</div>
    </div>
    <footer class="footer">
    	<span><font color="white">가장 아래 정보 칸</font></span>
    </footer>

</body>
</html>