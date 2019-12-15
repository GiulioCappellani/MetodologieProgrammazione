<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Info</title>
<style>
		table { width: 600px; background-color: #FFFFFF; color: #000000; border-color: #5BB8CC; border-collapse: collapse; }
		th, td { width: 25px; }
</style>
</head>
<body><center>
<%@page import="java.util.*" %>
<%@page import="classes.*" %>
<br><br><br><br><br>
	<%
	Utente u=(Utente)request.getSession().getAttribute("utente");
	ArrayList<String> linguePreferite=(ArrayList<String>)u.getLinguePreferite();
	ArrayList<String> lingueAggiuntive=(ArrayList<String>)u.getLingueAggiuntive();
	ArrayList<Test> tests=(ArrayList<Test>)u.getTests();
	%>
	<h2><strong>Le tue informazioni</strong></h2><br>
	<br><br>
	<h3>Email: <%=u.getEmail()%>
	<br><br>
	Lingue Preferite: 
	<%
	for (int i=0; i<linguePreferite.size(); i++){
	%>
	<%=" "+linguePreferite.get(i)+(i==linguePreferite.size()-1 ? " " : ", ") %>
	<%} %>
	<br><br>
	Lingue Aggiuntive: 
	<%
	for (int i=0; i<lingueAggiuntive.size(); i++){
	%>
	<%=" "+lingueAggiuntive.get(i).split("-")[0]+" "+lingueAggiuntive.get(i).split("-")[1]+(i==lingueAggiuntive.size()-1 ? " " : ", ") %>
	<%} %>
	</h3>
	<br><br><br>
	<h2><strong>I tuoi Test</strong></h2>
	<br><br><br>
	<%
	if (tests.isEmpty()){
		%>
		<h5>Nessun test effettuato<br>
		Vai alla home per iniziarne subito uno!</h5>
		<br><br>
		<%
	}
	else{
		for (int i=0; i<tests.size(); i++){
			Test t=tests.get(i);
		%>
		<h3>Test <%= Integer.toString(i+1) %></h3><br>
		<br>
		<table border="5" cellspacing="5" cellpadding="5" align="center">
			<tr><th><center>Sezione</center></th><th><center>Punteggio/Risposta</center></th></tr>
			<tr><th><center>Definition Annotation<br>(Word Definition)</center></th><td><center><%=t.getDAWD() %></center></td></tr>
			<tr><th><center>Definition Annotation<br>(Hypernym Definition)</center></th><td><center><%=t.getDAHD() %></center></td></tr>
			<tr><th><center>My Annotation</center></th><td><center><%=Integer.toString(t.getMA())+"/6" %></center></td></tr>
			<tr><th><center>Sense Annotation</center></th><td><center><%=Integer.toString(t.getSA())+"/1" %></center></td></tr>
			<tr><th><center>Sense Validation</center></th><td><center><%=Integer.toString(t.getSV())+"/1" %></center></td></tr>
			<tr><th><center>Translation Annotation</center></th><td><center><%=t.getTA() %></center></td></tr>
			<tr><th><center>Translation Validation</center></th><td><center><%=Integer.toString(t.getTV())+"/1" %></center></td></tr>
			<tr><th><center>Word Annotation</center></th><td><center><%=t.getWA() %></center></td></tr>
		</table>
		<br><br>
		<%}
	}%>
	
	<a href="home.jsp">Torna alla home</a><br>
	<a href="logOut.jsp">LogOut</a>
	<br><br><br><br><br>
</body></center>
</html>