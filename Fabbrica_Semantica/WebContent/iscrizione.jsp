<html>
<head>
<meta charset="ISO-8859-1">
<title>Iscriviti</title>
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
<body>
<br><br><center>
	<strong><h2>Iscriviti al nostro servizio!</h2></strong>
	<br><br>
	<form action="signIn.jsp" method="get">
		Indirizzo e-mail: <input type="email" name="email"/><br><br>
		Password: <input type="password" name="password"/><br><br>
		Ripeti la password: <input type="password" name="password_ripetuta"><br>
		<br><br>
		<strong><h3>Dicci di piu su di te</h3></strong><br>
		<br>
		<strong>In quali di queste lingue ti definiresti particolarmente esperto?</strong><br><br>
		<input type="checkbox" name="Spagnolo" value="spagnolo"/> Spagnolo
		<input type="checkbox" name="Francese" value="francese"/> Francese
		<input type="checkbox" name="Inglese" value="inglese"/> Inglese
		<input type="checkbox" name="Tedesco" value="tedesco"/> Tedesco
		<input type="checkbox" name="Italiano" value="italiano"/> Italiano
		<br>
		<br>
		<br>
		<strong>Ne hai altre?</strong><br><br>
		Lingua: <input type="textarea" name="lingua_aggiuntiva1">
		<br>
		Livello: 
		<input type="radio" name="LV_lingua_aggiuntiva1" value="A1"/> A1
		<input type="radio" name="LV_lingua_aggiuntiva1" value="A2"/> A2
		<input type="radio" name="LV_lingua_aggiuntiva1" value="B1"/> B1
		<input type="radio" name="LV_lingua_aggiuntiva1" value="B2"/> B2
		<input type="radio" name="LV_lingua_aggiuntiva1" value="C1"/> C1
		<input type="radio" name="LV_lingua_aggiuntiva1" value="C2"/> C2
		<br>
		<br>
		Lingua: <input type="textarea" name="lingua_aggiuntiva2">
		<br>
		Livello: 
		<input type="radio" name="LV_lingua_aggiuntiva2" value="A1"/> A1
		<input type="radio" name="LV_lingua_aggiuntiva2" value="A2"/> A2
		<input type="radio" name="LV_lingua_aggiuntiva2" value="B1"/> B1
		<input type="radio" name="LV_lingua_aggiuntiva2" value="B2"/> B2
		<input type="radio" name="LV_lingua_aggiuntiva2" value="C1"/> C1
		<input type="radio" name="LV_lingua_aggiuntiva2" value="C2"/> C2
		<br>
		<br>
		<input type="submit" value="SignUp"/><br><br>
	</form>
	<a href="index.html">Ritorna al LogIn</a><br><br><br>
	
</body>
</center>
</html>