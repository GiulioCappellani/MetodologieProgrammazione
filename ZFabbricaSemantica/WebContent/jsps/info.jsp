<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Info</title>
<style>
		table { width: 600px; background-color: #FFFFFF; color: #000000; border-color: #5BB8CC; border-collapse: collapse; }
		th, td { width: 25px; }
</style>
</head>
<body><center>
	<%@taglib uri="taglib1" prefix="utilities" %>
	<utilities:printLanguagesInfo/>
	<utilities:printUserTests> </utilities:printUserTests>
	<a href="../BackHome">Torna alla home</a><br>
	<a href="../LogOut">LogOut</a>
	<br><br><br><br><br>
</body></center>
</html>