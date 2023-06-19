<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String pwd2 = request.getParameter("pwd2");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String islunar = request.getParameter("islunar");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

//에러 체크, id가 null인지, 패스워드가 일치하지 않은 지
List<String> errors = new ArrayList();
if(id==null || id.equals("")){ //에러가 있을 때(id를 입력하지 않았거나 비밀번호가 일치하지 않을 때)
	errors.add("아이디를 입력해주세요");
}
if(!pwd.equals(pwd2)){
	errors.add("비밀번호가 일치하지 않습니다");
}else if(pwd==null || pwd.equals("")){
	errors.add("비밀번호를 입력해주세요");	
}

if(errors.size()>0){ //에러가 존재한다면
	//errors를 가지고 request에 담아 nbJoin.jsp로 이동
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("nbJoin.jsp").forward(request, response);
}else{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";

	Class.forName(driver);
	Connection conn = null;
	PreparedStatement pstmt = null;
	conn = DriverManager.getConnection(url, user, pw);

	String sql = "insert into nbmember(id,pwd,name,gender,birth,is_lunar,phone,email,regdate) ";
			sql+="values(?,?,?,?,?,?,?,?,sysdate)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, islunar);
	pstmt.setString(7, phone);
	pstmt.setString(8, email);

	int cnt = pstmt.executeUpdate();
	System.out.println("cnt : "+cnt);
}

response.sendRedirect("../index.jsp");
%>
<%-- <%=gender %>
<%=birth %>
<%=islunar %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>nbJoinProc.jsp</h3>

</body>
</html>