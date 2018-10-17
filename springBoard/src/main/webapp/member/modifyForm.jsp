<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js"></script>
</head>
<body>
<form action="../member/modify.do" method="post" name="modifyForm">
<table border="1" width="400px">
	<tr>
		<td width="90" align="center"><label>이름</label></td>
		<td><input type="text" name="name" placeholder="이름 입력" style="width: 310px;" value="${ name }"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>아이디</label></td>
		<td><p>${ id }</p></td>		
	</tr>
	<tr>
		<td width="90" align="center"><label>비밀번호</label></td>
		<td><input type="password" name="pwd" style="width: 310px;" value="${ pwd }"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>재확인</label></td>
		<td><input type="password" name="repwd" style="width: 310px;" value="${ pwd }"></td>
	</tr>
	<tr>
		<td width="90" align="center"><label>성별</label></td>
		<td>
			<c:if test="${ gender == '0' }">
				<input type="radio" name="gender" value="0" checked>남
				<input type="radio" name="gender" value="1">여
			</c:if>
			<c:if test="${ gender == '1' }">
			<input type="radio" name="gender" value="0">남
			<input type="radio" name="gender" value="1" checked>여
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="90" align="center"><label>이메일</label></td>
		<td>
			<input type="text" name="email1" value="${ email1 }"> @ 
			<select name="email2" style="width: 100px;">
				<c:if test="${ email2 == 'naver.com' }">
					<option value="naver.com" selected="selected">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hotmail.com">hotmail.com</option>
				</c:if>
				<c:if test="${ email2 == 'daum.net' }">
					<option value="naver.com">naver.com</option>
					<option value="daum.net" selected="selected">daum.net</option>
					<option value="hotmail.com">hotmail.com</option>
				</c:if>
				<c:if test="${ email2 == 'hotmail.com' }">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hotmail.com" selected="selected">hotmail.com</option>
				</c:if>
			</select>
		</td>
	</tr>
	<tr>
	<td width="90" align="center"><label>핸드폰</label></td>
	<td>
		<select name="tel1" style="width: 70px;">
			<c:if test="${ tel1 == '010' }">
				<option value="010" selected="selected">010</option>
				<option value="011">011</option>
				<option value="019">019</option>
			</c:if>
			<c:if test="${ tel1 == '011' }">
				<option value="010">010</option>
				<option value="011" selected="selected">011</option>
				<option value="019">019</option>
			</c:if>			
			<c:if test="${ tel1 == '019' }">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="019" selected="selected">019</option>			
			</c:if>			
		</select> - 
		<input type="text" name="tel2" style="width: 104px;" value="${ tel2 }"> - 
		<input type="text" name="tel3" style="width: 105px;" value="${ tel3 }">
	</td>
	</tr>
	<tr>
	<td width="90" align="center"><label>주소</label></td>
	<td><input type="text" name="addr" style="width: 310px;" value="${ addr }"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="button" value="수정하기" onclick="checkModify()">
		<input type="reset" value="다시작성">
	</td>
	</tr>
</table>
</form>
</body>
</html>