<!DOCTYPE html>
<html>
<head>
	<title>Comprar Passagens</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Passagem.css">
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
	$pay = $_POST['paymethod'];
	}
	else{

		$pay = '';
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
 <img class="img" src="Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="tudo">
</br>
		<div class="tudodireita">


   <p id="lel">Forma de pagamento</p>
   <p id="lel"><?php if ($pay) { echo "$pay";}?></p>
<?php
if ($pay == 'paypal'){
 ?>
<form method="post" action="">
	<p class="t2">Login</br> <input type="text" name="tLogin" id="input" size="45"
  maxlength="45" placeholder="login" type="cLogin" /> </p>

			<p class="t2">Senha </br> <input type="text" name="tSenha" id="input" size="45"
  maxlength="45" placeholder="senha" type="cSenha" /> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
elseif ($pay == 'boleto') {
	?>
	<form method="post" action="">
	<p class="t2">Nome Completo</br> <input type="text" name="tNome" id="input" size="45"
  maxlength="45" placeholder="Nome Completo" type="cNome" /> </p>

    <p>Telefone: <input type="tel" id="input" name="tFone" placeholder="99999-9999" pattern="^\d{5}-\d{4}$"  /> </p>


  	<p class="t2">Email </br> <input type="text" name="tEmail" id="input" size="45"
  maxlength="45" placeholder="email@email.com" type="cEmail" /> </p>

  	<p>CPF <input type="tel" id="input" name="tcpf" placeholder="12345678912-34" pattern="^\d{11}-\d{2}$"  /> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
elseif ($pay == 'cartao de credito') {
	?>
	<form method="post" action="">
	<p class="t2">Conta Bancaria</br> <input type="text" name="tConta" id="input" size="45"
  maxlength="45" placeholder="Conta Bancaria" type="cConta" /> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
?>
</fieldset>
</div>
<div class="tudoesquerda">
	      <iframe src="https://maps.google.com/maps?saddr=<?php echo $saddr;?>&daddr=<?php echo $addr[0]; foreach($addr as $cordmap){ echo '+to:'.$cordmap;}?>&output=embed" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

</div>



</body>
</html>