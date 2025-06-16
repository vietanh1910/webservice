<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String token = (String) session.getAttribute("token");
%>
<html>
<head><title>Home</title></head>
<body>
<h2>Xin chào!</h2>
<p>JWT Token của bạn:</p>
<textarea rows="5" cols="80"><%= token %></textarea>
</body>
</html>
