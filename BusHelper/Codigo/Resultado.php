<!DOCTYPE html>
<html>
<head>
	<title>Busca</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Resultado.css">
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
    $busca = $_POST['tBusca'];
    $queryBusca1 = "SELECT nome_uf from uf Where nome_uf LIKE '%$busca%';";
		$resultBusca1 = mysqli_query( $link, $queryBusca1 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
    $queryBusca2 = "SELECT nome_cidade from  cidade Where nome_cidade LIKE '%$busca%';";
		$resultBusca2 = mysqli_query( $link, $queryBusca2 ) or die('Falha 3, Por favor reinicie a pagina e tente novamente');
    $queryBusca3 = "SELECT nome_bairros from  bairros Where nome_bairros LIKE '%$busca%';";
		$resultBusca3 = mysqli_query( $link, $queryBusca3 ) or die('Falha 4, Por favor reinicie a pagina e tente novamente');
	$queryBusca4 = "SELECT nome_rua from ruas Where nome_rua LIKE '%$busca%';";
		$resultBusca4 = mysqli_query( $link, $queryBusca4 ) or die('Falha 5, Por favor reinicie a pagina e tente novamente');	    
	$queryBusca5 = "SELECT nome_onibus from onibus Where nome_onibus LIKE '%$busca%';";
		$resultBusca5 = mysqli_query( $link, $queryBusca5 ) or die('Falha 6, Por favor reinicie a pagina e tente novamente');	    

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
				<h1>Resultado(s) da Busca</h1>
			</br>
				<?php
				error_reporting(E_ERROR | E_WARNING);
				while ( $rowBusca1 = mysqli_fetch_assoc( $resultBusca1 ) ) {
			$tabelaBusca1[] = $rowBusca1;
			}
							if ($tabelaBusca1) { 
								?><h2>Estados</h2><?php
			foreach($tabelaBusca1 as $colunaBusca1) {	?>

<p><?php echo $colunaBusca1["nome_uf"] ?></p>

	<?php
}
}

				while ( $rowBusca2 = mysqli_fetch_assoc( $resultBusca2 ) ) {
			$tabelaBusca2[] = $rowBusca2;
			}
							if ($tabelaBusca2) { 
								?><h2>Cidades</h2><?php
			foreach($tabelaBusca2 as $colunaBusca2) {	?>

<p><?php echo $colunaBusca2["nome_cidade"] ?></p>

	<?php
}
}

				while ( $rowBusca3 = mysqli_fetch_assoc( $resultBusca3 ) ) {
			$tabelaBusca3[] = $rowBusca3;
			}
							if ($tabelaBusca3) { 
								?><h2>Bairros</h2><?php
			foreach($tabelaBusca3 as $colunaBusca3) {	?>

<p><?php echo $colunaBusca3["nome_bairros"] ?></p>

	<?php
}
}

				while ( $rowBusca4 = mysqli_fetch_assoc( $resultBusca4 ) ) {
			$tabelaBusca4[] = $rowBusca4;
			}
							if ($tabelaBusca4) { 
								?><h2>Ruas</h2><?php
			foreach($tabelaBusca4 as $colunaBusca4) {	?>

<p><?php echo $colunaBusca4["nome_rua"] ?></p>

	<?php
}
}

				while ( $rowBusca5 = mysqli_fetch_assoc( $resultBusca5 ) ) {
			$tabelaBusca5[] = $rowBusca5;
			}
							if ($tabelaBusca5) { 
								?><h2>Onibus</h2><?php
			foreach($tabelaBusca5 as $colunaBusca5) {	?>

<p><?php echo $colunaBusca5["nome_onibus"] ?></p>

	<?php
}
}
	?>
				</br>
				<a id="Voltar" href="Busca.php">Voltar</a>
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