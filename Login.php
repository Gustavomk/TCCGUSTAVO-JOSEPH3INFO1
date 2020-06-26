<?php
session_start();
?>
<html>
<head>
	<title>Login</title>
	<meta charset="utf-8">
</head>
<body>
	<link rel="stylesheet" type="text/css" href="login.css">
<nav id="menu">
<ul>	
	<li><a href="projetotcchome.php">HOME</a></li>
	<li><a href="Register.php">CADASTRO</a></li>
</ul>
<form action="login.php" method="post">
	<div class="">
		<label for="uname"><b>Username</b></label>
			<input type="text" name="uname" placeholder="Username" required>
		<label for="password"><b>Password</b></label>
			<input type="password" placeholder="Password" name="password">
		<button name="login" type="submit">login</button>
			<input type="checkbox" checked="checked" name="remember"> Remember me</label>
		<div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
	</div>
</nav>
<?php

$dbservername = 'localhost';
$dbusername = 'root';
$dbpassword= '';
$dbdatabase = 'usuarios';

    $connect = mysqli_connect ($dbservername, $dbusername, $dbpassword, $dbdatabase);

    if (mysqli_connect_error()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
if (isset ($_POST['login'])) {
    $email = mysqli_real_escape_string ($connect, $_POST['uname']);
    $senha = mysqli_real_escape_string ($connect, $_POST ['password']);
    $sel_user = "select id from cadastro where uname = '$email' AND senha = '$senha'";
    $run_user = mysqli_query ($connect, $sel_user);
    $check_user = mysqli_num_rows($run_user);
    if ($check_user == 1 )  {
        $_SESSION ['login_user'] = $email;
        header ("location: localhost/tcc_da_quarentena/projetotcchome.php");
    }
    else {
        echo "Email or password is not correct, try again’";
    }
}
?>
</body>
</html>