<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style> 
input[type=button], input[type=submit], input[type=reset] {
  background-color: #5BB8CC;
  border: none;
  color: white;
  padding: 32px 64px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body><center>
<br><br><br><br><br>

	<h2><strong>&Egrave; bello rivederti!</strong></h2><br><br>
	<h3>Inizia subito il tuo test</h3><br><br><br>
	<%@page import="java.util.*" %>
	<% 
	ArrayList<String> allPages=new ArrayList<String>();
	allPages.add("senseAnnotation.jsp");
	allPages.add("translationAnnotation.jsp");
	allPages.add("translationValidation.jsp");
	allPages.add("wordAnnotation.jsp");
	allPages.add("definitionAnnotation.jsp");
	allPages.add("myAnnotation.jsp");
	allPages.add("senseValidatio.jsp");
	
	Random r=new Random();
	int n=r.nextInt(allPages.size()-1);
	
	%>
	<form action="<%=allPages.get(n)%>" method="get">
		<input type="submit" value="START!">
	</form>
	<br><br><br>
	<a href="logOut.jsp">LogOut</a>
	
</body></center>
</html>