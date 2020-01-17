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

	<utility:pagesUpdate currentPage="senseValidatio.jsp"/>

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
	<form action="../TasksHandler" method="get">
		<input type="radio" name="SV" value="si"/>Si
		<input type="radio" name="SV" value="no" checked/>No
		<br><br>
		<input type="hidden" name="currentPage" value="senseValidatio.jsp"/>
		<input type="hidden" name="button" value="NEXT"/>
		<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
	<input type="hidden" name="currentPage" value="senseValidatio.jsp"/>
	<input type="hidden" name="button" value="SKIP"/>
	<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>
	

</body></center>
</html>