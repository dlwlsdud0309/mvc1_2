<%@page import="nb.dao.NoticeBoardsDao"%>
<%@page import="nb.vo.NoticeBoards"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<%
String title = request.getParameter("title");
String loginId = (String)session.getAttribute("sessionId");
String content = request.getParameter("content");

NoticeBoards nb = new NoticeBoards();
nb.setTitle(title);
nb.setWriter(loginId);
nb.setContent(content);

NoticeBoardsDao dao = new NoticeBoardsDao();
int resultNum = dao.insert(nb);

/* //db연결하여 insert
Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
conn = DriverManager.getConnection(url, user, pw);

String sql = "insert into noticeboards(seq, title, writer, content, regdate, hit)";
		sql+= " values((select max(seq)+1 from noticeboards)";
		sql+= ", ?, ?, ?, systimestamp, 0)";
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, title);
pstmt.setString(2, loginId);
pstmt.setString(3, content);

int resultNum = pstmt.executeUpdate();
System.out.println("resultNum : "+resultNum); */

if(resultNum>0){
	response.sendRedirect("noticeboards.jsp");
}
%>

</body>
</html>