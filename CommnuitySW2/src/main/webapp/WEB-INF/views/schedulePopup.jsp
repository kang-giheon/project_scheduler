<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가,수정,삭제</title>
<script type="text/javascript">
	function submit(){
		opener.parents.location.reload();
		window.close();
	};
</script>
</head>
<body>
<h3>${obj.getStartDate()} - ${obj.getEndDate() }까지 일정</h3>
<br>
<div>
	<button type="button" onclick="submit();">추가</button><button>수정</button><button>삭제</button>
</div>
</body>
</html>