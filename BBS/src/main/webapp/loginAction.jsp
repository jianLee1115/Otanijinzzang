<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"/>  <%-- 자바빈즈 사용하겠다 ! --%>
<jsp:useProperty name="user" property="user.ID" /> <%-- 로그인페이지에서 넘겨준 유저아이디를 받아서 사용자에 아이디 넣어쭘  --%>
<jsp:useProperty name="user" property="user.Password" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<title>JSP 게시판 웹사이트</title>
</head>
<body>                                                                  
<%
	UserDAO userDAO = new UserDAO(); //인스턴스 생성
	int result = userDAO.login(user.getUserID(), user.getUserPassword()); //사용자가 넣은 아이디,비밀번호를 가지고 함수 발동 
	if (result == 1) { //로그인 성공할 시 
		PrintWriter  script = response. getWriter();
		script.println("<script>");
		script.println("<location.href = 'main.jsp'"); //메인화면으로 이동 
		script.println("</script>");
	}else if (result == 0) {
		PrintWriter  script = response. getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()"); //이전페이지로 이동(로그인페이지 )
		script.println("</script>"); 
	}else if (result == -1) {
		PrintWriter  script = response. getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()"); //이전페이지로 이동
		script.println("</script>"); 
	}else if (result == -2) {
		PrintWriter  script = response. getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()"); //이전페이지로 이동
		script.println("</script>");
		
		
	}



%>


</body>
</html>


