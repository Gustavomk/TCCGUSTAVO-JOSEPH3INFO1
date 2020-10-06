<!DOCTYPE html>
<html>
<head>
	<title>Busca</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Busca.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 
    session_start();
	function isLoggedIn()
	{
	if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true)
	{
	return false;
	}
	return true;
	}
	if (!isLoggedIn())
	{
	header('Location: Login.php');
	}

    $busca = $_POST['tBusca'];
    ?>
	<div class="header">
	<nav id="nav">
		<ul>
			<li><a href="Logout.php">Sair</a></li>
		</ul>
	</nav>

	<h1>BusHelper</h1>
		<div class="header_1">

		<nav id="nav_1">
	<ul>
			<li><a href="Inicio.php">Inicio</a></li>
			<li><a href="Passagem.php">Passagens</a></li>
			<li><a href="Usuario.php">Perfil</a></li>

		</ul>		
	</nav>
	</div>
	</div>

	<div class="box1">
 <img class="img" src="Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
</br>
		<div class="Box2_1">
			<div class="Box2_1_1">
				<h1>Resultado(s) da Busca</h1>
				</br>

				<p class="t1"> </p>
				</br>

  		    </div>
		</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>