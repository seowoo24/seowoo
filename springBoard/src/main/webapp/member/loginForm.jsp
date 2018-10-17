<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="../script/memberScript.js"></script>
</head>
<body>
<form action="../member/login.do" method="post" name="loginForm">
<table border="1">
			<tr>
				<th><label>아이디</label></th>
				<td><input type="text" name="id" style="width: 150px;">
			</tr>
			<tr>
				<th><label>비밀번호</label></th>
				<td><input type="password" name="pwd" style="width: 150px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="checkLogin()"> 
					<input type="button" value="회원가입" onclick="location.href = '../member/writeForm.do'">
				</td>
			</tr>
		</table>
</form>
<a href="../main/index.do">메인 화면</a>
</body>
</html>