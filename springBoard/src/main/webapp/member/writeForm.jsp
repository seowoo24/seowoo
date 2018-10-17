<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript" src="../script/memberScript.js"></script>
</head>
<body>
<form action="../member/write.do" method="post" name="writeForm">
<table border="1" width="400px">
	<tr>
		<td width="90" align="center"><label>이름</label></td>
		<td><input type="text" name="name" placeholder="이름 입력" style="width: 310px;"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>아이디</label></td>
		<td>
			<input type="text" name="id" style="width: 230px;">
			<input type="button" value="중복체크" onclick="checkId()">
		</td>		
	</tr>
	<tr>
		<td width="90" align="center"><label>비밀번호</label></td>
		<td><input type="password" name="pwd" style="width: 310px;"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>재확인</label></td>
		<td><input type="password" name="repwd" style="width: 310px;"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>성별</label></td>
		<td>
			<input type="radio" name="gender" value="0" checked>남
			<input type="radio" name="gender" value="1">여
		</td>
	</tr>
	<tr>
		<td width="90" align="center"><label>이메일</label></td>
		<td>
			<input type="text" name="email1"> @ 
			<select name="email2" style="width: 100px;">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hotmail.com">hotmail.com</option>
			</select>
		</td>
	</tr>
	<tr>
	<td width="90" align="center"><label>핸드폰</label></td>
	<td>
		<select name="tel1" style="width: 70px;">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="019">019</option>
		</select> - 
		<input type="text" name="tel2" style="width: 104px;"> - 
		<input type="text" name="tel3" style="width: 105px;">
	</td>
	</tr>
	<tr>
	<td width="90" align="center"><label>주소</label></td>
	<td><input type="text" name="addr" style="width: 310px;"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="button" value="회원가입" onclick="checkWrite()">
		<input type="reset" value="다시작성">
	</td>
	</tr>
</table>
</form>
<a href="../main/index.do">메인 화면</a>
</body>
</html>