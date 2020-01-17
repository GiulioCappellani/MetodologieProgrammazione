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
	<%@taglib uri="taglib1" prefix="utility" %>

	<jsp:useBean id="test" scope="session" class="beans.Test"></jsp:useBean>

	<utility:pagesUpdate currentPage="translationAnnotation.jsp"/>

	<br><br>
	<h3><strong>Data la seguente parola con definizione dai una traduzione nella tua lingua madre:</strong></h3><br>
	<br><br>
	<h4>"Expansion"<br>
	Def.: The action of becoming larger or more extensive.</h4><br><br>
	<form action="../TasksHandler" method="get">
		<textarea rows="2" cols="50" name="definition"></textarea><br><br>
		<input type="hidden" name="currentPage" value="translationAnnotation.jsp"/>
		<input type="hidden" name="button" value="NEXT"/>
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
		<input type="hidden" name="currentPage" value="translationAnnotation.jsp"/>
		<input type="hidden" name="button" value="SKIP"/>
		<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>
	
</body></center>
</html>