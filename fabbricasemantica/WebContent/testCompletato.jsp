<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test Completato!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<center>
<%@page import="java.util.*" %>
	<br><br><br><br><br><br><br>
	<h1><strong>Test Completato!</strong></h1>
	<br><br><br><br>
	<%
	if (request.getSession(false)==null){
		response.sendRedirect("errorePaginaProtetta.html");
		return;
	}

	HttpSession s=request.getSession(false);
	s.setAttribute("viewedPages", new ArrayList<String>());
	%>
	<a href="home.jsp"><h3>Iniziane un altro        </h3></a>
	<a href="logOut.jsp"><h3>LogOut</h3></a>

</body>
</center>
</html>