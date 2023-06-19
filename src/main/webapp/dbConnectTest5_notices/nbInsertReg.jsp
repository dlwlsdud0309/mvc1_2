<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>nbInsertReg.jsp</h3>
<form action="nbInsertPro.jsp" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="title" placeholder="제목을 입력하세요"/>
		</dt>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtfile" />
		</dt>
	</dl>
	<div>
		<textarea name="content" id="txtcontent" class="txtcontent" placeholder="내용을 입력하세요"></textarea>
	</div>
	<input type="submit" value="insert" />
</form>
</body>
</html>