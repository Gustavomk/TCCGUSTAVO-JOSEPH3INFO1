<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Inicio.css">
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
		if ($_POST) {
	$linha = $_POST['linha'];
	}
	else{
		$linha = '3';
	}
	    $querymap = "select Cord_Inicio , Parada from percurso, paradas where percurso.idPercurso = paradas.percurso_idPercurso and idPercurso = $linha;";
	$resultmap = mysqli_query( $link, $querymap ) or die('Falha, Por favor reinicie a pagina e tente novamente');
		
		$addr = array();
		
		while ( $rowmap = mysqli_fetch_assoc( $resultmap ) ) {
			$tabelamap[] = $rowmap;
			}
		if ($tabelamap) { 
			foreach($tabelamap as $colunamap) {	

		$saddr= $colunamap["Cord_Inicio"];
		

		$daddr= $colunamap["Parada"];

		array_push($addr,$daddr);
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
			<li><a href="Passagem.php">Passagens</a></li>
			<li><a href="Busca.php">Busca</a></li>
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
					<h1>Principais Linhas</h1>
					</br>
					  <label for="linhas"><p id="lel">Escolha Linha</p></label>
					<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
					  <select name="linha" id="pamonhaslinha">
					<optgroup>
						<option value="1" name="linha">Linha1</option>
						<option value="2" name="linha">Linha2</option>
						<option value="3" name="linha">Linha3</option>
						<option value="4" name="linha">Linha4</option>
					</optgroup>
					  </select>
					  <input type="submit" value="Ver Mapa" class="botao">
					</form>
					</br>
					</br>
					<p id="lel"><?php echo 'Linha'.$linha;?></p>
	     			 <iframe src="https://maps.google.com/maps?saddr=<?php echo $saddr;?>&daddr=<?php echo $addr[0]; foreach($addr as $cordmap){ echo '+to:'.$cordmap;}?>&output=embed" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
					</br>
					</br>
					</br>
					</br>
					<h1>Notícias</h1>
					</br>
					<p class="t1">Nenhuma Noticia.</p>
				</div>
		</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>