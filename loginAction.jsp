<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:useProperty name="user" property="user.ID" />
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
	int result = userDAO.login(user.getUserID(),user.getUserPassword());
	if (result == 1) {
		PrintWriter  script = response. getWriter();
		script.println("<script>");
		script.println("<location.href = 'main.jsp'");
		script.println("</script>");
	}


%>


</body>
</html>


