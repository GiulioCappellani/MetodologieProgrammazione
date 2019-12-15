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
<%@page import="classes.*" %>
	<br><br><br><br><br><br><br>
	<h1><strong>Test Completato!</strong></h1>
	<br><br><br><br>
	<%
	((Utente)request.getSession().getAttribute("utente")).addTest( (Test)(request.getSession().getAttribute("test"))); 
	%>
	<a href="home.jsp"><h3>Vai alla Home</h3></a>
	<br>
	<a href="logOut.jsp"><h3>LogOut</h3></a>

</body>
</center>
</html>