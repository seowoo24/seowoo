<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/boardScript.js"></script>
</head>
<body>
<form action="../board/boardWrite.do" name="boardWriteForm" method="post">
	<table border="1">
		<tr>
			<th width="50px">제목</th>
			<td width="350px"><input type="text" name="subject" style="width: 350px;"></td>
		</tr>
		<tr>
			<th width="50px">내용</th>
			<td width="350px"><textarea name="content" rows="15" cols="45" style="width: 350px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글쓰기" onclick="checkBoardWrite()">
				<input type="reset" value="다시 작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>