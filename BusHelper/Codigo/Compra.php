<!DOCTYPE html>
<html>
<head>
	<title>Comprar Passagens</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Compra.css">
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
 <img class="img" src="../Imagens/Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
</br>
<div class="Box2_1">
	<div class="Box2_1_1">
   <p id="lel">Forma de pagamento</p>
   <h2><?php if ($pay) { echo "$pay";}?></h2>
<?php
if ($pay == 'PayPal'){
 ?>
<form method="post" action="Passagem.php">
	<p class="t2">Login</br> <input type="text" name="tLogin" id="input" size="45"
  maxlength="45" placeholder="login" required/> </p>

			<p class="t2">Senha </br> <input type="password" name="tSenha" id="input" size="45"
  maxlength="45" placeholder="senha" required /> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
elseif ($pay == 'Boleto') {
	?>
	<form method="post" action="Passagem.php">
	<p class="t2">Nome Completo</br> <input type="text" name="tNome" id="input" size="45"
  maxlength="45" placeholder="Nome Completo" required /> </p>

   	<p>Telefone: <input type="tel" id="input" name="tFone" placeholder="(99) 99999-9999" pattern="(+^\d{5}+)+ ^\d{5}-\d{4}$" required /> </p>

  	<p class="t2">Email </br> <input type="text" name="tEmail" id="input" size="45"
  maxlength="45" placeholder="email@email.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required /> </p>

  	<p>CPF <input type="text" id="input" name="tcpf" placeholder="123456789-34" pattern="^\d{9}-\d{2}$" required /> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
elseif ($pay == 'Cartão de Credito') {
	?>
	<form method="post" action="Passagem.php">
	<p class="t2">Nome do Titular</br> <input type="text" name="tNomTitu" id="input" size="45"
  maxlength="45" placeholder="Nome" required/> </p>

	<p class="t2">Numero do cartão</br> <input type="text" name="tNumCar" id="input" size="45"
  maxlength="16" placeholder="1234567890123456" pattern="^\d{16}$" required /> </p>

  	<p class="t2">Data de Validade</br> <input type="date" name="tVali" id="input" required/></p>

  		<p class="t2">Codigo de Segurança</br> <input type="text" name="tNumCar" id="input" size="45"
  maxlength="3" placeholder="123" pattern="^\d{3}$" required/> </p>

  <input type="submit" value="comprar" class="botao">
</form>
<?php
}
?>
</fieldset>
</div>
</div>
</div>

</body>
</html>