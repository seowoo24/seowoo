<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {

		if(${ su } > 0) {
			alert("회원가입되었습니다.");
		} else {
			alert("가입이 실패했습니다.");
		}
		
		location.href = "../main/index.do";
	}
</script>
</head>
<body>

</body>
</html>