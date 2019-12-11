<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>LogIn</title>
</head>
<body>
<center>
	<br><br><br><br><br>
<%@page import="java.util.*" %>

	<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	ServletContext conx=getServletContext();
	Enumeration<String> e=conx.getAttributeNames();
	
	String tempUsern;
	while (e.hasMoreElements()){
		tempUsern=e.nextElement().toString();
		if (tempUsern.equals(email)){
			if (conx.getAttribute(tempUsern).equals(password)){
				HttpSession s=request.getSession(true);
				s.setAttribute("viewedPages", new ArrayList<String>());
				response.sendRedirect("home.jsp");
				}
			else
				%>
				<h2>Hai inserito una password errata</h2><br><br><br>
				<a href="index.html"><h2><strong>Riprova</strong></h2></a>
				<%
				return;
		}
	}%>
	<h2>Non abbiamo nessun utente con quest email</h2><br><br><br>
	<a href="index.html"><h2><strong>Riprova</strong></h2></a>

</body>
</center>
</html>