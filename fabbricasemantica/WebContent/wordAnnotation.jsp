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
	
	<br>
	<br>
	<h3><strong>Indovina il termine...</strong></h3><br>
	<br><h4>
	Def.:<br> 
	A three-dimensional representation usually of a person, animal, or mythical being<br>
	that is produced by sculpturing, modeling, or casting<br><br></h4>
	
	<%	
		String thisPage="wordAnnotation.jsp";
	
		ArrayList<String> allPages=new ArrayList<String>();
		allPages.add("senseAnnotation.jsp");
		allPages.add("translationAnnotation.jsp");
		allPages.add("translationValidation.jsp");
		allPages.add("definitionAnnotation.jsp");
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
		<input type="textarea" name="definition"/><br><br>
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