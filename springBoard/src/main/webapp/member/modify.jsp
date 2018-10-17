<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
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
	window.onload = function() {
		
		if(${ su } > 0) {
			alert("수정되었습니다.");
		} else {
			alert("수정실패입니다.");
		}
		
		location.href = "../main/index.do";
	}
</script>
</head>
<body>
</body>
</html>