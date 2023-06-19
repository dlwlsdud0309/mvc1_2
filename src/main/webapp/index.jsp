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
<h3>index.jsp</h3>
<%
if(session.getAttribute("sessionId")==null){ //로그인이 안 된 상태
	response.sendRedirect("dbConnectTest5_login/loginForm.jsp");
	return;
}else { //로그인 된 상태
%>
	<%=session.getAttribute("sessionId") %>님이 로그인하셨습니다.
	<input type="button" value="logout" onclick="logoutProc();" /> <br />
	<a href="./dbConnectTest5_notices/noticeboards.jsp">noticeBoards</a>
<%
}
%>
<br />

<script>
	function logoutProc(){
		location.href="./dbConnectTest5_login/logoutProc.jsp";
	}
</script>
</body>
</html>