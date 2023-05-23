<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="container">
			<form action="updateOk.do" method="post">
				<h2>
					<input type="text" name="title" value="${board.title }">
				</h2>
				<input type = "hidden" name = "bno" value = "${board.bno }">
				<table class = "table table-boardered table table-hover">
					<tr>
						<td>번호</td>
						<td>${board.bno }</td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td>${board.writer }</td>
					</tr>
					
					<tr>
						<td>작성일</td>
						<td>${board.regdate }</td>
					</tr>
					
					<tr>
						<td colspan="2"><b>내용</b></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="150" name = "content">${board.content }</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기">
						</td>
					</tr>
				</table>
			</form>
			<button onclick="history.back()">이전으로</button>
			<button onclick="location.href = 'list.do'">목록으로</button>
		</div>
	</div>
</body>
</html>