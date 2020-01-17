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

	<utility:pagesUpdate currentPage="senseAnnotation.jsp"/>
	
	<br><br>
	<h3><strong>Seleziona la giusta interpretazione</strong></h3><br><br>
	<br><h4>
	Data la seguente frase, scegli, secondo il contesto, la giusta traduzione del termine:<br><br>
	<strong>"Trim"</strong><br><br><br>
	"We had more than a hundred pages of proposals,<br>
	and Parliament managed to <strong>trim</strong> this proposal down to three pages".
	</h4>
	<br>
	<br>
	<form action="../TasksHandler" method="get">
		<input type="checkbox" name="translation1" value="1"> To cut down something<br>
		<input type="checkbox" name="translation2" value="2"> To reduce the volume<br>
		<input type="checkbox" name="translation3" value="3"> To regulate the caratteristics of an object<br>
		<input type="checkbox" name="translation4" value="4"> To decorate<br><br><br>
		
		<input type="hidden" name="currentPage" value="senseAnnotation.jsp"/>
		<input type="hidden" name="button" value="NEXT"/>
		<input type="hidden" name="correctChoice" value="translation2">
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
		<input type="hidden" name="currentPage" value="senseAnnotation.jsp"/>
		<input type="hidden" name="button" value="SKIP"/>
		<input type="submit" value="SKIP"/>
	</form>
	
	
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>

	
</body></center>
</html>