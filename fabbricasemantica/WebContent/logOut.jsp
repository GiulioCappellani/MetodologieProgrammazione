<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogOut</title>
</head>
<body>
	<%

	HttpSession s=request.getSession(false);
	s.invalidate();
	
	response.sendRedirect("index.html");
	%>

</body>
</html>