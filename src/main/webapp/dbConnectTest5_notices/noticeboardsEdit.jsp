<%@page import="nb.vo.NoticeBoards"%>
<%@page import="nb.dao.NoticeBoardsDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

NoticeBoardsDao dao = new NoticeBoardsDao();
NoticeBoards nb = dao.getNBD(num);

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, pw);

String sql = "select * from noticeboards where seq=?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));

ResultSet rs = pstmt.executeQuery();
rs.next();


//System.out.println(rs.getString("title"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeboardsEdit.jsp</h3>

<form action="notieceboardsEditProc.jsp" method="post">
	<table class="twidth">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="5%"/>
			<col width="35%"/>
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="left">글번호</th>
				<td><%=nb.getSeq() %></td>
				<th class="left">조회수</th>
				<td><%=nb.getHit() %></td>
			</tr>
			<tr>
				<th class="left">작성자</th>
				<td><%=nb.getWriter() %></td>
				<th class="left">작성일</th>
				<td><%=nb.getRegdate() %></td>
			</tr>
			<tr>
				<th class="left">제목</th>
				<td colspan="3" id="title">
					<textarea class="text" name="title" cols="30"><%=nb.getTitle() %></textarea>
				</td>
			</tr>
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">
					<textarea class="text" name="content" rows="10" cols="30"><%=nb.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th class="left">첨부</th>
				<td colspan="3" id="addfile">첨부</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="no" value="<%=nb.getSeq() %>" />
	<input type="submit" value="수정" />
	<a href="noticeboardsDetail.jsp?no=<%=nb.getSeq() %>">취소</a>
</form>

</body>
</html>