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
	<%@page import="classes.*" %>
	<%
	
	if (request.getParameter("password").equals(request.getParameter("password_ripetuta"))==false){
		%>
		<h2>Le password non coincidono</h2><br><br><br>
		<a href="iscrizione.jsp"><h2>Riprova</h2></a>
		<%
		return;
	}
	
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	ServletContext conx=getServletContext();
	
	HashMap<String,Utente> listaUtenti=null;
	
	if (conx.getAttribute("listaUtenti")==null)
		conx.setAttribute("listaUtenti", new HashMap<String,Utente>());
	
	listaUtenti=(HashMap<String,Utente>)conx.getAttribute("listaUtenti");
	
	if (listaUtenti.isEmpty()==false)
		if (listaUtenti.containsKey(email)){
			%>
			<h2>Abbiamo un utente gia registrato con questa email</h2><br><br><br>
			<a href="index.html"><h2>Vai al LogIn</h2></a><br><br>
			<a href="iscrizione.jsp"><h2>Riprova</h2></a>
			<%
			return;
	}
	
	Utente u=new Utente(email,password);
	
	ArrayList<String> linguePreferite = new ArrayList<String>();
	ArrayList<String> lingueAggiuntive = new ArrayList<String>();
	
	Enumeration<String> e=request.getParameterNames();
	
	String temp;
	while (e.hasMoreElements()){
		temp=e.nextElement();
		if (request.getParameter(temp)!=null){
			if (temp.equals("Italiano") | temp.equals("Inglese") | temp.equals("Tedesco") | temp.equals("Spagnolo") | temp.equals("Francese"))
				linguePreferite.add(temp);
			else
				if (temp.equals("lingua_aggiuntiva1") | temp.equals("lingua_aggiuntiva2"))
					lingueAggiuntive.add(request.getParameter(temp)+"-LV:"+request.getParameter( (temp.equals("lingua_aggiuntiva1") ? "LV_lingua_aggiuntiva1" : "LV_lingua_aggiuntiva2") ));
		}
	}
	u.setLinguePreferite(linguePreferite);
	u.setLingueAggiuntive(lingueAggiuntive);
	
	listaUtenti.put(email,u);
	conx.setAttribute("listaUtenti", listaUtenti);
	
	%>
	
	<h2><strong>Iscrizione avvenuta con successo!</strong></h2><br><br><br>
	<a href="index.html"><h3><strong>Torna al LogIn</strong></h3></a>
	
	

</body></center>
</html>