<!DOCTYPE html>
<html>
<head>
	<title>Perfil do Usuário</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Delete.css">
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
if ($_POST) {
	    $query1 = "INSERT INTO `user_desativado`(`iduser_desativado`, `nome_completo`, `login`, `email`, `senha`, `sexo`, `telefone`, `CNH_Motorista`, `tipo_carteira`, `data_nasc`, `Descricao`) SELECT `id_Usuario`, `nome_completo`, `login`, `email`, `senha`, `sexo`, `telefone`, `CNH_Motorista`, `tipo_carteira`, `data_nasc`, Descricao FROM usuario, tipo_usuario WHERE id_Usuario = '$UserId' GROUP BY id_Usuario;";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');	
		$id_usuario = $coluna["id_usuario"];
		$query2 = "DELETE FROM tipo_usuario WHERE Usuario_id_Usuario = '$UserId';";
		$result2 = mysqli_query( $link, $query2 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
	  	$query3 = "DELETE FROM usuario WHERE id_Usuario = '$UserId';";
		$result3 = mysqli_query( $link, $query3 ) or die('Falha 3, Por favor reinicie a pagina e tente novamente');
		header('location:Logout.php');
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
			<li><a href="Busca.php">Busca</a></li>

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