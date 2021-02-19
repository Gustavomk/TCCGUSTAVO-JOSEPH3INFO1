<!DOCTYPE html>
<html>
<head>
	<title>Cadastro</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="MotoEdicao.css">
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
		while ( $row = mysqli_fetch_assoc( $result ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_Usuario"];
	}
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

				error_reporting(E_ERROR | E_WARNING);
if ($_POST) {
    $tip = $_POST['tTip'];
    $cnh = $_POST['tcnh'];
	    	    $query1 = "select id_usuario from usuario where id_usuario = '$id_usuario';";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result1 ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_usuario"];
		}	
	}
			$query8 = "UPDATE tipo_usuario SET Descricao = 'Motorista' WHERE Usuario_id_usuario = '$id_usuario';";
		        
		    $result8 = mysqli_query( $link, $query8 ) or die('Falha 8, Por favor reinicie a pagina e tente novamente');
	    $query2 = "Update usuario SET  CNH_Motorista = '$cnh', tipo_carteira = '$tip' where id_Usuario = '$id_usuario';";
		$result = mysqli_query( $link, $query2 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
		?>
		<script> 
			alert('Verificaremos a autenticidade dos dados de sua carteira de motorista, no entanto seu Perfil foi alterado com sucesso!');
             window.location.href = "Usuario.php";
	</script>
		<?php
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

</br>
			<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<fieldset id="cadastro"><legend>Cadastro</legend>
				<p class="t1">Parece que você deseja editar o seu perfil para o de um motorista, por favor preencha os dados de sua carteira de motorista.</p>
			<p class="t2">Tipo de Carteira</br> <input type="text" name="tTip" id="input" size="20"
  maxlength="1" placeholder="X" required/> </p>

  			<p class="t2">CNH </br> <input type="text" id="input" name="tcnh" placeholder="01234567890"  maxlength="11" required /> </p>
		</br>
        <input type="submit" value="Cadatrar!" id="Cad">
        
			</fieldset>
		</div>
	</div>
	<?php
		mysqli_close($link)
	?>
</body>
</html>