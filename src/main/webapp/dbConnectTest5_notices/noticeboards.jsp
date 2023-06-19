<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
%>

<%
Connection conn=null;
//PreparedStatement pstmt=null;
Statement stmt=null;
ResultSet rs=null;

String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
conn=DriverManager.getConnection(url, user, pw);

String sql="select * from noticeboards order by seq desc";
//pstmt=conn.prepareStatement(sql);
stmt=conn.createStatement();
rs=stmt.executeQuery(sql);
//rs.next();
//System.out.println(rs.getString("title"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>Noticeboards</h3>

<%
if(session.getAttribute("sessionId")==null){
	//response.sendRedirect("../dbConnectTest5_login/loginForm.jsp");
	//return;
	//위의 주석을 해제하면 정상작동하나 로그인하지 않으면 게시글 읽기 자체도 불가능하게 됨
}else{
%>
	<%=session.getAttribute("sessionId") %>님이 로그인하셨습니다.
	<input type="button" value="logout" onclick="logoutProc();" /> <br />
<%
}
%>

<table border="1" width="80%">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("seq") %></td>
		<td>
			<a href="noticeboardsDetail.jsp?no=<%=rs.getInt("seq") %>"><%=rs.getString("title") %></a>
		</td>
		<td><%=rs.getString("writer") %></td>
		<td>
			<%-- <fmt:formatDate value='<%=rs.getTimestamp("regdate") %>' pattern="yyyy-MM-dd"/> --%>
			<%=rs.getDate("regdate") %>
		</td>
		<td><%=rs.getInt("hit") %></td>
	</tr>
<%
	}
%>
</table>
<%
if(session.getAttribute("sessionId")!=null){
%>
	<a href="nbInsertReg.jsp">글쓰기</a>
<%
}else {
%>
	<a href="../dbConnectTest5_login/loginForm.jsp">login</a>
<%
}
%>

<script>
	function logoutProc(){
		location.href="../dbConnectTest5_login/logoutProc.jsp";
	}
</script>
</body>
</html>