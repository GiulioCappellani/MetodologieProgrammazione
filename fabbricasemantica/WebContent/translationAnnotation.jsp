<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task</title>
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
</head>
<body><center>
<%@page import="java.util.*" %>

	<%
	if (request.getSession(false)==null){
		response.sendRedirect("errorePaginaProtetta.html");
		return;}
	%>
	
	<p align="center">
	<br>
	<br>
	<strong><h3>Data la seguente parola con definizione dai una traduzione nella tua lingua madre:</h3></strong><br>
	<h4>"Expansion"<br>
	Def.: The action of becoming larger or more extensive.</h4><br><br>

	<%	
		String thisPage="translationAnnotation.jsp";
	
		ArrayList<String> allPages=new ArrayList<String>();
		allPages.add("senseAnnotation.jsp");
		allPages.add("definitionAnnotation.jsp");
		allPages.add("translationValidation.jsp");
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
		<textarea rows="2" cols="50" name="definition"></textarea><br><br>
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
	</p>
</body></center>
</html>