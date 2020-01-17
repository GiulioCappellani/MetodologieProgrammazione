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
<style>
		table { width: 600px; background-color: #FFFFFF; color: #000000; border-color: #5BB8CC; border-collapse: collapse; }
		th, td { width: 25px; }
	</style>
<title>Task</title>
</head>
<body><center>
	<%@taglib uri="taglib1" prefix="utility" %>
	
	<jsp:useBean id="test" scope="session" class="beans.Test"></jsp:useBean>

	<utility:pagesUpdate currentPage="myAnnotation.jsp"/>
	
	<br><br><br><br><br>
	
	<h2><strong>Associa ai termini ai giusti linguaggi contestuali</strong></h2><br><br>
	<h4>Alcuni termini potrebbero avere piu risposte corrette</h4>
	<br><br><br>
	<form action="../TasksHandler" method="get">
	<table border="5" cellspacing="5" cellpadding="5" align="center">
		<tr><th></th><th><center>"Factor"</center></th><th><center>"Mate"</center></th><th><center>"Regard"</center></th><th><center>"Dumb"</center></th></tr>
		
		<tr><th>Formale</th><td><center><input type="checkbox" name="11" value="11"/></center></td><td><center><input type="checkbox" name="12" value="12"/></center></td>
					<td><center><input type="checkbox" name="13" value="13"/></center></td><td><center><input type="checkbox" name="14" value="14"/></center></td></tr>
		
		<tr><th>Amichevole</th><td><center><input type="checkbox" name="21" value="21"/></center></td><td><center><input type="checkbox" name="22" value="22"/></center></td>
					<td><center><input type="checkbox" name="23" value="23"/></center></td><td><center><input type="checkbox" name="24" value="24"/></center></td></tr>
		
		<tr><th>Slang</th><td><center><input type="checkbox" name="31" value="11"/></center></td><td><center><input type="checkbox" name="32" value="12"/></center></td>
					<td><center><input type="checkbox" name="33" value="33"/></center></td><td><center><input type="checkbox" name="34" value="34"/></center></td></tr>
		
		<tr><th>Accademico</th><td><center><input type="checkbox" name="41" value="11"/></center></td><td><center><input type="checkbox" name="42" value="12"/></center></td>
					<td><center><input type="checkbox" name="43" value="43"/></center></td><td><center><input type="checkbox" name="44" value="44"/></center></td></tr>
	</table><br><br>
	
	<input type="hidden" name="currentPage" value="myAnnotation.jsp"/>
	<input type="hidden" name="button" value="NEXT"/>
	<input type="hidden" name="correctChoice1" value="13">
	<input type="hidden" name="correctChoice2" value="22">
	<input type="hidden" name="correctChoice3" value="32">
	<input type="hidden" name="correctChoice4" value="34">
	<input type="hidden" name="correctChoice5" value="41">
	<input type="hidden" name="correctChoice6" value="43">
	
	<input type="submit" value="NEXT"/>
	</form>
	<br><br>
	<form action="../TasksHandler" method="get">
	<input type="hidden" name="currentPage" value="myAnnotation.jsp"/>
	<input type="hidden" name="button" value="SKIP"/>
	<input type="submit" value="SKIP"/>
	</form>
	
	<br><br>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>
	
	
</body></center>
</html>