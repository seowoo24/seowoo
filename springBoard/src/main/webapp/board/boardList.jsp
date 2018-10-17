<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript">

	function isLogin(seq) {
		if(${ sessionScope.memId  == null}) {
			alert("먼저 로그인 하세요.");
		} else {
			location.href="../board/boardView.do?seq=" + seq + "&pg=" + ${ pg };
		}
	}

</script>
<style type="text/css">
	#subjectA:link { color: black; text-decoration: none; }
	#subjectA:visited { color: black; text-decoration: none; }
	#subjectA:achive { color: black; text-decoration: none; }
	#subjectA:hover { color: green; text-decoration: underline; }
	
	.paging { color: purple; text-decoration: none; }
	/* .currentPaging { color: red; text-decoration: underline; } */
</style>
</head>
<body>
<table border="1">
	<tr bgcolor="LightCoral">
		<th width="70">글번호</th>
		<th width="200">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="70">조회수</th>
	</tr>
	<c:forEach var="boardDTO" items="${ list }">
	<tr bgcolor="Thistle" align="center">
		<td>${ boardDTO.seq }</td>
		<td><a href="#" onclick="isLogin(${boardDTO.seq})" id="subjectA">
				${ boardDTO.subject }</a></td>
		<td>${ boardDTO.id }</td>
		<td>${ boardDTO.logtime }</td>
		<td>${ boardDTO.hit }</td>
	</tr>
	</c:forEach>
	<tr bgcolor="LightCoral">
		<td colspan="5" align="center">
			<c:if test="${ startPage > 3 }">
				[<a href="../board/boardList.do?pg=${ startPage - 1 }" class="paging">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }" step="1">
				<c:if test="${ pg == i }">
					[${ i }]
				</c:if>
				<c:if test="${ pg != i }">
					[<a href="../board/boardList.do?pg=${ i }" class="paging">${ i }</a>]
				</c:if>
			</c:forEach>
			<c:if test="${ endPage < totalP }">
				[<a href="../board/boardList.do?pg=${ endPage + 1 }" class="paging">다음</a>]
			</c:if>
		</td>
	</tr>	
</table>
<a href="../main/index.do"><br>메인 화면</a>
</body>
</html>