<!DOCTYPE html>
<html>
<head>
	<title>Busca</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Busca.css">
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
			$Ola = $_SESSION['user_id'];
	    $queryOla = "SELECT id_Usuario, login from usuario Where id_Usuario = '$Ola';";
		$resultOla = mysqli_query( $link, $queryOla ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');	    
    		while ( $rowOla = mysqli_fetch_assoc( $resultOla ) ) {
			$tabelaOla[] = $rowOla;
			}
		if ($tabelaOla) { 
			foreach($tabelaOla as $colunaOla) {	
		$OlaUsuario = $colunaOla["login"];
	}
	}
    ?>
	<div class="header">
	<nav id="nav">
		<ul>
			<li> Olá <?php echo $OlaUsuario; ?>! </li>
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
 <img class="img" src="../Imagens/Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
</br>
		<div class="Box2_1">
			<div class="Box2_1_1">
				<h1>Buscar Linhas, Ônibus e Lugares</h1>
				</br>
				<form method="post" action="Resultado.php">
				<p class="t1">Digite aqui sua Busca </br> <input type="text" name="tBusca" id="input" size="60"
				  maxlength="60" placeholder="Busca" required /> </p>
				</br>
  		        <input type="submit" value="Buscar!" id="Buscar">
  		    </div>
		</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>