<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Registrazione</title>
</head>
<body><center>
<br><br><br><br><br>
	<%@page import="java.util.*"%>
	<%@page import="java.io.*" %>
	<%
	
	if (request.getParameter("password").equals(request.getParameter("password_ripetuta"))==false){
		%>
		<h2>Le password non coincidono</h2><br><br><br>
		<a href="iscrizione.jsp"><h2>Riprova</h2></a>
		<%
		return;
	}
	
	String email=request.getParameter("email");
	
	ServletContext conx=getServletContext();
	Enumeration<String> conxEnum=conx.getAttributeNames();
	
	String tempUsern;
	while (conxEnum.hasMoreElements()){
		tempUsern=conxEnum.nextElement();
		if (tempUsern.equals(email)){
			%>
			<h2>Abbiamo un utente gia registrato con questa email</h2><br><br><br>
			<a href="index.html"><h2>Vai al LogIn</h2></a><br><br>
			<a href="iscrizione.jsp"><h2>Riprova</h2></a>
			<%
			return;
		}
	}
	conx.setAttribute(email,request.getParameter("password"));
	
	
	Enumeration<String> e=request.getParameterNames();
	ArrayList<String> Lingue_Preferite = new ArrayList<String>();
	ArrayList<String> Lingue_Aggiuntive = new ArrayList<String>();
	
	String temp;
	while (e.hasMoreElements()){
		temp=e.nextElement();
		if (request.getParameter(temp)!=null){
			if (temp.equals("Italiano") | temp.equals("Inglese") | temp.equals("Tedesco") | temp.equals("Spagnolo") | temp.equals("Francese"))
				Lingue_Preferite.add(temp);
			else
				if (temp.equals("lingua_aggiuntiva1") | temp.equals("lingua_aggiuntiva2"))
					Lingue_Aggiuntive.add(request.getParameter(temp)+"-LV:"+request.getParameter( (temp.equals("lingua_aggiuntiva1") ? "LV_lingua_aggiuntiva1" : "LV_lingua_aggiuntiva2") ));
		}
	}
	
	conx.setAttribute(email+"-LINGUE_PREFERITE", Lingue_Preferite);
	conx.setAttribute(email+"-LINGUE_AGGIUNTIVE", Lingue_Aggiuntive);
	
	%>
	
	<h2><strong>Iscrizione avvenuta con successo!</strong></h2><br><br><br>
	<a href="index.html"><h3><strong>Torna al LogIn</strong></h3></a>
	
	

</body></center>
</html>