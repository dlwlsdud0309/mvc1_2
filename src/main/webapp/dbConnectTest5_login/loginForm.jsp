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
<h3>loginForm.jsp</h3>
<div id="wrap">
	<form action="loginProc.jsp" method="post" name="logininfo"
	onsubmit="return checkLoginButton();"
	>
		<img src="../img/loginimg.png" alt="login_img" id="wel_img" height="250" />
		<br /> <br />
		<table class="loginTable">
			<tr>
				<td><img class="login_form_img" src="../img/idimg.png" alt="idimg" height="20px" /></td>
				<td>
					<input type="text" name="id" id="id" maxlength="50" placeholder="아이디" />
				</td>
			</tr>
			<tr>
				<td><img class="login_form_img" src="../img/passimg.png" alt="passimg" height="25px" /></td>
				<td>
					<input type="password" name="pass" id="pass" maxlength="50" placeholder="비밀번호" />
				</td>
			</tr>
			<%
				//msg
				String sendMsg=request.getParameter("msg");
				String code1="<tr><td colspan='2' style='text-align:center;'><br><span style='font-weight: bold;'>";
				String code2="</span></tr></td>";
				
				if(sendMsg!=null && sendMsg.equals("0")){
					out.print(code1+"비밀번호 확인"+code2);
				}else if(sendMsg!=null && sendMsg.equals("-1")){
					out.print(code1+"아이디 확인"+code2);
				}
			%>
		</table>
		<br />
		<input class="inputButton" type="submit" value="login" />
		<input class="inputButton" type="button" value="join" onclick="joinForm();"/>
		<input class="inputButton" type="button" value="noticeBoards" onclick="noticeBoards();" />
	</form>
</div>

<script>
	function noticeBoards(){
		location.href="../dbConnectTest5_notices/noticeboards.jsp";
	}

	function joinForm(){
		location.href="../dbConnectTest5_join/nbJoin.jsp";
	}

	function checkLoginButton(){
		//보안에 취약한 eval함수 미사용 권장
		//input=eval("document.logininfo")
		//alert(input.pass.value);
		
		//안티패턴 사용
		var objid = {logininfo:logininfo.id.value};
		var objpass = {logininfo:logininfo.pass.value};
		var property = "logininfo";
		
		//alert(objid[property]); //id값 확인
		//alert(objpass[property]); //pass값 확인
		
		if(!objid[property] || objid[property]==""){
			alert("아이디를 입력하세요")
			return false; //login을 눌러도 다음 창으로 넘어가지 않음
		}
		else if(!objpass[property] || objpass==""){
			alert("비밀번호를 입력하세요")
			return false; //login을 눌러도 다음 창으로 넘어가지 않음
		}
		return true; //기본값이 true이므로 생략가능함
	}
</script>
</body>
</html>