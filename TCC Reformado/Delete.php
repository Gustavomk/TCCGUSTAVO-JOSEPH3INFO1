<!DOCTYPE html>
<html>
<head>
	<title>Perfil do Usuário</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Delete.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 
if ($_POST) {
	    $query1 = "select id_usuario from usuario order by id_usuario desc limit 1;";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result1 ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_usuario"];
		$query2 = "DELETE FROM tipo_usuario WHERE Usuario_id_Usuario = '$id_usuario';";
		$result2 = mysqli_query( $link, $query2 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
	  	$query3 = "DELETE FROM usuario WHERE id_Usuario = '$id_usuario';";
		$result3 = mysqli_query( $link, $query3 ) or die('Falha 3, Por favor reinicie a pagina e tente novamente');
	}
	}
		header('location:Cadastro.php');
}

    ?>
	<div class="header">
	<nav id="nav">
		<ul>
			<li><a href="Cadastro.php">Sair</a></li>
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
	<div class="Box2_1_1">
<p class="t1">AVISO! Ao excluir seu usuario ele será excluido para sempre! (muito tempo!)</p>
<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
	<input type="hidden" name="sim" value="sim">
        <input type="submit" value="Excluir Usuario!" id="Editar">
</div>
</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>