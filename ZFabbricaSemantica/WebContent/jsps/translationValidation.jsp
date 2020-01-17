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
	<%@taglib uri="taglib1" prefix="utility" %>
	
	<jsp:useBean id="test" scope="session" class="beans.Test"></jsp:useBean>

	<utility:pagesUpdate currentPage="translationValidation.jsp"/>


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
	<form action="../TasksHandler" method="get">
		<input type="radio" name="translation" value="espandere"> Espandere<br>
		<input type="radio" name="translation" value="creare_debito"> Creare debito<br>
		<input type="radio" name="translation" value="allontanare"> Allontanare<br>
		<input type="radio" name="translation" value="istanziare"> Istanziare<br>
		<input type="radio" name="translation" value="nessuna" checked> Nessuna<br><br><br>
		
		<input type="hidden" name="currentPage" value="translationValidation.jsp"/>
		<input type="hidden" name="correctChoice" value="espandere"/>
		<input type="hidden" name="button" value="NEXT"/>
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
		<input type="hidden" name="currentPage" value="translationValidation.jsp"/>
		<input type="hidden" name="button" value="SKIP"/>
		<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>

</body></center>
</html>