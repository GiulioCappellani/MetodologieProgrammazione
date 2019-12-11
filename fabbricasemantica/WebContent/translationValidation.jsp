<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style> 
input[type=button], input[type=submit], input[type=reset] {
  background-color: #5BB8CC;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<title>Task</title>
</head>
<body>
<center>
<%@page import="java.util.*" %>

	<%
	if (request.getSession(false)==null){
		response.sendRedirect("errorePaginaProtetta.html");
		return;}
	%>
	
	<br>
	<br>
	<h3><strong>Seleziona la traduzione corretta</strong></h3><br><br>
	<br><h4>
	Data la seguente parola:<br><br>
	<strong>"Spread"</strong><br><br><br>
	E la sua definizione:<br><br>
	"To cover, reach, or have an effect on a wider or increasing area"
	<br>
	<br>
	<br>
	<br>
	Qual è la traduzione corretta?</h4>
	<br>
	<br>
	
	<%	
		String thisPage="translationValidation.jsp";
	
		ArrayList<String> allPages=new ArrayList<String>();
		allPages.add("senseAnnotation.jsp");
		allPages.add("translationAnnotation.jsp");
		allPages.add("definitionAnnotation.jsp");
		allPages.add("wordAnnotation.jsp");
		allPages.add("senseValidatio.jsp");
		allPages.add("myAnnotation.jsp");
		
		HttpSession s=request.getSession(false);
		
		ArrayList<String> viewedPages=(ArrayList<String>)s.getAttribute("viewedPages");
		
		for (int i=0; i<viewedPages.size(); i++)
			allPages.remove(viewedPages.get(i));
		
		viewedPages.add(thisPage);
		s.setAttribute("viewedPages",viewedPages);
		
		boolean isEmpty=allPages.isEmpty();
		
		Random r=new Random();
		int n=0;
		
		if (isEmpty==false)
			if (allPages.size()>1)
				n=r.nextInt(allPages.size()-1);
	%>
	
	<form action="<%=(isEmpty ? "testCompletato.jsp" : allPages.get(n))%>" method="get">
		<input type="checkbox" name="translation" value="espandere"> Espandere<br>
		<input type="checkbox" name="translation" value="creare_debito"> Creare debito<br>
		<input type="checkbox" name="translation" value="allontanare"> Allontanare<br>
		<input type="checkbox" name="translation" value="istanziare"> Istanziare<br>
		<input type="checkbox" name="translation" value="nessuna" checked> Nessuna<br><br><br>
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="<%=(isEmpty ? "testCompletato.jsp" : allPages.get(n))%>" method="get">
		<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="home.jsp">Torna alla home</a><br>
	<a href="logOut.jsp">LogOut</a>
	<br><br><br><br><br>

</body></center>
</html>