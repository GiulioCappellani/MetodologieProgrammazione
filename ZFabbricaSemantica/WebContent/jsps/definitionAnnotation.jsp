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
	<%@taglib uri="taglib1" prefix="utility" %>

	<jsp:useBean id="test" scope="session" class="beans.Test"></jsp:useBean>

	<utility:pagesUpdate currentPage="definitionAnnotation.jsp"/>

<br>
	<br>
	<h3><strong>Dai una definizione nella tua lingua madre</strong></h3><br><br>
	<br><h4>
	Data la seguente parola in inglese:<br><br>
	"Bird"<br><br>
	E questi suoi iperonimi:<br><br>
	"Crow", "Eagle", "Pigeon"<br><br><br><br>
	Dai la definizione della parola</h4>
	<br>
	<form action="../TasksHandler" method="get">
		<input type="hidden" name="currentPage" value="definitionAnnotation.jsp"/>
		<textarea rows="2" cols="50" name="word_definition"></textarea><br><br>
		<h4>E di uno dei suoi iperonimi</h4><br>
		<textarea rows="2" cols="50" name="hypernym_definition"></textarea><br><br>
		<input type="hidden" name="button" value="NEXT"/>
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
	<input type="hidden" name="button" value="SKIP"/>
	<input type="hidden" name="currentPage" value="definitionAnnotation.jsp"/>
	<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>
</body></center>
</html>