<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// logout.jsp가 호출되면서 바로 실행됨
	window.onload = function() {
		alert("로그아웃");
		location.href = "../main/index.do";
	}
</script>
</head>
<body>

</body>
</html>