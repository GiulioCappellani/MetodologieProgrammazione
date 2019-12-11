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
	<h2><strong>Verifica il contesto</strong></h2>
	<br><br><br>
	<h3>Data la seguente parola</h3><br><br>
	<h3><strong>"Issue"</strong></h3><br>
	<br><br>
	<h3>E la seguente frase:</h3><br><br>
	<h3>"To be, or not to be? that is the <strong>issue</strong>"</h3><br>
	<br><br>
	<h3>Pensi che la parola sia stata correttamente utilizzata?</h3><br>
	<br>
	<%	
	
		if (request.getSession(false)==null){
			response.sendRedirect("errorePaginaProtetta.html");
			return;}
	
		String thisPage="senseValidatio.jsp";
	
		ArrayList<String> allPages=new ArrayList<String>();
		allPages.add("definitionAnnotation.jsp");
		allPages.add("translationAnnotation.jsp");
		allPages.add("translationValidation.jsp");
		allPages.add("wordAnnotation.jsp");
		allPages.add("senseAnnotation.jsp");
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
		<input type="radio" name="SV" value="si"/>Si
		<input type="radio" name="SV" value="no" checked/>No
		<br><br>
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