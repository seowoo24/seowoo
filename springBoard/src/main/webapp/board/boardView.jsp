<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보 기</title>
</head>
<body>
	<table border="1" cellpadding="5">
		<tr>
			<td colspan="3" style="background-color: Mediumseagreen">
				<font size="5">${ boardDTO.subject }</font>
			</td>
		</tr>
		<tr>
			<td width="150">글번호 : ${ boardDTO.seq }</td>
			<td width="150">작성자 : ${ boardDTO.name }</td>
			<td width="150">조회수 : ${ boardDTO.hit }</td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top" style="background-color: palegreen">
				<pre>${ boardDTO.content }</pre>			<!-- pre : 쓴대로 보여주는 태그 -->
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='boardList.do?pg=${ pg }'">
	<c:if test="${ sessionScope.memId == boardDTO.id }">
	<input type="button" value="수정" onclick="location.href='boardModifyForm.do?seq=${ seq }&pg=${ pg }'">
	<input type="button" value="삭제" onclick="location.href='boardDelete.do?seq=${ seq }&pg=${ pg }'">
	</c:if>
</body>
</html>