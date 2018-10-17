<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function checkIdClose() {
		opener.writeForm.id.value = "${ id }";		
		/** opener : 현재 브라우저 기준, 열려있는 부모 브라우저 */
		window.close();
		opener.writeForm.pwd.focus();
	}
</script>
</head>
<body>
<form action="../member/checkId.do">
	<c:if test="${ isExist }">
		<p>${ id }는 사용중입니다.</p>
		<div>
			<label>아이디</label>
			<input type="text" name="id">
			<input type="submit" value="중복체크">
		</div>
	</c:if>
	<c:if test="${ !isExist }">
		<p>${ id }는 사용가능합니다.</p>
		<input type="button" value="사용" onclick="checkIdClose()">
	</c:if>
</form>
</body>
</html>