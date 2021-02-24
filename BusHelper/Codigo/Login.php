<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Login.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 


    ?>
	<div class="header">
	<nav id="nav">
		<ul>
			<li><a href="Cadastro.php">Cadastre-se</a></li>
		</ul>
	</nav>
	<h1>BusHelper</h1>
	</div>
	<div class="box1">
 <img class="img" src="../Imagens/Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
	</br>
	</br>
		<h1>Coloque suas credenciais aqui para entrar no site!</h1>
	</br>
	<?php
	if ($_POST) {
		$login = $_POST['tNome'];
		$senha = $_POST['tSenha'];
		if ($login) {

		$query = "SELECT id_Usuario, login FROM usuario WHERE login LIKE '$login';";
		$result = mysqli_query( $link, $query ) or die ("Falha no Sistema!");
		$user = mysqli_fetch_array($result);
		if ($user) {
			$query2 = "SELECT id_Usuario, login, senha FROM usuario WHERE senha LIKE '$senha' and login LIKE '$login';";
			$result2 = mysqli_query( $link, $query2 ) or die ("Falha no Sistema!");
			$pass = mysqli_fetch_array($result2);
			if ($pass) {
				session_start();
					$_SESSION['logged_in'] = true;
					$_SESSION['user_id'] = $user['id_Usuario'];
					$_SESSION['user_name'] = $user['login'];
				header("location:Inicio.php");
			}
			else {
			?> <script>
			alert(Senha Incorreta)
			</script>
			<?php
			}
		}
		else {
			?> <Script>
			alert(Nome de usuario incorreto)
			</script>
			<?php
		}
	}
}
?>
</br>
		<div class="Box2_1">
			<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<fieldset id="login"><legend>Entrar</legend>
  	<p class="t2">Nome de Usuario </br> <input type="text" name="tNome" id="input" size="90"
  		maxlength="100" type="cEmail" required/> </p>

   	<p class="t2">Senha </br> <input type="password" name="tSenha" id="input" size="90"
 		maxlength="100" type="cSenha" required/> </p>

 		      <input type="submit" value="Entrar!" id="Log">
 		  </fieldset>


</div>

	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>