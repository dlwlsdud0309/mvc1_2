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
String id = request.getParameter("id");
String pass = request.getParameter("pass");

//db접속
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, pw);

String sql = "select id,pwd from nbmember where id=?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();
//rs.next();
//System.out.println("id : "+rs.getString("id")+" :: "+"pw : "+rs.getString(2)); //인덱스 1부터 시작


String dbPass = "";
int x = -1;
String msg = "";

if(rs.next()){
	//System.out.println("id 확인");
	dbPass = rs.getString("pwd");
	if(dbPass.equals(pass)){
		x = 1;
		session.setAttribute("sessionId", id);
		msg="../index.jsp";
	}else{
		x = 0;
		msg="loginForm.jsp?msg=0";
	}
}else{
	//System.out.println("id 미확인");
	System.out.println("id 불일치, input id : "+id);
	x = -1;
	msg="loginForm.jsp?msg=-1";
}
System.out.println("x : "+x);

//x값으로 전송위치를 결정
/* if(x==1){
	//로그인에 성공하면 id를 세션에 저장 후 mainpage.jsp로 이동
	session.setAttribute("sessionId", id);
	msg="../index.jsp";
}else if(x==0){
	msg="loginForm.jsp?msg=0";
}else{
	msg="loginForm.jsp?msg=-1";
} */
response.sendRedirect(msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>loginProc.jsp</h3>
</body>
</html>