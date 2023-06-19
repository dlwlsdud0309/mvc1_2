<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="../css/join_style.css" />
</head>
<body>
<h3>nbJoin.jsp</h3>

<p style="color: red;">
<%
if(request.getAttribute("errors")!=null){ //에러가 존재한다면
	List<String> errors=(List)request.getAttribute("errors");
	for(int i=0; i<errors.size(); i++){
	%>
		<%=errors.get(i) %> <br />	
	<%
	}
}
%>
</p>

<!-- noticeboards와 join할 테이블 nbmember 생성 -->
<form action="nbJoinProc.jsp">
	아이디 : <input type="text" name="id" placeholder="아이디를 입력하세요" /> <br />
	비밀번호 : <input type="text" name="pwd" placeholder="비밀번호를 입력하세요" /> <br />
	비밀번호 확인 : <input type="text" name="pwd2" placeholder="비밀번호를 다시 입력하세요" /> <br />
	이름 : <input type="text" name="name" placeholder="이름을 입력하세요" /> <br />
	성별 :
	<select name="gender" id="gender">
		<option value="m">남성</option>
		<option value="w">여성</option>
	</select> <br />
	생년월일 : <input type="date" name="birth" />
		<input type="radio" name="islunar" value="solar" checked /> 양력
		<input type="radio" name="islunar" value="islunar" /> 음력 <br />
	핸드폰 번호 : <input type="tel" name="phone" placeholder="예) 010-1234-5678"/> 예) 010-1234-5678 <br />
	이메일 : <input type="email" name="email" /> <br />
	
	<input class="inputButton" type="submit" value="회원가입" />
	<input class="inputButton" type="button" value="취소" onclick="location.href='../dbConnectTest5_login/loginForm.jsp'" />
</form>
</body>
</html>