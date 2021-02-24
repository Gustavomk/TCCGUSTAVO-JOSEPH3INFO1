<!DOCTYPE html>
<html>
<head>
	<title>Comprar Passagens</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Passagem.css">
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
    error_reporting(E_ERROR | E_WARNING);
	if ($_POST['linha']) {
	$linha = $_POST['linha'];
	}
	else{
		$linha = rand (1, 8);
	}
	if ($_POST['paymethod']) {
	$pay = $_POST['paymethod'];
	}
	else{
		$pay = '';
	}


	    $querymap = "select Cord_Inicio , nome_percurso , Parada from percurso, paradas where percurso.idPercurso = paradas.percurso_idPercurso and idPercurso = $linha;";
	$resultmap = mysqli_query( $link, $querymap ) or die('Falha, Por favor reinicie a pagina e tente novamente');
		
		$addr = array();
		
		while ( $rowmap = mysqli_fetch_assoc( $resultmap ) ) {
			$tabelamap[] = $rowmap;
			}
		if ($tabelamap) { 
			foreach($tabelamap as $colunamap) {	

		$saddr= $colunamap["Cord_Inicio"];
		
		$NomePer = $colunamap["nome_percurso"];

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
			<li><a href="Inicio.php">Inicio</a></li>
			<li><a href="Busca.php">Busca</a></li>
			<li><a href="Usuario.php">Perfil</a></li>

		</ul>		
	</nav>
	</div>
	</div>

<div class="box1">
 <img class="img" src="../Imagens/Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="tudo">
</br>
		<div class="tudodireita">
			<fieldset class="linhas"><legend>Linhas</legend>
			<p id="lel"><?php echo 'Mostrando a Linha: '. $NomePer;?></p>
				<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
  <label for="linhas"><p id="lel">Escolha a Linha</p></label>
  <select name="linha" id="pamonhaslinha">
	<optgroup>
		<option value="1" name="linha">Araquari (Ida)</option>
		<option value="2" name="linha">Araquari (Volta)</option>
		<option value="3" name="linha">Trevo (Ida)</option>
		<option value="4" name="linha">Trevo (Volta)</option>
		<option value="5" name="linha">São Francisco do Sul (Ida)</option>
		<option value="6" name="linha">São Francisco do Sul (Volta)</option>
		<option value="7" name="linha">Porto Grande (Ida)</option>
		<option value="8" name="linha">Porto Grande (Volta)</option>						
	</optgroup>
  </select>
  <input type="submit" value="Ver Mapa" class="botao">
</form>
				<form method="post" action="Compra.php">
   <p id="lel">Forma de pagamento</p>
   <p id="lel"><?php if ($pay) { echo "$pay";}?></p>
  <input type="radio" name="paymethod" value="PayPal" id="lel">PayPal</input><br/><br/>
  <input type="radio" name="paymethod" value="Boleto" id="lel">Boleto</input><br/><br/>
  <input type="radio" name="paymethod" value="Cartão de Credito" id="lel">Cartão de Credito</input><br/><br/>
  <input type="submit" value="comprar" class="botao">
</form>
</fieldset>
</div>
<div class="tudoesquerda">
	      <iframe src="https://maps.google.com/maps?saddr=<?php echo $saddr;?>&daddr=<?php echo $addr[0]; foreach($addr as $cordmap){ echo '+to:'.$cordmap;}?>&output=embed" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

</div>



</body>
</html>