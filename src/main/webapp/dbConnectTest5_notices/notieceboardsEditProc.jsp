<%@page import="nb.dao.NoticeBoardsDao"%>
<%@page import="nb.vo.NoticeBoards"%>
<%@page import="java.sql.ResultSet"%>
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
	System.out.println("null");
	response.sendRedirect("noticeboards.jsp");
	return;
	//참조사이트 : https://findmypiece.tistory.com/55
}

String title = request.getParameter("title");
String content = request.getParameter("content");

NoticeBoards nb = new NoticeBoards();
nb.setTitle(title);
nb.setContent(content);
nb.setSeq(Integer.parseInt(num));

NoticeBoardsDao dao = new NoticeBoardsDao();
int cnt = dao.edit(nb);

/* String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = null;
conn = DriverManager.getConnection(url, user, pw);

String sql = "update noticeboards set title=?, content=? where seq=?";

PreparedStatement pstmt = null;
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setInt(3, Integer.parseInt(num));

//ResultSet rs = null;
//rs = pstmt.executeQuery();
//rs.next();

int cnt = pstmt.executeUpdate(); */
if(cnt>0){
	//System.out.println("cnt : "+cnt); //결과값 1
	response.sendRedirect("noticeboardsDetail.jsp?no="+num);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>notieceboardsEditProc.jsp</h3>
<!-- 전달된 value값을 받아 데이터 베이스에서 해당 글을 수정,
페이지 Detail로 이동하여 수정된 상태를 확인하기 -->
<%-- <%=num %> --%>
</body>
</html>