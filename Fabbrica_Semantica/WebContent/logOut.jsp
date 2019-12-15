<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogOut</title>
</head>
<body>
<%@page import="java.util.*" %>
<%@page import="classes.*" %>
	<%

	HttpSession s=request.getSession(false);
	ServletContext conx=getServletContext();
	
	HashMap<String,Utente> listaUtenti=null;
	
	if (conx.getAttribute("listaUtenti")==null)
		conx.setAttribute("listaUtenti", new HashMap<String,Utente>());
	
	listaUtenti=(HashMap<String,Utente>)conx.getAttribute("listaUtenti");
	
	listaUtenti.replace((String)s.getAttribute("email"), (Utente)s.getAttribute("utente"));
	
	conx.setAttribute("listaUtenti", listaUtenti);
	
	s.invalidate();
	
	response.sendRedirect("index.html");
	%>

</body>
</html>