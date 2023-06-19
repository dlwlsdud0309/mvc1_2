<%@page import="nb.dao.NoticeBoardsDao"%>
<%@page import="nb.vo.NoticeBoards"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String num = request.getParameter("no");

if(num==null){
	response.sendRedirect("noticeboards.jsp");
	return;
}

NoticeBoards nb = new NoticeBoards();
nb.setSeq(Integer.parseInt(num));

NoticeBoardsDao dao = new NoticeBoardsDao();
int cnt = dao.delete(nb);

/* String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = null;
conn = DriverManager.getConnection(url, user, pw);
PreparedStatement pstmt = null;

String sql = "delete from noticeboards where seq=?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));

int cnt = pstmt.executeUpdate(); */

if(cnt>0){
	response.sendRedirect("noticeboards.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>noticeboardsDelProc.jsp</h3>

</body>
</html>