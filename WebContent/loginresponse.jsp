<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="3; url=home.jsp" />
<title>Insert title here</title>
</head>
<body>
<%= request.getAttribute("response") %>
If you are not directed in 3 seconds, please click this <a href="home.jsp">link</a>
</body>
</html>