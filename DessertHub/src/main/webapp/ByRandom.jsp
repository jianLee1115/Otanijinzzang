<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="Dessert.DessertDAO" %>
<%@ page import="Dessert.DessertVO" %>

<%
    // DessertDAO 객체 생성
    DessertDAO dao = new DessertDAO();
    
    // 랜덤 디저트 1개 가져오기
    DessertVO dessert = dao.getRandom(1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>랜덤 디저트 추천</title>
</head>
<body>
    <h1>랜덤 디저트 추천</h1>
    
    <% if (dessert != null) { %>
        <h2><%= dessert.getdName() %></h2>
        <img src="<%= dessert.getdImg() %>" alt="<%= dessert.getdName() %>" width="300">
        <p><%= dessert.getdChara() %></p>
    <% } else { %>
        <p>추천할 디저트가 없습니다.</p>
    <% } %>
    
    <a href="RecommendDessert.jsp">다시 추천 받기</a>
</body>
</html>
