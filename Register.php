<!DOCTYPE html>
<?php
session_start();
?>
<html>
<head>
	<title>Register</title>
	<meta charset="utf-8">
</head>
<body>

	
	<link rel="stylesheet" type="text/css" href="Register.css">
	<nav id="menu">
<ul>
	<li><a href="projetotcchome.php">HOME</a></li>
	<li><a href="Login.php">LOGIN</a></li>
</ul>
</nav>
<form action="Register.php" method="post">
	<div class="Register">
		<label for="email"><b>Email</b></label>
			<input type="text" name="email" placeholder="username@email.com">
		<label for="uname"><b>Username</b></label>
			<input type="text" name="uname" placeholder="Username">
		<label for="password"><b>Password</b></label>
			<input type="password" name="password" placeholder="Password">
		<label for="password-repeat"><b>Repeat Password</b></label>
    		<input type="password-repeat" placeholder="Repeat Password" name="password-repeat" required>
    	<label>
      		<input type="checkbox" checked="checked" name="remember" style="margin-bottom:10px"> Remember me
    	</label>
	</div>

	<div>
		<button type="button" class="cancelbtn">Cancel</button>
    	<button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div></form>
 <?php 
$dbservername = 'localhost';
$dbusername = 'root';
$dbpassword= '';
$dbdatabase = 'usuarios';
$connect = mysqli_connect ($dbservername, $dbusername, $dbpassword, $dbdatabase);
$resultemail = mysqli_querry  ("Select count(email) from usuarios where email = $_Post[email];");
$resultuname = mysqli_querry  ("Select count(login) from usuarios where login = $_Post[uname];");

	if ($resultemail == 1) {
	print("ja existe");
}elseif ($_Post['email'] == "" || $_Post['email'] == null) {
	print("n tem nada aki");
}
	elseif (!ereg('^([a-zA-Z0-9.-_])*([@])([a-z0-9]).([a-z]{2,3})',$email)){
		$mensagem='E-mail Inv&aacute;lido!';
		return $mensagem;
    }
    else{
		//Valida o dominio
		$dominio=explode('@',$email);
		if(!checkdnsrr($dominio[1],'A')){
			$mensagem='E-mail Inv&aacute;lido!';
			return $mensagem;
		}
		else{return true;
		}
		if($resultuname == 1){
		print("ja existe");
}elseif($_Post[uname] == "" || $_Post[uname] == null){
		print("n tem nada ae");
		if($resultuname == 0){
		print("usuario valido");
}elseif ($_Post[password] == $_Post[password-repeat]) {
		
mysqli_querry ("insert Into (username , senha , email) from usuarios values ('$_Post[uname]' , '$_Post[password]' , '$_Post[email]'" );
}elseif ($_Post[password] != $_Post[password-repeat]) {
	print("senha ta diferente");
}else{
	print("deu merda");
}
?>
</body>
</html>