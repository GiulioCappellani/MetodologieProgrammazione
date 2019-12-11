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

<body><center>
	<%@page import="java.util.*" %>
	<br><br><br><br><br>
	
	<h2><strong>Associa ai termini ai giusti linguaggi contestuali</strong></h2><br><br>
	<h4>Alcuni termini potrebbero avere piu risposte corrette</h4>
	<br><br><br>
	
	
	<%	
	
		if (request.getSession(false)==null){
			response.sendRedirect("errorePaginaProtetta.html");
			return;}
	
		String thisPage="myAnnotation.jsp";
	
		ArrayList<String> allPages=new ArrayList<String>();
		allPages.add("definitionAnnotation.jsp");
		allPages.add("translationAnnotation.jsp");
		allPages.add("translationValidation.jsp");
		allPages.add("wordAnnotation.jsp");
		allPages.add("senseValidatio.jsp");
		allPages.add("senseAnnotation.jsp");
		
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
	<style>
		table { width: 600px; background-color: #FFFFFF; color: #000000; border-color: #5BB8CC; border-collapse: collapse; }
		th, td { width: 25px; }
	</style>
	<table border="5" cellspacing="5" cellpadding="5" align="center">
		<tr><th></th><th><center>"Factor"</center></th><th><center>"Mate"</center></th><th><center>"Regard"</center></th><th><center>"Dumb"</center></th></tr>
		
		<tr><th>Formale</th><td><center><input type="checkbox" name="11" value="11"/></center></td><td><center><input type="checkbox" name="12" value="12"/></center></td>
					<td><center><input type="checkbox" name="13" value="13"/></center></td><td><center><input type="checkbox" name="14" value="14"/></center></td></tr>
		
		<tr><th>Amichevole</th><td><center><input type="checkbox" name="21" value="11"/></center></td><td><center><input type="checkbox" name="22" value="12"/></center></td>
					<td><center><input type="checkbox" name="23" value="23"/></center></td><td><center><input type="checkbox" name="24" value="24"/></center></td></tr>
		
		<tr><th>Slang</th><td><center><input type="checkbox" name="31" value="11"/></center></td><td><center><input type="checkbox" name="32" value="12"/></center></td>
					<td><center><input type="checkbox" name="33" value="33"/></center></td><td><center><input type="checkbox" name="34" value="34"/></center></td></tr>
		
		<tr><th>Accademico</th><td><center><input type="checkbox" name="41" value="11"/></center></td><td><center><input type="checkbox" name="42" value="12"/></center></td>
					<td><center><input type="checkbox" name="43" value="43"/></center></td><td><center><input type="checkbox" name="44" value="44"/></center></td></tr>
	</table><br><br>
	<input type="submit" value="NEXT"/>
	</form><br><br>
	<form action="<%=(isEmpty ? "testCompletato.jsp" : allPages.get(n))%>" method="get">
	<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="home.jsp">Torna alla home</a><br>
	<a href="logOut.jsp">LogOut</a>
	<br><br><br><br><br>



</body></center>
</html>