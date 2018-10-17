<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
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
<form action="boardModify.do" name="boardModifyForm" method="post">
	<table border="1">
		<tr>
			<th width="50px">제목</th>
			<td width="350px">
				<input type="text" name="subject" style="width: 350px;" value="${ boardDTO.subject }">
			</td>
		</tr>
		<tr>
			<th width="50px">내용</th>
			<td width="350px">
				<textarea name="content" rows="15" cols="45" style="width: 350px;">${ boardDTO.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글수정" onclick="checkBoardModify()">
				<input type="reset" value="다시 작성">
				<input type="button" value="취소" onclick="history.back()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="seq" value="${ seq }">
	<input type="hidden" name="pg" value="${ pg }">
</form>
</body>
</html>


<!-- hidden으로 데이터를 보낼 수 있음 -->