<!DOCTYPE html>
<html>
<head>
	<title>Perfil do Usuário</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Usuario.css">
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
	$UserId = $_SESSION['user_id'];
	$query = "select id_Usuario, nome_completo, login, email, sexo, telefone, data_nasc, Descricao from usuario, tipo_usuario where tipo_usuario.Usuario_id_Usuario = usuario.id_Usuario and id_Usuario = '$UserId';";
	$result = mysqli_query( $link, $query ) or die('Falha, Por favor reinicie a pagina e tente novamente');
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
			<li><a href="Busca.php">Busca</a></li>

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
	<img class="perfil" src="perfil.jpg" alt="Imagem de Perfil" title="Imagem de Perfil">
	<div class="Box2_1_1">
	<?php
		while ( $row = mysqli_fetch_assoc( $result ) ) {
	$tabela[] = $row;
	}

if ($tabela) { //Check if there are any rows to be displayed
	//Retrieve each element of the array
	foreach($tabela as $coluna) {
	

	?>
<p><?php echo $coluna["nome_completo"] ?></p>

<p><?php echo $coluna["login"] ?></p>

<p><?php echo $coluna["email"] ?></p>

<p><?php echo $coluna["sexo"] ?></p>

<p><?php echo $coluna["telefone"] ?></p>

<p><?php echo $coluna["data_nasc"] ?></p>

<p><?php echo $coluna["Descricao"] ?></p>

<h2><a href="Edicao.php">Clique aqui para editar seu usuário!</a></h2>

<h2><a href="Delete.php">Clique se deseja excluir seu usuário!</a></h2>
	<?php

	}
	}

?>
</div>
</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>