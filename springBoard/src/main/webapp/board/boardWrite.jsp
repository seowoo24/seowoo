<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
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
			alert("작성하신 글을 저장하였습니다.");
			location.href = "../board/boardList.do?pg=1";
		} else {
			alert("작성하신 글을 저장하지 못하였습니다.");
			location.href = "../board/boardWriteForm.do";
		}
	}
</script>
</head>
<body>
	
</body>
</html>